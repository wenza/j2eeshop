<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTree" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTreeObj" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="com.worstentrepreneur.j2eeshop.utils.AttributesCombinationHelper" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.*" %>
<%@ page import="com.worstentrepreneur.utils.PropertyHandler" %>

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
    Class className = OrderState.class;
    OrderState entity = (OrderState)sh.getJPA().selectByID(className,request);
    int parentID = TestReq.Int(request,"parent-id");
    String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();
    //OrderState lastEntity = sh.jpa.selectLast(OrderState.class);
    //int categoryID = TestReq.Int(request,"category-id");
    //Category c = sh.jpa.selectByID(Category.class,categoryID);
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="?page=entity-process&entity=<%=entityName%>">
            <input type="hidden" name="id" value="<%=entity!=null?entity.getId():0%>"/>
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE TITLE-->
            <%--<h1 class="page-title"> Produkt
                <small></small>
                <button type="submit" class="btn sbold green pull-right bg-green-jungle bg-font-green-jungle">
                    <i class="fa fa-check"></i> Uložit
                </button>
            </h1>--%>
            <div class="page-title" style="margin-top:0;">
                <div class="row">
                    <div class="col-md-6 ta-l">
                    <%
                    for(Language lang : sh.shopSettings.languages){
                        OrderStateLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
                        %>
                            <div class="col-md-12 form-group lang-group-<%=lang.getIsoCode()%> lang-group <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode()) ?"shown":""%>">
                                <label class="col-md-3 control-label" style="text-align:left;margin:0;padding:0;">Název(<%=lang.getIsoCode()%>)</label>
                                <div class="col-md-9">
                                    <input type="text" name="name-<%=lang.getIsoCode()%>" class="form-control"  value="<%=entLang!=null?entLang.getName():""%>">
                                </div>
                            </div>
                        <%
                    }
                    %>
                    </div>
                    <div class="col-md-6 ta-r">
                        <button type="submit" style="margin-left:20px;" class="btn btn-circle green-jungle btn-outline pull-right active">Uložit</button>
                        <span class="pull-right font-grey-salsa" style="margin-left:15px;">|</span>
                        <%
                        for(Language lang : sh.shopSettings.languages){
                            %>
                            <a style="margin-left:10px;" class="btn btn-circle green btn-outline lang-group-activator pull-right <%=sh.shopSettings.defaultLanguage.getId()==lang.getId()?"active":""%>" data-iso-code="<%=lang.getIsoCode()%>"> <%=lang.getName()%> (<%=lang.getIsoCode()%>) </a>
                            <%
                        }
                        %>
                    </div>
                </div>
            </div>

            <div class="portlet-body">
                <div class="form-body " >
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Aktivní</label>
                                <div class="col-md-9">
                                    <input  type="checkbox" name="is-active" class="make-switch" data-on-color="success" data-off-color="danger"
                                            data-on-text="<i class='fa fa-check'></i>" data-off-text="<i class='fa fa-remove'></i>" <%=entity!=null?entity.isActive()?"checked":"":"checked"%>>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Obsahuje PDF Dodací list</label>
                                <div class="col-md-9">
                                    <input  type="checkbox" name="contains-delivery" class="make-switch" data-on-color="success" data-off-color="danger"
                                            data-on-text="<i class='fa fa-check'></i>" data-off-text="<i class='fa fa-remove'></i>" <%=entity!=null?entity.isContainsDelivery()?"checked":"":"checked"%>>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Obsahuje PDF Objednávky</label>
                                <div class="col-md-9">
                                    <input  type="checkbox" name="contains-invoice" class="make-switch" data-on-color="success" data-off-color="danger"
                                            data-on-text="<i class='fa fa-check'></i>" data-off-text="<i class='fa fa-remove'></i>" <%=entity!=null?entity.isContainsInvoice()?"checked":"":""%>>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Nastaví se po dokončené objednávce</label>
                                <div class="col-md-9">
                                    <input  type="checkbox" name="set-after-order" class="make-switch" data-on-color="success" data-off-color="danger"
                                            data-on-text="<i class='fa fa-check'></i>" data-off-text="<i class='fa fa-remove'></i>" <%=entity!=null?entity.isAfterOrder()?"checked":"":""%>>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Odešle email</label>
                                <div class="col-md-9">
                                    <input  type="checkbox" name="send-email" class="make-switch" data-on-color="success" data-off-color="danger"
                                            data-on-text="<i class='fa fa-check'></i>" data-off-text="<i class='fa fa-remove'></i>" <%=entity!=null?entity.isSendEmail()?"checked":"":"checked"%>>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="mail-template-1" class="col-md-3 control-label">
                                    Šablona emailu<br>

                                </label>
                                <div class="col-md-9">

                                    <select class="form-control select2" name="mail-template" >
                                        <%
                                        String templatesFolderPath = sh.getSettings().getWarPath()+"/modules/backend_mailtemplate-editor/user_data/templates/";
                                        File templatesFolder = new File(templatesFolderPath);
                                        for(File f : templatesFolder.listFiles()){
                                            String id = f.getName().replaceFirst("[.][^.]+$", "");
                                            Properties prop = PropertyHandler.read(f.getAbsolutePath()+"/mailtemplate.properties");
                                            boolean selected = false;
                                            if(entity!=null){
                                                //if(entity.getEmailTemplate().)
                                            }
                                            %>
                                            <option value="<%=id%>" <%=selected?"selected":""%>><%=prop.getProperty("name")%></option>
                                            <%
                                        }
                                        templatesFolderPath = sh.getSettings().getWarPath()+"/modules/backend_mailtemplate-editor/user_data/template-values/";
                                        templatesFolder = new File(templatesFolderPath);
                                        for(File f : templatesFolder.listFiles()){
                                            if (f.getName().endsWith(".properties")) {
                                                String id = f.getName().replaceFirst("[.][^.]+$", "");
                                                Properties prop = PropertyHandler.read(f.getAbsolutePath());
                                                boolean selected = false;
                                                if(entity!=null){
                                                    //if(entity.getEmailTemplate().)
                                                }
                                                %>
                                                <option value="<%=id%>" <%=selected?"selected":""%>><%=prop.getProperty("name")%></option>
                                                <%
                                            }
                                        }
                                        %>
                                    </select>

                                    <!--
                                    <input type="text" id="mail-template-1" name="mail-template" class="form-control" value="<%=entity!=null?entity.getEmailTemplate():"/"%>">
                                    -->
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="color-1" class="col-md-3 control-label">Barva štítku</label>
                                <div class="col-md-9">
                                    <input type="text" id="color-1" name="color" class="form-control" value="<%=entity!=null?entity.getColor():"/"%>">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

