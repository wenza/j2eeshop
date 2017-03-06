<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.JPAUtil" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="java.util.Set" %>
<%@ page import="javax.persistence.ManyToOne" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="com.fasterxml.jackson.annotation.JsonProperty" %>
<%--
Created by IntelliJ IDEA.
User: wenza
Date: 6/3/14
Time: 10:30 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = (AdminSessionHolder) session.getAttribute("shX");
    Class className = Order.class;
    List<Order> list = sh.getJPA().selectAllByIDDesc(className);
    String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();

%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE TITLE-->
        <h1 class="page-title"> Objednávky
            <small></small>
            <%--<a href="?page=entity-form&entity=<%=entityName%>" class="btn sbold green pull-right">
                <i class="fa fa-plus"></i> Přidat
            </a>--%>
        </h1>
        <!-- END PAGE TITLE-->
        <!-- END PAGE HEADER-->
        <%--<div class="note note-info">
            <p> Here will be homepage dashboard </p>
        </div>--%>
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                <div ><%--class="portlet light bordered">--%>
                        <div ><%--class="portlet-body">--%>
                        <table class="table table-striped table-bordered table-hover order-column" id="sample_1_donotinit">
                            <thead>
                            <tr>
                                <th>
                                    #
                                </th>
                                <th> Klient </th>
                                <th> Datum </th>
                                <th> Doprava a Platba </th>
                                <th> Stav </th>
                                <th> Cena celkem vč. DPH </th>
                                <th> Akce </th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for(Order o : list){
                                    Set<OrderToProduct> products = o.getProducts(sh.jpa);
                                    Customer customer = o.getCustomer();
                                    //Currency currency = o.getCurrency();
                                    Shipping shipping = o.getShipping();
                                    Payment payment = o.getPayment();
                                    Address addressDelivery = o.getAddressDelivery();
                                    Address addressInvoice = o.getAddressInvoice();
                                    OrderState currentState = o.getCurrentState();
                                    if(shipping!=null && payment!=null && addressDelivery!=null && currentState!=null){
                                        ShippingLang shippingLang = shipping.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                        PaymentLang paymentLang = payment.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                        %>
                                        <tr class="odd gradeX">
                                            <td>
                                                <%=o.getId()%>
                                            </td>
                                            <td class="center"> <%=addressDelivery.getFirstname()+" "+addressDelivery.getLastname()%> </td>
                                            <td><%=o.getDateAdd()%></td>
                                            <td> <%=shippingLang.getName()+" ("+o.getShippingTaxIncl()+"vč. DPH "+sh.shopSettings.defaultCurrency.getIsoCode()+" ) -> "+paymentLang.getName()+"( "+payment.getPrice()+" "+sh.shopSettings.defaultCurrency.getIsoCode()+")"%></td>
                                            <td><button class="btn" style="background:<%=currentState.getColor()%>;color:white;"><%=currentState.getLang(sh.shopSettings.defaultLanguage,sh.jpa).getName()%></button></td>
                                            <td class="center"> <%=o.getOrderTaxIncl()%> <%=sh.shopSettings.defaultCurrency.getIsoCode()%></td>
                                            <td>
                                                <a href="?page=entity-form&entity=<%=entityName.toLowerCase()%>&id=<%=o.getId()%>" class="btn btn-sm btn-outline grey-salsa"><i class="fa fa-search"></i> Zobrazit</a>
                                                <a href="javascript:;" class="btn btn-sm red btn-outline grey-salsa"><i class="fa fa-times"></i> Deaktivovat</a>
                                            </td>
                                        </tr>
                                        <%
                                    }else{
                                        System.out.println("Ignored order - "+o.getId());
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END CONTENT BODY -->
</div>
