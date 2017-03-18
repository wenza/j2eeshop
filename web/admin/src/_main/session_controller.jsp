<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/28/17
  Time: 9:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = AdminSessionHolder.get(session);
    if(request.getParameter("logout")!=null){
        sh = new AdminSessionHolder();
    }
    if(sh==null){
        sh = new AdminSessionHolder();
    }
    sh.update(session);
    if(request.getParameter("login")!=null){
        %><jsp:include page="/admin/ajax_user_login.jsp"/><%
    }
%>