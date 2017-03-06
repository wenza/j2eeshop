<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 3/1/17
  Time: 3:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title><%=request.getAttribute("seo-title")%></title>
<meta name="description" content="<%=request.getAttribute("seo-description")%>">
<meta name="keywords" content="<%=request.getAttribute("seo-keywords")%>">
<meta property="og:title" content="<%=request.getAttribute("seo-title")%>">
<meta property="og:description" content="<%=request.getAttribute("seo-description")%>">
<meta property="og:site_name" content="<%=request.getAttribute("seo-site-name")%>">
<meta property="og:url" content="<%=request.getAttribute("seo-url")%>">
<meta property="og:image" content="<%=request.getAttribute("seo-img")%>">
<meta property="og:type" content="website">