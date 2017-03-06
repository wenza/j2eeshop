<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Module" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleData" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.BrowserInfo" %>
<%@ page import="java.util.Date" %>
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
    String className = "newsletter";
    Module module = sh.jpa.selectModuleByName(className);
    List<ModuleData> data = sh.getJPA().selectModuleData(module);
    //String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();


    String moduleName = TestReq.Str(request,"module");
    String moduleEntity = TestReq.Str(request,"module-entity");

%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE TITLE-->
        <h1 class="page-title"> Newsletter
            <small></small>
            <a href="?page=entity-form&entity=" class="btn sbold green pull-right">
                <i class="fa fa-plus"></i> Komponovat email
            </a>
        </h1>
        <!-- END PAGE TITLE-->
        <!-- END PAGE HEADER-->
        <%--<div class="note note-info">
            <p> Here will be homepage dashboard </p>
        </div>--%>
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                <div ><%--class="portlet light bordered">--%>
                        <div ><%--class="portlet-body">--%>
                        <table class="table table-striped table-bordered table-hover order-column" id="sample_1_donotinit">
                            <thead>
                            <tr>
                                <th>
                                    #
                                </th>
                                <th> Mail </th>
                                <th> Info prohlížeče </th>
                                <th> IP </th>
                                <th> Operační systém </th>
                                <th> Přihlášen </th>
                                <th> Odhlášen </th>
                                <th> Akce </th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for(ModuleData o : data){
                                    //ModuleNewsletterLang ol = o.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                    int customerID = TestReq.Int(request,sh.mdv(o,moduleEntity+".customer-id"));
                                    int browserInfoID = TestReq.Int(sh.mdv(o,moduleEntity+".browser-info-id"));
                                    Date optIn = TestReq.Date(sh.mdv(o,moduleEntity+".opted-date-long"));
                                    Date optOut = sh.mdv(o,moduleEntity+".optedout-date-long")==null?null: TestReq.Date(sh.mdv(o,moduleEntity+".optedout-date-long"));
                                    String email = sh.mdv(o,moduleEntity+".email");
                                    BrowserInfo bi = sh.jpa.selectByID(BrowserInfo.class,browserInfoID);

                                    %>
                                    <tr class="odd gradeX">
                                        <td>
                                            <%=o.getId()%>
                                        </td>
                                        <td class="center"> <%=email%> </td>
                                        <td><%=bi.getBrowserinfo()%></td>
                                        <td><%=bi.getIp()%></td>
                                        <td><%=bi.getOperatingSystem()%></td>
                                        <td><%=optIn%></td>
                                        <td><%=optOut%></td>
                                        <td>
                                            <a href="javascript:;" class="btn btn-sm red btn-outline grey-salsa"><i class="fa fa-times"></i> Deaktivovat</a>
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
    <!-- END CONTENT BODY -->
</div>
