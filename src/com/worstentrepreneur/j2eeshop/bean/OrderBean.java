package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.*;
import com.worstentrepreneur.utils.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

public class OrderBean {
    public static MergeResult updateShippingAndPayment(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Order entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);

            CustomerSessionHolder sh = CustomerSessionHolder.get(session);
            entity = sh.order;
            Shipping shipping = sh.jpa.selectByID(Shipping.class,TestReq.Int(request,"shipping"));
            Payment payment = sh.jpa.selectByID(Payment.class,TestReq.Int(request,"payment"));
            if(shipping!=null && payment!=null) {
                entity.setShipping(shipping);
                entity.setPayment(payment);
                entity = (Order) sh.jpa.merge(entity);
                sh.order=entity;
            }
            sh.update(session);
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
    public static MergeResult createDefault(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Order entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            CustomerSessionHolder sh = CustomerSessionHolder.get(session);
            int entityID = TestReq.Int(request, "id");
            entity = sh.jpa.selectByID(Order.class, entityID);
            if (entity == null) entity = new Order();

            entity= new Order();
            entity.setDeleted(false);

            //entity.setDateAdd(new Date());
            //entity.setDateUpd(new Date());


            entity = (Order) sh.jpa.merge(entity);
            entity.getProducts(sh.jpa);
            sh.order=entity;
            sh.update(session);
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
    public static MergeResult updateStatus(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Order entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            AdminSessionHolder sh = AdminSessionHolder.get(session);
            int entityID = TestReq.Int(request, "id");
            entity = sh.jpa.selectByID(Order.class, entityID);
            if (entity != null) {
                OrderState state = sh.jpa.selectByID(OrderState.class,TestReq.Int(request,"order-state-id"));
                entity.setCurrentState(state);
                entity = (Order) sh.jpa.merge(entity);
                if(state.isSendEmail()){
                    try{
                        OrderStateLang orderStateLang = state.getLang(sh.getLang(),sh.jpa);
                        String recipientMail = entity.getCustomer().getEmail();
                        Map<String,String> map = new HashMap<>();
                        map.put("\\*\\|INVOICE NUMBER\\|\\*",entity.getInvoiceNumber()+"");
                        SendMailTLS.sendContentInThread(sh.shopSettings.getMailFrom(),recipientMail,orderStateLang.getName(),orderStateLang.getName(),"",state.getEmailTemplate(),map);
                    }catch (Exception e){
                        e.printStackTrace();
                        errors.add(e.getMessage());
                        errors.add("html mail infill");
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
    public static MergeResult completeOrder(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Order entity = null;
        CustomerSessionHolder sh = CustomerSessionHolder.get(session);
        String html = "";
        OrderState orderState = null;
        OrderStateLang orderStateLang = null;
        String recipientMail = null;

        try {
            if(sh.customer!=null)sh.order.setCustomer(sh.customer);
            orderState = sh.jpa.selectOrderStateAfterSubmit();
            orderStateLang = orderState.getLang(sh.getLang(),sh.jpa);
            recipientMail = sh.order.getCustomer().getEmail();
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
            errors.add("orderstate/statelang/recipient mail update");
        }
        try {
            sh.order.setCurrentState(orderState);
            sh.order.setDateAdd(new Date());
            sh.order.setDateUpd(new Date());
            sh.order.setCurrency(sh.userCurrency);
            sh.order.setCurrencyRate(sh.userCurrency.getConversionRate());
            sh.order.setReference("");
            sh.order = (Order) sh.jpa.merge(sh.order);
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
            errors.add("sh.order - entity update");
        }
        try{
            html = MailContent.getOrderContents(sh);
            //SendMailTLS.sendContentInThread(sh.shopSettings.getMailFrom(),recipientMail,orderStateLang.getName(),orderStateLang.getName(),html,orderState.getEmailTemplate());
            Map<String,String> map = new HashMap<>();
            //map.put("\\*\\|TEXT\\|\\*",html);
            //map.put("\\*\\|HEADLINE\\|\\*",orderStateLang.getName());
            map.put("\\*\\|ORDER:TABLE\\|\\*",html);
            map.put("\\*\\|ORDER:ID\\|\\*",sh.order.getId()+"");
            SendMailTLS.sendContentInThread(sh.shopSettings.getMailFrom(),recipientMail,orderStateLang.getName(),orderState.getEmailTemplate(),map);
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
            errors.add("html mail infill");
        }
        try{
            entity=sh.order;
            sh.order=null;
            sh.update(session);

        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
            errors.add("sh.update");
        }
        System.out.println("Errs"+errors.toString());
        return new MergeResult(entity, errors);
    }
}
