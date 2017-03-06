<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.JPAUtil" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="java.util.HashSet" %>
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

    String moduleName = TestReq.Str(request,"module");
    String moduleEntity = TestReq.Str(request,"module-entity");
    Module module = sh.jpa.selectModuleByName(moduleName);

    int parentID = TestReq.Int(request,"page-id");
    CmsCategory parent = sh.jpa.selectByID(CmsCategory.class,parentID);
    if(parent!=null){


        Set<Cms> list = parent.getCms(sh.jpa);
        String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();
        CmsCategoryLang parentLang = parent.getLang(sh.shopSettings.defaultLanguage,sh.jpa);

%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE TITLE-->
        <h1 class="page-title"> Články - <%=parentLang.getName()%>
            <small></small>
            <a href="?page=entity-form&entity=cms-of-category&parent-id=<%=parentID%>" class="btn sbold green pull-right">
                <i class="fa fa-plus"></i> Přidat
            </a>
            <a href="?page=entity-form&entity=cms-category&id=<%=parentID%>" class="btn sbold blue pull-right">
                Upravit SEO Strany - <%=parentLang.getName()%>
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
                                <th> CMS Kategorie </th>
                                <th> Název </th>
                                <th> Pozice </th>
                                <th> Datum </th>
                                <th> Typ </th>
                                <th> Aktivní </th>
                                <th> Akce </th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for(Cms o : list){
                                    CmsLang ol = o.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                    %>
                                    <tr class="odd gradeX">
                                        <td>
                                            <%=o.getId()%>
                                        </td>
                                        <td class="center"> <%=parentLang.getName()%> </td>
                                        <td class="center"> <%=ol.getName()%></td>
                                        <td class="center"> <%=o.getPosition()%></td>
                                        <td class="center"> <%=o.getDateAdd()%></td>
                                        <td class="center"> <%=o.getType()%></td>
                                        <td class="center">
                                            <%if(o.isActive()){
                                                %><span aria-hidden="true" class="icon-check font-green-jungle font-lg"></span> &nbsp; </span><%
                                            }else{
                                                %><span aria-hidden="true" class="icon-close font-red-thunderbird font-lg"></span> &nbsp; </span><%
                                            }%>
                                        </td>
                                        <td>
                                            <a href="?page=entity-form&entity=cms-of-category&id=<%=o.getId()%>" class="btn btn-sm btn-outline grey-salsa"><i class="fa fa-search"></i> Zobrazit</a>
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
<%}%>