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
    TestReq.printParams(request);
    TestReq.printProcessJSPHeader(request);
    AdminSessionHolder sh = AdminSessionHolder.get(session);
    Class className = ModuleData.class;
    ModuleData md = (ModuleData)sh.getJPA().selectByID(className,request);
    String moduleName = TestReq.Str(request,"module");
    Module module = sh.jpa.selectModuleByName(moduleName);
    System.out.println("CCCCCCCCC=============="+TestReq.Str(request,"column-2"));
    if(module!=null) {
        if(md==null)md=new ModuleData();
        //int entityType = 1;

        /*String lang_column_2_gb = TestReq.Str(request, "lang-column-2-gb");//
        String lang_column_2_cs = TestReq.Str(request, "lang-column-2-cs");//meta-title
        String lang_column_3_cs = TestReq.Str(request, "lang-column-3-cs");//meta-desc
        String lang_column_3_gb = TestReq.Str(request, "lang-column-3-gb");//
        String lang_column_4_gb = TestReq.Str(request, "lang-column-4-gb");//
        String lang_column_4_cs = TestReq.Str(request, "lang-column-4-cs");//meta-keywords
        String lang_column_1_gb = TestReq.Str(request, "lang-column-1-gb");//
        String lang_column_1_cs = TestReq.Str(request, "lang-column-1-cs");//WROTE ABOUT US
        */
        //String module = TestReq.Str(request, "module");//box-tiles-page

        //String module_entity = TestReq.Str(request, "module-entity");//page
        //String action = TestReq.Str(request, "action");//process
        //String id = TestReq.Str(request, "id");//144

        String column_1 = TestReq.Str(request, "column-1");//1
        String column_2 = TestReq.Str(request, "column-2");//
        String column_3 = TestReq.Str(request, "column-3");//
        String column_4 = TestReq.Str(request, "column-4");//
        String column_5 = TestReq.Str(request, "column-5");//
        String column_6 = TestReq.Str(request, "column-6");//

        md.setColumn1(column_1);
        md.setColumn2(column_2);
        md.setColumn3(column_3);
        md.setColumn4(column_4);
        md.setColumn5(column_5);
        //md.setColumn6(column_6);
        md.setModule(module);
        md=(ModuleData)sh.jpa.merge(md);

    }

%>
