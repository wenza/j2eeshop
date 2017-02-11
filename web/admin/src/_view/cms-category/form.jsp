<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTree" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTreeObj" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="com.worstentrepreneur.j2eeshop.utils.AttributesCombinationHelper" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.ArrayList" %>

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
    Class className = CmsCategory.class;
    CmsCategory entity = (CmsCategory)sh.getJPA().selectByID(className,request);
    String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();
    //CmsCategory lastEntity = sh.jpa.selectLast(CmsCategory.class);
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
                        CmsCategoryLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
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
                        <%--<div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Modul ve kterém bude kategorie využita</label>
                                <div class="col-md-9">
                                    <select class="form-control select2" name="manufacturer-id" >
                                        <option value="layout_footer">Zápatí</option>
                                        <option value="navigator">Navigátor</option>
                                    </select>
                                </div>
                            </div>
                        </div>--%>
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
                        <%
                            for(Language lang : sh.shopSettings.languages){
                                CmsCategoryLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
                        %>
                        <div class="lang-group-<%=lang.getIsoCode()%> lang-group <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode()) ?"shown":""%>">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Meta titulek(<%=lang.getIsoCode()%>)</label>
                                    <div class="col-md-9">
                                        <input type="text" name="meta-title-<%=lang.getIsoCode()%>" value="<%=entLang!=null?entLang.getMetaTitle():""%>" class="form-control maxlength_alloptions" maxlength="70" >
                                        <%--<span class="help-block"> <code>25 znaků</code> </span>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Meta popis()</label>
                                    <div class="col-md-9">
                                        <input type="text" name="meta-description-<%=lang.getIsoCode()%>" value="<%=entLang!=null?entLang.getMetaDescription():""%>" class="form-control maxlength_alloptions" maxlength="160" >
                                        <%--<span class="help-block"> <code>25 znaků</code> </span>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>

                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <%
                                for(Language lang : sh.shopSettings.languages){
                                    CmsCategoryLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
                            %>
                            <div class="form-group lang-group-<%=lang.getIsoCode()%> lang-group <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode()) ?"shown":""%>">
                                <label class="col-md-3 control-label">Meta klíčová slova/tagy(<%=lang.getIsoCode()%>)</label>
                                <div class="col-md-9">
                                    <input type="text" name="meta-keywords-<%=lang.getIsoCode()%>" value="<%=entLang!=null?entLang.getMetaKeywords():""%>" class="tagsinput-def">
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">
                                    Obrázek použitý v SEO<br>(facebook,twitter...)<br>minimum 600 x 315px
                                </label>
                                <div class="col-md-9">
                                    <div class="img-fileupload cloud" data-name="image-url" data-value="<%=entity!=null?entity.getImageURL():""%>" >
                                        <input type="hidden" name="min-width" value="600"/>
                                        <input type="hidden" name="min-height" value="315"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

