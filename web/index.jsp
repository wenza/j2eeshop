<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/15/17
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="src/_main/head_seo.jsp"/>

    <jsp:include page="src/_main/head_includes.jsp"/>
</head>
    <jsp:include page="src/_main/navbar.jsp"/>

    <jsp:include page="src/_view/homepage.jsp"/>

    <jsp:include page="src/_main/footer.jsp"/>

    <!-- MODALS -->
    <jsp:include page="src/_main/modal_register.jsp"/>
    <jsp:include page="src/_main/modal_login.jsp"/>


    <script src="assets/js/_header.js"></script>
    <script src="assets/js/_homepage.js"></script>
</html>