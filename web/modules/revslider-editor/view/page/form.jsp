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
    String moduleName = TestReq.Str(request,"module");
    String entityName = TestReq.Str(request,"module-entity");
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="?page=module&module=<%=moduleName%>&module-entity=<%=entityName%>&action=process">
            <input type="hidden" name="id" value="<%=entity!=null?entity.getId():0%>"/>
            <input type="hidden" name="column-1" value="<%=entity!=null?sh.mdv(entity,"row-type"):ModuleData.TYPE_PAGE%>"/>

            <div class="page-title" style="margin-top:0;">
                <div class="row">
                    <div class="col-md-6 ta-l">
                        <div class="col-md-12 form-group">
                            <label class="col-md-3 control-label" style="text-align:left;margin:0;padding:0;">Název</label>
                            <div class="col-md-9">
                                <input type="text" name="column-2" class="form-control" <%=entity!=null?"disabled":""%> value="<%=entity!=null?sh.mdv(entity,"revslider.name"):""%>">
                            </div>
                        </div>
                    </div>
                    <%
                    if(entity==null){
                        %>
                        <div class="col-md-6 ta-r">
                            <button type="submit" style="margin-left:20px;" class="btn btn-circle green-jungle btn-outline pull-right active">Uložit</button>
                        </div>
                        <%
                    }
                    %>
                </div>
            </div>
        </form>
    </div>
</div>