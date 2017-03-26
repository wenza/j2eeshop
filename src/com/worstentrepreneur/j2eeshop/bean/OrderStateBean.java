package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.JPAUtil;
import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.Order;
import com.worstentrepreneur.j2eeshop.dao.entity.OrderState;
import com.worstentrepreneur.j2eeshop.dao.entity.OrderStateLang;
import com.worstentrepreneur.j2eeshop.dao.entity.Language;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.CustomerSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

public class OrderStateBean {
    public static void checkDefault(AdminSessionHolder sh){
        /*
         */
        //Awaiting payment
        //Payment accepted
        //Processing in progress
        //Shipped
        //Delivered
        //Canceled
        if(sh.jpa.selectAllByID(OrderState.class).isEmpty()) {
            OrderState processing_in_progress = new OrderState(true, "template", true,
                    false, "#FF8C00", new HashSet<OrderStateLang>(), true, true);
            processing_in_progress = (OrderState) sh.jpa.merge(processing_in_progress);
            sh.jpa.merge(new OrderStateLang(processing_in_progress, sh.getLang(), "Objednávka se připravuje"));


            OrderState shipped = new OrderState(true, "template", true,
                    false, "#8A2BE2", new HashSet<OrderStateLang>(), true, false);
            shipped = (OrderState) sh.jpa.merge(shipped);
            sh.jpa.merge(new OrderStateLang(shipped, sh.getLang(), "Objednávka byla odeslána"));


            OrderState cancelled = new OrderState(true, "template", true,
                    false, "#DC143C", new HashSet<OrderStateLang>(), true, false);
            cancelled = (OrderState) sh.jpa.merge(cancelled);
            sh.jpa.merge(new OrderStateLang(cancelled, sh.getLang(), "Objednávka byla zrušena"));
        }

        //OrderState awaiting_pmt = new OrderState(true,"template",);
    }
    public static MergeResult merge(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        OrderState entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            AdminSessionHolder sh = AdminSessionHolder.get(session);


            int entityID = TestReq.Int(request, "id");
            entity = sh.jpa.selectByID(OrderState.class, entityID);
            if (entity == null) entity = new OrderState();


            boolean is_active = TestReq.Bool(request, "is-active");//on
            boolean send_email = TestReq.Bool(request,"send-email");
            String mail_template = TestReq.Str(request,"mail-template");
            boolean contains_invoice = TestReq.Bool(request,"contains-invoice");
            boolean contains_delivery = TestReq.Bool(request,"contains-delivery");
            boolean set_after_order = TestReq.Bool(request,"set-after-order");
            String color = TestReq.Str(request,"color");

            entity.setActive(is_active);
            entity.setSendEmail(send_email);


            String templatesFolderPath = sh.getSettings().getWarPath()+"/modules/backend_mailtemplate-editor/user_data/templates/";
            File templatesFolder = new File(templatesFolderPath);
            String fullMailTemplatePath = null;
            for(File f : templatesFolder.listFiles()){
                String id = f.getName().replaceFirst("[.][^.]+$", "");
                if(id.equals(mail_template)){
                    fullMailTemplatePath = "/modules/backend_mailtemplate-editor/user_data/templates/"+f.getName()+"/mailtemplate.html";
                }

            }
            if(fullMailTemplatePath==null) {
                templatesFolderPath = sh.getSettings().getWarPath() + "/modules/backend_mailtemplate-editor/user_data/template-values/";
                templatesFolder = new File(templatesFolderPath);
                for (File f : templatesFolder.listFiles()) {
                    String id = f.getName().replaceFirst("[.][^.]+$", "");
                    if (id.equals(mail_template)) {
                        fullMailTemplatePath = "/modules/backend_mailtemplate-editor/user_data/template-values/"+f.getName();

                    }
                }
            }

            entity.setEmailTemplate(fullMailTemplatePath);

            entity.setContainsInvoice(contains_invoice);
            entity.setContainsDelivery(contains_delivery);
            entity.setColor(color);

            entity.setAfterOrder(set_after_order);
            //entity.setLangs();


            entity = (OrderState) sh.jpa.merge(entity);
            Set<OrderStateLang> entityLangs = new HashSet<>();
            for (Language lang : sh.shopSettings.languages) {
                String name = TestReq.Str(request, "name-" + lang.getIsoCode());//

                OrderStateLang cLang = null;
                for (OrderStateLang entLang : entity.getLangs(sh.jpa)) {
                    if (entLang.getLang().getIsoCode().equals(lang.getIsoCode())) {
                        cLang = entLang;
                    }
                }
                if (cLang == null) cLang = new OrderStateLang();
                cLang.setState(entity);
                cLang.setLang(lang);
                cLang.setName(name);
                cLang = (OrderStateLang) sh.jpa.merge(cLang);
                entityLangs.add(cLang);
            }
            entity.setLangs(entityLangs);


            entity = (OrderState) sh.jpa.merge(entity);
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
