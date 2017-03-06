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
    Class className = ModuleData.class;
    ModuleData entity = (ModuleData)sh.getJPA().selectByID(className,request);
    String entityName = TestReq.Str(request,"module-entity");
    String moduleName = TestReq.Str(request,"module");
    int pageID = TestReq.Int(request,"page-id");
    int entityType = ModuleData.TYPE_PAGE_ITEM;
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="?page=module&module=<%=moduleName%>&module-entity=<%=entityName%>&action=process">
            <input type="hidden" name="id" value="<%=entity!=null?entity.getId():0%>"/>
            <input type="hidden" name="column-1" value="<%=entity!=null?entity.getColumn1():entityType%>"/>
            <input type="hidden" name="column-2" value="<%=entity!=null?entity.getColumn2():pageID%>"/>
            <input type="hidden" name="column-3" value="5"/>

            <div class="page-title" style="margin-top:0;">
                <%--<div class="row">
                    <div class="col-md-6 ta-l">
                        <label class="col-md-3 control-label" style="text-align:left;margin:0;padding:0;">Název</label>
                        <div class="col-md-9">
                            <input type="text" name="column-6" class="form-control"  value="<%=entity!=null?entity.getColumn6():""%>">
                        </div>
                    </div>
                    <div class="col-md-6 ta-r">
                        <button type="submit" style="margin-left:20px;" class="btn btn-circle green-jungle btn-outline pull-right active">Uložit</button>
                    </div>
                </div>--%>
                <div class="row">
                    <div class="col-md-6 ta-l">
                        <%
                        for(Language lang : sh.shopSettings.languages){
                            ModuleDataLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
                            %>
                            <div class="col-md-12 form-group lang-group-<%=lang.getIsoCode()%> lang-group <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode()) ?"shown":""%>">
                                <label class="col-md-3 control-label" style="text-align:left;margin:0;padding:0;">Název(<%=lang.getIsoCode()%>)</label>
                                <div class="col-md-9">
                                    <input type="text" name="lang-column-1-<%=lang.getIsoCode()%>" class="form-control"  value="<%=entLang!=null?entLang.getColumn1():""%>">
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
                <div class="form-body row " >
                    <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">
                                    Odkaz<br>(Pokud je bez odkazu - nevyplňovat)
                                </label>
                                <div class="col-md-9">
                                    <input type="text" name="column-5" class="form-control"  value="<%=entity!=null?entity.getColumn5():""%>">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">
                                    Obrázek použitý v SEO<br>(facebook,twitter...)<br>minimum 600 x 315px
                                </label>
                                <div class="col-md-9">
                                    <div class="img-fileupload cloud" data-name="column-4" data-value="<%=entity!=null?entity.getColumn4():""%>" >
                                        <input type="hidden" name="min-width" value="600"/>
                                        <input type="hidden" name="min-height" value="315"/>
                                    </div>
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