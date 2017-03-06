<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Customer" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Order" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 2/26/17
  Time: 7:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
    if(sh!=null) {

        Order o = sh.order;
        if(o==null){

        }


        sh.update(session);
    }
%>