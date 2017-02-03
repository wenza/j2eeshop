<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Language" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CategoryLang" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Currency" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTree" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTreeObj" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>

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
    Class className = Category.class;
    Category entity = (Category)sh.getJPA().selectByID(className,request);
    String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();
    Category lastEntity = sh.jpa.selectLast(Category.class);
    Category rootCategory = sh.jpa.selectRootCategory();
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="?page=entity-process&entity=<%=entityName%>">
            <input type="hidden" name="id" value="<%=entity!=null?entity.getId():0%>"/>
            <input type="hidden" name="position" value="<%=entity!=null?entity.getPosition():lastEntity!=null?(lastEntity.getPosition()+30) : 30 %>"/>
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE TITLE-->
        <h1 class="page-title"> Kategorie
            <small></small>
            <button type="submit" class="btn sbold green pull-right bg-green-jungle bg-font-green-jungle">
                <i class="fa fa-check"></i> Uložit
            </button>
        </h1>
<!--
Název
Zobrazeno(SWITCH)
Nadřazená kategorie
Popis(WISIWYG)
Cover image(Recommended dimensions (for the default theme): 1425px x 285px)
Thumbnail(Recommended dimensions (for the default theme): 125px x 125px)
Meta titulek(70)
Meta popis(160)
Meta klíčová slova - TAGy
Do kategorie vidí tyto skupiny zákazníků:


As writing name it goes to meta headline
As writing description, it goes also to meta desc.
FILEUPLOADS
-->

        <div class="portlet-body">
            <div class="tabbable-custom ">
                <ul class="nav nav-tabs ">
                    <%
                        for(Language lang : sh.shopSettings.languages){
                            %>
                            <li class="lang-group-activator-container <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode())?"active":""%>">
                                <a class="lang-group-activator" data-iso-code="<%=lang.getIsoCode()%>"> <%=lang.getName()%> (<%=lang.getIsoCode()%>) </a>
                            </li>
                            <%
                        }
                    %>
                </ul>
                <div class="tab-content">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-6">
                                <%
                                    for(Language lang : sh.shopSettings.languages){
                                        CategoryLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
                                        %>
                                        <div class="form-group lang-group-<%=lang.getIsoCode()%> lang-group <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode()) ?"shown":""%>">
                                            <label class="col-md-3 control-label">Název(<%=lang.getIsoCode()%>)</label>
                                            <div class="col-md-9">
                                                <input type="text" name="name-<%=lang.getIsoCode()%>" class="form-control"  value="<%=entLang!=null?entLang.getName():""%>">
                                            </div>
                                        </div>
                                        <%
                                    }
                                %>
                                <%--<c:forEach var="lang" items="${shX.shopSettings.languages}">
                                    <div class="form-group lang-group-${lang.isoCode}">
                                        <label class="col-md-3 control-label">Název(${lang.isoCode})</label>
                                        <div class="col-md-9">
                                            <input type="text" name="name" class="form-control"  value="${lang.name}">
                                                &lt;%&ndash;<span class="help-block"> <code>25 znaků</code> </span>&ndash;%&gt;
                                        </div>
                                    </div>
                                </c:forEach>--%>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Aktivní</label>
                                    <div class="col-md-9">
                                        <input  type="checkbox" name="is-active" class="make-switch" checked data-on-color="success" data-off-color="danger"
                                                data-on-text="<i class='fa fa-check'></i>" data-off-text="<i class='fa fa-remove'></i>" <%=entity!=null?entity.isActive()?"checked":"":""%>>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Nadřazená kategorie</label>
                                    <div class="col-md-9">
                                        <input name="parent-id" value="<%=entity!=null? entity.getParent()!=null?entity.getParent().getId():0:rootCategory!=null?rootCategory.getId():0%>" style="display:none;"/>
                                        <div id="categories-tree" class="tree-demo border-default" style="border:1px solid black;padding:5px;"> </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <%
                                    for(Language lang : sh.shopSettings.languages){
                                        CategoryLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
                                        %>
                                        <div class="form-group lang-group-<%=lang.getIsoCode()%> lang-group <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode()) ?"shown":""%>">

                                            <label class="col-md-3 control-label">Popis(<%=lang.getIsoCode()%>)</label>
                                            <div class="col-md-9">
                                                <textarea name="description-<%=lang.getIsoCode()%>" class="ckeditor-sm-init form-control"><%=entLang!=null?entLang.getDescription():""%></textarea>
                                            </div>
                                        </div>
                                        <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <%
                                for(Language lang : sh.shopSettings.languages){
                                    CategoryLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
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
                                        CategoryLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
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
                                        Obrázek použitý v SEO<br>(facebook,twitter...)<br>minimum 600 x 315px</label>
                                    <div class="col-md-9">
                                        <div class="img-fileupload cloud" data-name="image-url" data-value="<%=entity!=null?entity.getImageURL():""%>" >
                                            <input type="hidden" name="min-width" value="600"/>
                                            <input type="hidden" name="min-height" value="315"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--<div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Náhled kategorie</label>
                                    <div class="col-md-9">
                                        <div class="img-fileupload cloud" data-name="img-url-2" data-value="none">
                                            <input type="hidden" name="min-width" value="540"/>
                                            <input type="hidden" name="min-height" value="960"/>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>

<script>

    categoriesTableData = [
    <%
    if(rootCategory!=null){
        if(entity!=null?rootCategory.getId()!=entity.getId():true){
            JTreeObj jtree = JTree.categoryEntityToJtreeObj(rootCategory,sh,entity!=null?entity.getParent():rootCategory);
            %>
            <%=sh.objectMapper.writeValueAsString(jtree)%>
            <%
        }
    }

    %>
    ];
</script>