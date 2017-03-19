<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Language" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Currency" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Tax" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.TaxLang" %>
<%@ page import="com.worstentrepreneur.j2eeshop.ShopSettingsSngl" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 3/18/17
  Time: 10:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

AdminSessionHolder sh = AdminSessionHolder.get(session);
ShopSettingsSngl settings = ShopSettingsSngl.getInstance();
%>
<div class="tab-pane" id="tab2">
    <h3 class="block">Přístupy mailserveru</h3>
    <div class="form-group">
        <label class="control-label col-md-4">Adresa ze které je email odesílán
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <div class="input-group">
                <input type="text" class="form-control" name="mail_from" value="<%=!"".equals(TestReq.Str(settings.getMailFrom()))?settings.getMailFrom():"newsletter"%>"/>
                <span class="input-group-addon" >@<%=request.getServerName()%></span>
            </div>
            <span class="help-block">  </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Uživatelské jméno k emailu
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="mail_username" value="<%=!"".equals(TestReq.Str(settings.getMailUsername()))?settings.getMailUsername():"newsletter@"+request.getServerName()%>"/>
            <span class="help-block">  </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Heslo k emailu
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="mail_password" value="<%=!"".equals(TestReq.Str(settings.getMailPassword()))?settings.getMailPassword():""%>" />
            <span class="help-block"> </span>
        </div>
    </div>
    <h3 class="block">Autentifikace k SMTP</h3>
    <div class="form-group">
        <label class="control-label col-md-4">Auth
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="mail_smtp_auth" value="<%=settings.isMailSmtpAuth()%>" />
            <span class="help-block"> </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Typ
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="mail_smtp_type" value="<%=!"".equals(TestReq.Str(settings.getMailSmtpType()))?settings.getMailSmtpType():"ssl"%>" />
            <span class="help-block"> </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Host
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="mail_smtp_host" value="<%=!"".equals(TestReq.Str(settings.getMailSmtpHost()))?settings.getMailSmtpHost():"smtp.yandex.com"%>" />
            <span class="help-block"> </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Port
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="mail_smtp_port" value="<%=!"".equals(TestReq.Str(settings.getMailSmtpType()))?settings.getMailSmtpType():"465"%>" />
            <span class="help-block"> </span>
        </div>
    </div>
    <h3 class="block">GUI</h3>
    <div class="form-group">
        <label class="control-label col-md-4">Header emailu
            <span class="required"> </span>
        </label>
        <div class="col-md-4">
            <div class="img-fileupload cloud form-control" data-name="mail_default_header_image_url" data-value="<%=!"".equals(TestReq.Str(settings.getMailDefaultHeaderImageURL()))?settings.getMailDefaultHeaderImageURL():""%>" ></div>
            <span class="help-block">  </span>
        </div>
    </div>
</div>