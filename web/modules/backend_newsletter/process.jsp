<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page import="com.worstentrepreneur.utils.jtree.JTree" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTreeObj" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="com.worstentrepreneur.j2eeshop.utils.AttributesCombinationHelper" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.MergeResult" %>
<%@ page import="com.worstentrepreneur.utils.*" %>

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

    String subject = TestReq.Str(request,"subject");

    if(!"".equals(subject)) {
        String originalPath = "/modules/backend_mailtemplate-editor/user_data/template-values/" + Long.parseLong(request.getParameter("template")) + ".html";
        File html = new File(sh.shopSettings.getAbsolutePathOfWar()+originalPath);
        System.out.println("ABS:"+html.getAbsolutePath());
        if (html.exists()) {
            String[] recipients = request.getParameterValues("recipient");
            for (String recipientX : recipients) {
                System.out.println("Sending to: "+recipientX);
                String recipient = TestReq.Str(recipientX);
                if (!Validator.mailValidate(recipient)){
                    System.out.println("Mail: "+recipient+" is not valid");
                    recipient = null;
                }
                if (recipient != null) {
                    SendMailTLS.sendContentInThread(sh.shopSettings.getMailFrom(), recipient,subject, originalPath);//html.getAbsolutePath());
                } else {
                    errors.add("Email: " + recipient + " není validní, ostatním případům byl email odeslán.");
                }
            }
        } else {
            errors.add("Obsah emailu neexistuje");
        }
    }else{
        errors.add("Subjekt nesmí být prázdný");
    }

    MergeResult mr = new MergeResult(moduleName,errors);
    request.setAttribute("module-merge-result",mr);

%>
