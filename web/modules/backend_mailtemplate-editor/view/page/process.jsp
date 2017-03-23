<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTree" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTreeObj" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="com.worstentrepreneur.j2eeshop.utils.AttributesCombinationHelper" %>
<%@ page import="com.worstentrepreneur.utils.PropertyHandler" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="com.worstentrepreneur.utils.FileHandler" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.MergeResult" %>

<%--
Created by IntelliJ IDEA.
User: wenza
Date: 6/3/14
Time: 10:30 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<String> errors = new ArrayList<>();
    TestReq.printParams(request);
    TestReq.printProcessJSPHeader(request);
    AdminSessionHolder sh = AdminSessionHolder.get(session);
    String entityName = TestReq.Str(request,"module-entity");
    String moduleName = TestReq.Str(request,"module");
    Module module = sh.jpa.selectModuleByName(moduleName);


    long id = TestReq.Long(request,"id");//123
    if(id==0)id=new Date().getTime();
    //String module_entity = TestReq.Str(request,"module-entity");//page
    //String fileupload_hidden_file_btn = TestReq.Str(request,"fileupload-hidden-file-btn");//String name = TestReq.Str(request,"name");//test123
    String template_folder = TestReq.Str(request,"template-folder");//universal
    //String desc = TestReq.Str(request,"desc");//popisdasd

    String templateFolder = sh.getSettings().getWarPath()+"/modules/backend_mailtemplate-editor/user_data/templates/"+template_folder;//+id+".properties";
    Properties templateProps = PropertyHandler.read(templateFolder+"/mailtemplate.properties");

    if(templateProps.getProperty("fields")!=null){
        String valuesPropertiesFolder = sh.getSettings().getWarPath()+"/modules/backend_mailtemplate-editor/user_data/template-values/"+id;//+id+".properties";
        File htmlF = new File(valuesPropertiesFolder+".html");
        if(!htmlF.exists())htmlF.createNewFile();
        File propsF = new File(valuesPropertiesFolder+".properties");
        if(!propsF.exists())htmlF.createNewFile();
        //FileHandler.copy()

        String html = FileHandler.read(templateFolder+"/mailtemplate.html");
        System.out.println(templateFolder);
        System.out.println(html);

        Properties valProps = PropertyHandler.read(valuesPropertiesFolder+".properties");
        Map<String, String[]> parameters = request.getParameterMap();
        for(String parameter : parameters.keySet()) {
            String value =TestReq.Str(request,parameter);
            if(!"module-entity".equals(parameter) && !"fileupload-hidden-file-btn".equals(parameter)){
                if("template-folder".equals(parameter)){
                    value="/modules/backend_mailtemplate-editor/user_data/templates/"+template_folder+"/";
                }
                valProps.setProperty(parameter, value);
            }
            html = html.replaceAll("\\*\\|"+parameter+"\\|\\*", value);
        }
        PropertyHandler.store(valProps,valuesPropertiesFolder+".properties");
        FileHandler.write(htmlF.getAbsolutePath(),html);
    }else{
        errors.add("Špatné nastavení předlohy šablony");
    }
    MergeResult mr = new MergeResult(moduleName,errors);
    request.setAttribute("module-merge-result",mr);

%>
