<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %><%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %><%@ page import="com.worstentrepreneur.j2eeshop.bean.CustomerBean" %>
<%@ page import="com.worstentrepreneur.j2eeshop.bean.AddressBean" %>
<%@ page import="com.worstentrepreneur.j2eeshop.bean.OrderBean" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Customer" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.worstentrepreneur.utils.Validator" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/28/17
  Time: 9:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    System.out.println("HMMM");
    CustomerSessionHolder sh = (CustomerSessionHolder)session.getAttribute("shC");
    if(request.getParameter("logout")!=null){
        sh = new CustomerSessionHolder();
    }
    if(sh==null){
        sh = new CustomerSessionHolder();
    }
    sh.update(session);

    System.out.println("A");
    String pageX = TestReq.Str(request,"page");
    if("checkout".equals(pageX)){
        System.out.println("B");
        String redirect = null;
        int step = TestReq.Int(request,"step");
        if(step==0)step=1;
        System.out.println("C");
        if(step>=1 && redirect==null){//basket
            if(sh.order==null && redirect==null){
                //redirect="?page=checkout&step=1";
                System.out.println("Create Order");
                OrderBean.createDefault(request, session);
                sh = CustomerSessionHolder.get(session);
            }

        }
        System.out.println("D");
        if(step>=2 && redirect==null){//choose account
            if(sh.order==null && redirect==null){
                redirect="?page=checkout&step=1";
            }
            if(sh.order!=null && redirect==null){
                if(sh.order.getProducts().size()==0){
                    redirect="?page=checkout&step=1";
                }
            }
        }
        System.out.println("E");
        /*if(step==3){
            CustomerBean.createDefault(request,session);
            sh=CustomerSessionHolder.get(session);
        }*/
        /*if(sh.customer.getEmail()==null){
            //step 3 exists as 3
            if(step>=3 && redirect==null){//get addresses
                System.out.println("Adding steps - "+sh.customer.getId()+" "+sh.customer.isActive());
                if(sh.customer.getId()==null){
                    redirect="?page=checkout&step="+(step-1);
                }
            }

        }else{
            step=step+1;
        }*/
        if((sh.customer==null?step==4:step==3)&& redirect==null ){
            //TODO: SAVE ADDRESSES
            System.out.println("Create Address - "+request.getParameter("address-firstname"));//TODO:CREATE CUSTOMER
            if(sh.customer==null) {
                sh.customer = new Customer();
            }
            sh.customer.setDateUpd(new Date());
            if(sh.customer.getEmail()==null) {
                if (request.getParameter("customer-email") != null) {
                    String mail = request.getParameter("customer-email");
                    if(Validator.mailValidate(mail)) {
                        sh.customer.setEmail(mail);
                    }
                }
            }
            if(request.getParameter("address-firstname")!=null) {
                sh.customer.setFirstname(TestReq.Str(request, "address-firstname"));
                sh.customer.setLastname(TestReq.Str(request, "address-lastname"));
            }
            sh.customer= (Customer) sh.jpa.merge(sh.customer);
            AddressBean.merge(request,session);
            sh.customer= sh.jpa.selectByID(Customer.class,sh.customer.getId());
            sh.order.setCustomer(sh.customer);
            /*if(sh.order!=null && sh.order.getAddressDelivery()!=null) {
                sh.customer.setFirstname(sh.order.getAddressDelivery().getFirstname());
                sh.customer.setLastname(sh.order.getAddressDelivery().getLastname());
            }*/
            sh.update(session);
            //sh=CustomerSessionHolder.get(session);
        }
        System.out.println("F");
        if((sh.customer==null?step>=4:step>=3) && redirect==null){//shipping / payment

            if(sh.order.getAddressDelivery()==null){
                redirect="?page=checkout&step="+(step-1);
            }
        }
        if((sh.customer==null?step==5:step==4) && redirect==null){
            //TODO:SAVE PAYMENTS
            System.out.println("Update Order");
            OrderBean.updateShippingAndPayment(request,session);
        }
        if((sh.customer==null?step>=5:step>=4) && redirect==null){//submission
            System.out.println("Order submission - "+step+" - "+sh.customer);
            if(sh.order.getShipping()==null && redirect==null){
                redirect="?page=checkout&step="+(step-1);
            }
            if(sh.order.getPayment()==null && redirect ==null){
                redirect="?page=checkout&step="+(step-1);
            }

        }
        if(redirect!=null){
            request.setAttribute("redirect",redirect);
        }
        System.out.println("===============Prolezl jsem");
    }

%>