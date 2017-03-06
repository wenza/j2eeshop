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
<%if(request.getParameter("data-set")!=null){
   %><jsp:include page="process.jsp"/><%
}%>
<jsp:include page="install.jsp"/>
<%
    AdminSessionHolder sh = AdminSessionHolder.get(session);

    String className = "double-menu";
    Module module = sh.jpa.selectModuleByName(className);

    String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();

%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="?page=<%=className%>">
            <div class="page-title" style="margin-top:0;">
                <div class="row">
                    <div class="col-md-6 ta-l">
                        Editace modulu hlavního menu
                    <%--<%
                    for(Language lang : sh.shopSettings.languages){
                        ShippingLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
                        %>
                            <div class="col-md-12 form-group lang-group-<%=lang.getIsoCode()%> lang-group <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode()) ?"shown":""%>">
                                <label class="col-md-3 control-label" style="text-align:left;margin:0;padding:0;">Název(<%=lang.getIsoCode()%>)</label>
                                <div class="col-md-9">
                                    <input type="text" name="name-<%=lang.getIsoCode()%>" class="form-control"  value="<%=entLang!=null?entLang.getName():""%>">
                                </div>
                            </div>
                        <%
                    }
                    %>--%>
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



            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div ><%--class="portlet light bordered">--%>
                        <div ><%--class="portlet-body">--%>
                            <table class="double-menu-table table table-striped table-bordered table-hover order-column" id="sample_1_donotinit">
                                <thead>
                                <tr>
                                    <th>
                                        #
                                    </th>
                                    <th> Pořadí </th>
                                    <th> Odkazuje na </th>
                                    <th> Název </th>
                                    <th> Akce </th>
                                </tr>
                                </thead>
                                <tbody>
                                <%

                            //List<ModuleData> data = sh.getJPA().selectModuleDataLang(module,sh.shopSettings.defaultLanguage.getIsoCode());
                            int datasetCountera = 0;
                            List<ModuleData> data = sh.getJPA().selectModuleDataLang(module,sh.shopSettings.defaultLanguage.getIsoCode());
                            for(ModuleData md : data){
                                datasetCountera++;
                                %>
                                <tr class="odd gradeX">
                                    <td>
                                        <%=md.getId()%>
                                    </td>
                                    <td class="center">
                                        <input name="data-set" value="<%=datasetCountera%>" style="display:none;"/>
                                        <input name="column1-<%=datasetCountera%>" value="<%=md.getColumn1()%>"  style="display:none;"/>
                                        <input name="column2-<%=datasetCountera%>" value="<%=md.getColumn2()%>" class="form-control"/>
                                    </td>
                                    <td><input name="column3-<%=datasetCountera%>" value="<%=md.getColumn3()%>" class="form-control"/></td>
                                    <td>
                                        <%
                                        for(Language lang : sh.shopSettings.languages){
                                            ModuleData langData = sh.jpa.selectModuleDataLangCoresponding(module,lang.getIsoCode(),md.getColumn2());
                                            System.out.println(module.getId()+","+lang.getIsoCode()+","+md.getColumn2());

                                            System.out.println("MD 4 X"+langData);
                                            if(langData==null){
                                                langData=md;
                                            }
                                            %>
                                            <div class="lang-group-<%=lang.getIsoCode()%> lang-group <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode()) ?"shown":""%>">
                                                <div class="input-group">
                                                    <input class="form-control" type="text" name="column4-<%=datasetCountera%>-<%=lang.getIsoCode()%>" value="<%=langData.getColumn4()%>">
                                                    <span class="input-group-addon"><%=lang.getIsoCode()%></span>
                                                </div>
                                            </div>
                                            <%
                                        }
                                        %>
                                    </td>
                                    <td>
                                        <a href="javascript:;" class="btn btn-sm red btn-outline grey-salsa"><i class="fa fa-times"></i> Deaktivovat</a>
                                    </td>
                                </tr>
                                <%
                                //datasetCountera++;
                            }
                            %>
                                </tbody>
                            </table>
                            <a style="margin-left:20px;" class="add-double-menu-link btn btn-circle blue btn-outline pull-right active">Přidat záznam</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

