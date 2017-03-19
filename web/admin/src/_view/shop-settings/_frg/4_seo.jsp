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
<div class="tab-pane" id="tab4">
    <h3 class="block">Optimalizace pro vyhledávače - Seznam.cz, Google.com</h3>
    <h2>Co je SEO? Proč mám vyplňovat tagy a SEO/Meta kolonky?</h2>
    <p>SEO (Search Engine Optimization) používají vyhledávače webů jako je Google.com anebo Seznam.cz, tyto vyhledávače
    musí mít vodítka podle kterých umí pro klienta najít přesně to co hledá. Proto nestačí pouze název produktu, ale je
        potřeba vyplňovat i jeho Tagy.</p>
    <h2>A proč musím nahrávat SEO obrázky?</h2>
    <p>SEO Obrázky slouží k tomu aby si vyhledávače webů a sociální média jako jsou Facebook, Twitter a další mohli
    stáhnout přesný obrázek, nadpis a popis k dané stránce kterou se někdo snaží nalézt přes vyhledávač webů anebo sdílet
    na sociálních médiích.</p>
    <h4>Co mám tedy vyplnit zde?</h4>
    <p>V eshopu jsou stránky které mají neutrální anebo těžko zařaditelný obsah např. "hlavní strana", možnost k nim psát popis, vkládat a
        zadávat pro ně optimalizaci pro každou zvlášť oproti například kategorii je zbytečné, nechceme ale aby tyto
        stránky neobsahovali při jejich vyhledávání anebo sdílení nic a tak obsah pro SEO a sdílení na sociálních
        médiích mají společný. Pro daný společný obsah vyplňte kolonky níže.</p>
    <div class="form-group">
        <label class="control-label col-md-4">Meta název eshopu
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" name="seo_site_name" value="<%=!"".equals(TestReq.Str(settings.getSeoSiteName()))?settings.getSeoSiteName():""%>" class="form-control maxlength_alloptions" maxlength="70" >
            <span class="help-block">  </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Meta nadpis stránek
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" name="seo_default_title" value="<%=!"".equals(TestReq.Str(settings.getSeoDefaultTitle()))?settings.getSeoDefaultTitle():""%>" class="form-control maxlength_alloptions" maxlength="70" >
            <span class="help-block">  </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Meta popis stránek
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" name="seo_default_description" value="<%=!"".equals(TestReq.Str(settings.getSeoDefaultDescription()))?settings.getSeoDefaultDescription():""%>" class="form-control maxlength_alloptions" maxlength="160" >
            <span class="help-block">  </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Meta klíčová slova
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <input type="text" name="seo_default_keywords" value="<%=!"".equals(TestReq.Str(settings.getSeoDefaultKeywords()))?settings.getSeoDefaultKeywords():""%>" class="tagsinput-def">
            <span class="help-block">  </span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-4">Meta Obrázek
            <span class="required"> * </span>
        </label>
        <div class="col-md-4">
            <div class="img-fileupload cloud form-control" data-name="seo_default_image_url" data-value="<%=!"".equals(TestReq.Str(settings.getSeoSiteImageUrl()))?settings.getSeoSiteImageUrl():""%>" ></div>
            <span class="help-block">  </span>
        </div>
    </div>





</div>