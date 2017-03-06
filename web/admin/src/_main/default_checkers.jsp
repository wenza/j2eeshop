<%@ page import="com.worstentrepreneur.j2eeshop.bean.OrderStateBean" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 2/27/17
  Time: 11:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    OrderStateBean.checkDefault(AdminSessionHolder.get(session));
%>