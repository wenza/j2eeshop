<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleData" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleDataLang" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Module" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- container -->
<%

    CustomerSessionHolder sh = (CustomerSessionHolder) session.getAttribute("shC");
    Class className = ModuleData.class;
    ModuleData entity = (ModuleData) sh.getJPA().selectByID(className,request);
    //ModuleDataLang mdl = entity.getLang(sh.getLang(),sh.jpa);


    String moduleName = "box-tiles-page";
    String moduleEntity = TestReq.Str(request,"module-entity");
    int pageID = TestReq.Int(request,"id");
    Module module = sh.jpa.selectModuleByName(moduleName);
    List<ModuleData> moduleData = sh.jpa.selectModuleDataWithParentID(module,pageID,ModuleData.TYPE_PAGE_ITEM);
%>
<div class="container-fluid">
    <div class="row">
        <%
            for(ModuleData md : moduleData){
                request.setAttribute("module-data",md);
                %>
                <jsp:include page="box.jsp"/>
                <%
            }
        %>
    </div>
</div>