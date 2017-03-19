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
<div class="tab-pane active" id="tab1">
    <%
    if(sh.getUser()==null){
        %>
        <h3 class="block">Přístup do administrace</h3>
        <div class="form-group">
            <label class="control-label col-md-4">Email administrátora
                <span class="required"> * </span>
            </label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="admin-email" value="info@<%=request.getServerName()%>"/>
                <span class="help-block"> Pod tímto emailem se přihlásíte po konfiguraci do administrace </span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-4">Heslo administrátora
                <span class="required"> * </span>
            </label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="admin-password" value="admin" id="submit_form_password" />
                <span class="help-block"> Zadejte heslo </span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-4">Potvrzení hesla administrátora
                <span class="required"> * </span>
            </label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="admin-password2" value="admin" />
                <span class="help-block"> Napište stejné heslo jako v předchozím zadání </span>
            </div>
        </div>
        <%
    }
    %>
    <h3 class="block">Kontakt</h3>
    <div class="form-group">
        <label class="control-label col-md-4">Email
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="contact_email" value="<%=!"".equals(TestReq.Str(settings.contactEmail))?settings.contactEmail:"info@"+request.getServerName()%>" />
            <span class="help-block">  </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Mobil
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="contact_phone" value="<%=!"".equals(TestReq.Str(settings.contactEmail))?settings.contactPhone:"+420 111 111 111"%>" />
            <span class="help-block">  </span>
        </div>
    </div>
    <h3 class="block">Obecná nastavení</h3>

    <div class="form-group">
        <label class="control-label col-md-4">Logo Eshopu
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <div class="img-fileupload cloud form-control" data-name="logo_url" data-value="<%=!"".equals(TestReq.Str(settings.logoUrl))?settings.logoUrl:""%>" ></div>
            <span class="help-block"> Logo zobrazené v hlavičce eshopu, v emailech a na dalších stranách</span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">URL Eshopu
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="shop_url" value="<%=!"".equals(TestReq.Str(settings.shopUrl))?settings.shopUrl:"http://"+request.getServerName()%>"/>
            <span class="help-block"> např. http://worstentrepreneur.com (Použito k přesměrování u strany 404)</span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Název eshopu
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="shop_name" value="<%=!"".equals(TestReq.Str(settings.shopName))?settings.shopName:""%>"/>
            <span class="help-block"> Bude použit v podpisu v emailech </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Název firmy
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="company_name" value="<%=!"".equals(TestReq.Str(settings.companyName))?settings.companyName:""%>"/>
            <span class="help-block"> Bude použit v podpisu v emailech </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Název týmu
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" class="form-control" name="team_name" value="<%=!"".equals(TestReq.Str(settings.shopTeamName))?settings.shopTeamName:""%>"/>
            <span class="help-block"> Bude použit v podpisu v emailech </span>
        </div>
    </div>
    <h3 class="block">Jazyky/Země</h3>
    <div class="form-group">
        <label class="control-label col-md-4">Výchozí jazyk
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <%--<input type="text" class="form-control" name="team_name" value=""/>--%>
            <select class="form-control select2" name="default_language_iso" >
                <%
                for(Language l : sh.jpa.selectAllByID(Language.class)){
                    boolean selected = false;
                    if(settings.getDefaultLanguage()!=null){
                        if(settings.getDefaultLanguage().getId()==l.getId())selected=true;
                    }
                    %>
                    <option value="<%=l.getIsoCode()%>" <%=selected?"selected":""%>><%=l.getName()%></option>
                    <%
                }
                %>
            </select>
            <span class="help-block"> Bude použit jako výchozí v administraci a na eshopu</span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Povolené jazyky
            <span class="required"> * </span><br><br>Vlevo vše<br>Vpravo vybrané
        </label>
        <div class="col-md-4">
            <select multiple="multiple" class="multi-select form-control" name="language_isos">
                <%
                for(Language l : sh.jpa.selectAllByID(Language.class)){
                    boolean selected = false;
                    if(settings.getLanguages()!=null) {
                        for (Language l2 : settings.getLanguages()) {
                            if (l2.getId() == l.getId()) selected = true;
                        }
                    }

                    %>
                    <option value="<%=l.getIsoCode()%>" <%=selected?"selected":""%>><%=l.getName()%></option>
                    <%
                }
                %>
            </select>
            <span class="help-block"> Budou možné změnit na eshopu/automaticky změnené dle prohlížeče</span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Výchozí měna
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <select class="form-control select2" name="default_currency_iso" >
                <%
                for(Currency c : sh.jpa.selectAllByID(Currency.class)){
                    boolean selected = false;
                    if(settings.getDefaultCurrency()!=null){
                        if(settings.getDefaultCurrency().getId()==c.getId())selected=true;
                    }
                    %>
                    <option value="<%=c.getIsoCode()%>" <%=selected?"selected":""%>><%=c.getName()%></option>
                    <%
                }
                %>
            </select>
            <span class="help-block"> Bude použita jako výchozí v administraci a na eshopu</span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Výchozí daň
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <select class="form-control select2" name="default_tax_id" >
                <%
                for(Tax t : sh.jpa.selectAllByID(Tax.class)){
                    boolean selected = false;
                    if(settings.getDefaultTax()!=null){
                        if(settings.getDefaultTax().getId()==t.getId())selected=true;
                    }
                    %>
                    <option value="<%=t.getId()%>" <%=selected?"selected":""%>><%=t.getRate()%>%</option>
                    <%
                }
                %>
            </select>
            <span class="help-block"> Bude použita jako výchozí v administraci a na eshopu</span>
        </div>
    </div>
</div>