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
<div class="tab-pane" id="tab3">
    <h3 class="block">Odkazy na sociální média</h3>
    <div class="form-group">
        <label class="control-label col-md-4">Facebook
            <span class="required">  </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="facebook_link" value="<%=settings.getFacebookLink()!=null?settings.getFacebookLink():"https://www.facebook.com/"+request.getServerName()%>"/>
            <span class="help-block"> V případě že účet nemáte, nechte kolonku prázdnou </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Twitter
            <span class="required">  </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="twitter_link" value="<%=settings.getTwitterLink()!=null?settings.getTwitterLink():"http://twitter.com/"+request.getServerName()%>"/>
            <span class="help-block"> V případě že účet nemáte, nechte kolonku prázdnou </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Instagram
            <span class="required">  </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="instagram_link" value="<%=settings.getInstagramLink()!=null?settings.getInstagramLink():"http://instagram.com/"+request.getServerName()%>"/>
            <span class="help-block"> V případě že účet nemáte, nechte kolonku prázdnou </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Youtube
            <span class="required">  </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="youtube_link" value="<%=settings.getYoutubeLink()!=null?settings.getYoutubeLink():"https://www.youtube.com/channel/"+request.getServerName()%>"/>
            <span class="help-block"> V případě že účet nemáte, nechte kolonku prázdnou </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Pinterest
            <span class="required">  </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="pinterest_link" value="<%=settings.getPinterestLink()!=null?settings.getPinterestLink():"https://www.pinterest.com/"+request.getServerName()%>"/>
            <span class="help-block"> V případě že účet nemáte, nechte kolonku prázdnou </span>
        </div>
    </div>

</div>