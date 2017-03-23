<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Module" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Properties" %>
<%@ page import="com.worstentrepreneur.utils.PropertyHandler" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 3/22/17
  Time: 9:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = (AdminSessionHolder) session.getAttribute("shX");
    String className = TestReq.Str(request,"module");
    //Module module = sh.jpa.selectModuleByName(className);
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE TITLE-->
        <h1 class="page-title"> Šablony
            <small></small>
            <a href="?page=module&module=<%=className%>&module-entity=page&action=form" class="btn sbold green pull-right">
                <i class="fa fa-plus"></i> Přidat
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
                                <th> Název </th>
                                <th> Popis </th>
                                <th> Akce </th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                            String valuesFolderPath = sh.getSettings().getWarPath()+"/modules/backend_mailtemplate-editor/user_data/template-values/";
                            File valuesFolder = new File(valuesFolderPath);
                            System.out.println(valuesFolderPath);
                            if(valuesFolder==null)valuesFolder.mkdirs();
                            for(File f : valuesFolder.listFiles()){
                                if(f.getName().endsWith(".properties")){
                                    String id = f.getName().replaceFirst("[.][^.]+$", "");
                                    Properties props = PropertyHandler.read(f.getAbsolutePath());
                                    String name = (String)props.get("name");
                                    String desc = (String)props.get("desc");
                                    %>
                                    <tr class="odd gradeX">
                                        <td><%=id%></td>
                                        <td><%=name%></td>
                                        <td><%=desc%></td>
                                        <td>
                                            <a href="?page=module&module=<%=className%>&module-entity=page&action=form&id=<%=id%>" class="btn btn-sm btn-outline grey-salsa"><i class="fa fa-search"></i> Zobrazit</a>
                                            <a href="javascript:;" class="btn btn-sm red btn-outline grey-salsa"><i class="fa fa-times"></i> Deaktivovat</a>
                                        </td>
                                    </tr>
                                    <%
                                }
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
