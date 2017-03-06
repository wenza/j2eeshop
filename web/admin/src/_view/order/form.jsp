<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="com.worstentrepreneur.utils.Format" %>

<%--
Created by IntelliJ IDEA.
User: wenza
Date: 6/3/14
Time: 10:30 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = AdminSessionHolder.get(session);
    Class className = Order.class;
    Order entity = (Order)sh.getJPA().selectByID(className,request);
    String entityName = TestReq.Str(request,"entity");
    ShippingLang shiplang = entity.getShipping().getLang(sh.getLang(),sh.jpa);
    PaymentLang paylang = entity.getPayment().getLang(sh.getLang(),sh.jpa);
    Address deliv = entity.getAddressDelivery();
    Address invo = entity.getAddressInvoice();



%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="?page=entity-process&entity=<%=entityName%>">
            <input type="hidden" name="id" value="<%=entity!=null?entity.getId():0%>"/>
            <div class="row">
                <div class="col-md-6 ta-l">
                    <div class="col-md-12 form-group" >
                        <h1>Objednávka</h1>
                    </div>
                </div>
                <div class="col-md-6 ta-r">
                    <button type="submit" style="margin-left:20px;" class="btn btn-circle green-jungle btn-outline pull-right active">Uložit</button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="portlet light">
                        <div class="portlet-title">
                            <div class="caption">
                                <span class="caption-subject bold uppercase"> Zboží a cena</span>
                                <span class="caption-helper"><%=entity.getDateAdd()%></span>

                            </div>
                        </div>
                        <div class="portlet-body">
                            <select class="form-control select2" name="order-state-id" >
                                <%
                                    for(OrderState state : sh.jpa.selectAllByID(OrderState.class)){
                                        OrderStateLang oslang = state.getLang(sh.getLang(),sh.jpa);
                                        %><option value="<%=state.getId()%>"
                                            <%=entity!=null?entity.getCurrentState().getId()==state.getId()?"selected":"":""%>><%=oslang.getName()%>
                                        </option><%
                                    }
                                %>
                            </select>
                            <br/>
                            <table class="table table-striped table-bordered table-hover order-column">
                                <thead>
                                    <tr><th>Položka</th><th>ks</th><th>DPH</th><th>Cena </th></tr>
                                </thead>
                                <tbody>
                                    <%
                                        for(OrderToProduct o2p : entity.getProducts(sh.jpa)){
                                            ProductLang plang = o2p.getProduct().getLang(sh.getLang(),sh.jpa);
                                            %>
                                            <tr><td><%=plang.getName()%></td><td><%=o2p.getQuantity()%></td><td><%=o2p.getProduct().getTax().getRate()%>%</td><td><%=Format.number(o2p.getPriceTaxIncl())+sh.shopSettings.defaultCurrency.getSign()%></td></tr>
                                            <%
                                        }
                                    %>
                                    <tr><td><%=shiplang.getName()%></td><td></td><td></td><td><%=Format.number(entity.getShippingTaxIncl())+sh.shopSettings.defaultCurrency.getSign()%></td></tr>
                                    <tr><td><%=paylang.getName()%></td><td></td><td></td><td><%=Format.number(entity.getPaymentTaxIncl())+sh.shopSettings.defaultCurrency.getSign()%></td></tr>
                                    <tr><th></th><th>CELKEM vč DPH:</th><th></th><th><%=Format.number(entity.getOrderTaxIncl())+sh.shopSettings.defaultCurrency.getSign()%></th></tr>
                                    <tr><th></th><th>CELKEM vč DPH:</th><th></th><th><%=Format.number((entity.getOrderTaxIncl().multiply(entity.getCurrencyRate())))+entity.getCurrency().getSign()%></th></tr>
                                    <%
                                    %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="portlet light">
                        <div class="portlet-title">
                            <div class="caption">
                                <span class="caption-subject bold uppercase"> Adresy</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <strong>Dodací:</strong><br/>
                                    <%=deliv.getFirstname()+" "+deliv.getLastname()+",<br/>"+deliv.getAddress1()+",<br/>"+
                                        deliv.getCity()+",<br/>"+deliv.getPostcode()+", <br/>"+deliv.getCountry().getLang(sh.getLang(),sh.jpa).getName()+",<br/> "+
                                        deliv.getPhone()%>
                                </div>
                                <div class="col-md-6">
                                    <strong>Fakturační:</strong><br/>
                                    Firma:<%=deliv.getCompany()+"<br/>IČO:"+deliv.getVatNumber()+"<br/>"+deliv.getFirstname()+" "+deliv.getLastname()+",<br/>"+deliv.getAddress1()+",<br/>"+
                                            deliv.getCity()+",<br/>"+deliv.getPostcode()+", <br/>"+deliv.getCountry().getLang(sh.getLang(),sh.jpa).getName()+",<br/> "+
                                            deliv.getPhone()%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="portlet-body">
                <%--<div class="form-body " >
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Váha</label>
                                <div class="col-md-9">
                                    <input  type="text" name="name" value="<%=entity!=null?entity.getName():""%>" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Aktivní</label>
                                <div class="col-md-9">
                                    <input  type="checkbox" name="is-active" class="make-switch" data-on-color="success" data-off-color="danger"
                                            data-on-text="<i class='fa fa-check'></i>" data-off-text="<i class='fa fa-remove'></i>" <%=entity!=null?entity.isActive()?"checked":"":"checked"%>>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
        </form>
    </div>
</div>

