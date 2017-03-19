<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.JPAUtil" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="com.worstentrepreneur.j2eeshop.ShopSettingsSngl" %>
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
    ShopSettingsSngl settings = ShopSettingsSngl.getInstance();
    settings.reinit();
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content" style="<%=sh.getUser()==null?"margin-left:0;":""%>">
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE TITLE-->
        <h1 class="page-title"> Nastavení ESHOPU
            <small></small>
        </h1>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light bordered" id="form_wizard_1">
                    <div class="portlet-body form">
                        <%
                            if(settings.isMissingData() && sh.jpa.hasUser()){
                                %>
                                <div class="alert alert-danger display-none" style="display: block;">
                                    <button class="close" data-dismiss="alert"></button>
                                    <h1>V nastavení chybí data:</h1>
                                <%
                                for(String s:settings.getMissingData()){
                                    %><%=s%><br><%
                                }
                                %></div><%
                            }
                        %>
                        <form class="form-horizontal" action="?page=entity-process&entity=shop-settings" id="submit_form" method="POST">
                            <input name="shop-settings-process" value="true" style="display:none;"/>
                            <div class="form-wizard">
                                <div class="form-body">
                                    <ul class="nav nav-pills nav-justified steps">
                                        <li>
                                            <a href="#tab1" data-toggle="tab" class="step">
                                                <span class="number"> 1 </span>
                                                <span class="desc"><i class="fa fa-check"></i> ESHOP </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab2" data-toggle="tab" class="step">
                                                <span class="number"> 2 </span>
                                                <span class="desc"><i class="fa fa-check"></i> MAILSERVER </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab3" data-toggle="tab" class="step active">
                                                <span class="number"> 3 </span>
                                                <span class="desc"><i class="fa fa-check"></i> SOCIÁLNÍ MÉDIA </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab4" data-toggle="tab" class="step">
                                                <span class="number"> 4 </span>
                                                <span class="desc"><i class="fa fa-check"></i> SEO </span>
                                            </a>
                                        </li>
                                    </ul>
                                    <div id="bar" class="progress progress-striped" role="progressbar">
                                        <div class="progress-bar" style="background-color: #df2646;"> </div>
                                    </div>
                                    <div class="tab-content">
                                        <div class="alert alert-danger display-none">
                                            <button class="close" data-dismiss="alert"></button> Některá pole jsou prázdná, zkontrolujte je. </div>
                                        <div class="alert alert-success display-none">
                                            <button class="close" data-dismiss="alert"></button> Validace proběhla úspěšně! </div>
                                        <jsp:include page="_frg/1_shop.jsp"/>
                                        <jsp:include page="_frg/2_mailserver.jsp"/>
                                        <jsp:include page="_frg/3_social_media.jsp"/>
                                        <jsp:include page="_frg/4_seo.jsp"/>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-4 col-md-8">
                                            <a href="javascript:;" class="btn btn-circle red-thunderbird button-previous" style="margin-right:50px;">
                                                <i class="fa fa-angle-left"></i> Zpět </a>
                                            <a href="javascript:;" class="btn btn-circle green-jungle button-next"> Pokračovat
                                                <i class="fa fa-angle-right"></i>
                                            </a>
                                            <a href="javascript:;" class="btn btn-circle green-jungle button-submit"> Uložit
                                                <i class="fa fa-check"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END CONTENT BODY -->
</div>
