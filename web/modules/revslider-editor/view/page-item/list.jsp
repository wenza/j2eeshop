<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Module" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleData" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleDataLang" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 2/17/17
  Time: 12:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    AdminSessionHolder sh = AdminSessionHolder.get(session);
    String moduleName = TestReq.Str(request,"module");
    String moduleEntity = TestReq.Str(request,"module-entity");
    Module module = sh.jpa.selectModuleByName(moduleName);
    int pageID = TestReq.Int(request,"page-id");
    List<ModuleData> moduleData = sh.jpa.selectModuleDataWithParentID(module,pageID,ModuleData.TYPE_PAGE_ITEM);//selectModuleDataWithType(module,ModuleData.TYPE_PAGE_ITEM);//1=TYPE_PAGE
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">

        <h1 class="page-title">Seznam Slidů
            <small></small>
            <a href="?page=module&module=<%=moduleName%>&module-entity=<%=moduleEntity%>&action=form&page-id=<%=pageID%>&lang=<%=sh.shopSettings.defaultLanguage.getIsoCode()%>" class="btn sbold green pull-right">
                <i class="fa fa-plus"></i> Přidat
            </a>
        </h1>


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
                                <th> Akce </th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for(ModuleData md : moduleData){
                                    //List<ModuleDataLang> mdl = sh.jpa.selectModuleDataLang(md);
                            %>
                            <tr>
                                <td><%=md.getId()%></td>
                                <td><%=sh.mdv(md,"revslide.slide-path")%></td>
                                <td>
                                    <a href="javascript:;" class="btn btn-sm red btn-outline grey-salsa">
                                        <i class="fa fa-times"></i> Deaktivovat
                                    </a>
                                    <a href="?page=module&module=<%=moduleName%>&module-entity=<%=moduleEntity%>&action=form&id=<%=md.getId()%>&page-id=<%=pageID%>&lang=<%=sh.shopSettings.defaultLanguage.getIsoCode()%>" class="btn btn-sm orange btn-outline grey-salsa">
                                        <%--<i class="fa fa-times"></i>--%> Upravit
                                    </a>
                                </td>
                            </tr>
                            <%
                                }
                            %>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

