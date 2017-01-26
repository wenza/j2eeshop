<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/26/17
  Time: 6:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
    <jsp:include page="src/_main/head_includes.jsp"/>
<head>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md">
<div class="page-wrapper">
    <jsp:include page="src/_main/navbar.jsp"/>
    <!-- BEGIN HEADER & CONTENT DIVIDER -->
    <div class="clearfix"> </div>
    <!-- END HEADER & CONTENT DIVIDER -->
    <!-- BEGIN CONTAINER -->
    <div class="page-container">
        <jsp:include page="src/_main/sidebar.jsp"/>
        <jsp:include page="src/_view/homepage.jsp"/>
        <%--<jsp:include page="src/_main/sidebar_quick.jsp"/>--%>
    </div>
    <jsp:include page="src/_main/footer.jsp"/>
</div>
<jsp:include page="src/_main/quick_nav.jsp"/>
<jsp:include page="src/_main/footer_js.jsp"/>

</body>
</html>