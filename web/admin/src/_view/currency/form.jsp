<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>

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
    Class className = Currency.class;
    Currency entity = (Currency)sh.getJPA().selectByID(className,request);
    String entityName = TestReq.Str(request,"entity");
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="?page=entity-process&entity=<%=entityName%>">
            <input type="hidden" name="id" value="<%=entity!=null?entity.getId():0%>"/>
            <div class="page-title" style="margin-top:0;">
                <div class="row">
                    <div class="col-md-6 ta-l">
                        <div class="col-md-12 form-group" >
                            <h1>Měna</h1>
                        </div>
                    </div>
                    <div class="col-md-6 ta-r">
                        <button type="submit" style="margin-left:20px;" class="btn btn-circle green-jungle btn-outline pull-right active">Uložit</button>
                    </div>
                </div>
            </div>

            <div class="portlet-body">
                <div class="form-body " >
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Název</label>
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
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">ISO Kód</label>
                                <div class="col-md-9">
                                    <input  type="text" name="iso-code" value="<%=entity!=null?entity.getIsoCode():""%>" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Číslo ISO Kódu</label>
                                <div class="col-md-9">
                                    <input  type="number" name="iso-code-num" value="<%=entity!=null?entity.getIsoCodeNum():""%>" class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Znak</label>
                                <div class="col-md-9">
                                    <input  type="text" name="sign" placeholder="Kč" value="<%=entity!=null?entity.getSign():""%>" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Znak před cenou</label>
                                <div class="col-md-9">
                                    <input  type="checkbox" name="sign-prefix" class="make-switch" data-on-color="success" data-off-color="danger"
                                            data-on-text="<i class='fa fa-check'></i>" data-off-text="<i class='fa fa-remove'></i>" <%=entity!=null?entity.isSignPrefix()?"checked":"":""%>>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Konverze vůči(<%=sh.shopSettings.defaultCurrency.getIsoCode()%>)</label>
                                <%--<div class="col-md-9">
                                    <input  type="text" name="conversion-rate" value="<%=entity!=null?entity.getConversionRate():""%>" class="form-control">
                                </div>--%>
                                <div class="input-group">
                                    <span class="input-group-addon"> 1 <span class="currency-iso-code-fill"><%=entity!=null?entity.getIsoCode():""%></span> = </span>
                                    <input type="text" class="form-control" name="conversion-rate" value="<%=entity!=null?entity.getDisplayUnits():"1"%>">
                                    <span class="input-group-addon"><%=sh.shopSettings.defaultCurrency.getSign()%></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Má desetinná místa</label>
                                <div class="col-md-9">
                                    <input  type="checkbox" name="decimals" class="make-switch" data-on-color="success" data-off-color="danger"
                                            data-on-text="<i class='fa fa-check'></i>" data-off-text="<i class='fa fa-remove'></i>" <%=entity!=null?entity.isDecimals()?"checked":"":""%>>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

