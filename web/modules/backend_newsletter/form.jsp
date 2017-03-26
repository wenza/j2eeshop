<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Properties" %>
<%@ page import="com.worstentrepreneur.utils.PropertyHandler" %>
<%@ page import="java.util.List" %>
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
    AdminSessionHolder sh = AdminSessionHolder.get(session);
    String className = "newsletter";
    Module module = sh.jpa.selectModuleByName(className);
    List<ModuleData> data = sh.getJPA().selectModuleData(module);
    String moduleEntity = "record";
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="?page=module&module=<%=className%>&action=process">
            <div class="page-title" style="margin-top:0;">
                <div class="row">
                    <div class="col-md-6 ta-l">
                        <div class="col-md-12 form-group" >
                            <h1>Kompozice emailu</h1>
                        </div>
                    </div>
                    <div class="col-md-6 ta-r">
                        <button type="submit" style="margin-left:20px;" class="btn btn-circle green-jungle btn-outline pull-right active">Odeslat</button>
                    </div>
                </div>
            </div>

            <div class="portlet-body">
                <div class="form-body " >
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Název</label>
                                <div class="col-md-6">
                                    <%
                                    String valuesFolderPath = sh.getSettings().getWarPath()+"/modules/backend_mailtemplate-editor/user_data/template-values/";
                                    File valuesFolder = new File(valuesFolderPath);
                                    if(valuesFolder==null)valuesFolder.mkdirs();
                                    %>
                                    <select class="form-control select2" name="template" >
                                        <%
                                            for(File f : valuesFolder.listFiles()) {
                                                if (f.getName().endsWith(".properties")) {
                                                    Properties props = PropertyHandler.read(f.getAbsolutePath());
                                                    String id = f.getName().replaceFirst("[.][^.]+$", "");
                                                    String name = (String) props.get("name");
                                                    //String desc = (String) props.get("desc");
                                                    %><option value="<%=id%>"><%=name%></option><%

                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Předmět</label>
                                <div class="col-md-6">
                                    <input name="subject" value="Newsletter" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Příjemci</label>
                                <div class="col-md-9">
                                    <%
                                        int i = 0;
                                        for(ModuleData o : data) {
                                            //ModuleNewsletterLang ol = o.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                            i++;
                                            int customerID = TestReq.Int(request, sh.mdv(o, moduleEntity + ".customer-id"));
                                            int browserInfoID = TestReq.Int(sh.mdv(o, moduleEntity + ".browser-info-id"));
                                            Date optIn = TestReq.Date(sh.mdv(o, moduleEntity + ".opted-date-long"));
                                            Date optOut = sh.mdv(o, moduleEntity + ".optedout-date-long") == null ? null : TestReq.Date(sh.mdv(o, moduleEntity + ".optedout-date-long"));
                                            String email = sh.mdv(o, moduleEntity + ".email");
                                            BrowserInfo bi = sh.jpa.selectByID(BrowserInfo.class, browserInfoID);
                                            %>
                                            <div class="md-checkbox">
                                                <input type="checkbox" id="recipient-<%=i%>" name="recipient" value="<%=email%>" class="md-check" checked>
                                                <label for="recipient-<%=i%>">
                                                    <span></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span> <%=email%> </label>
                                            </div>
                                            <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

