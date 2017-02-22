<%@ page import="com.worstentrepreneur.utils.TestReq" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String query = TestReq.Str(request,"q");
%>
<div class="container-fluid row page-headline">
    <h1>Výsledek vyhledávání "<%=query%>"</h1>
</div>

<jsp:include page="/modules/category-item-box/module.jsp"/>
<jsp:include page="/modules/category-item-box/module.jsp"/>
<jsp:include page="/modules/category-item-box/module.jsp"/>

<hr>
<jsp:include page="../_main/newsletter.jsp"/>