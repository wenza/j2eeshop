<%@ page import="com.worstenrepreneur.utils.TestReq" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/15/17
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String pageX = TestReq.Str(request,"page");
%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="src/_main/head_seo.jsp"/>

    <jsp:include page="src/_main/head_includes.jsp"/>
</head>
    <jsp:include page="src/_main/navbar.jsp"/>

    <div style="width:100%;height:100px;"><!--SPACER FOR FULLWIDTH--></div>
    <%
    if("".equals(pageX)){
        %><jsp:include page="src/_view/homepage.jsp"/><%
    }else if("user".equals(pageX)){
        %><jsp:include page="src/_view/user_account.jsp"/><%
    }else if("blog".equals(pageX)){
        %><jsp:include page="src/_view/blog.jsp"/><%
    }else{
        //page not found

    }
    %>

    <jsp:include page="src/_main/footer.jsp"/>

    <!-- MODALS -->
    <jsp:include page="src/_main/modal_register.jsp"/>
    <jsp:include page="src/_main/modal_login.jsp"/>
    <script>
        $('.focusmodal').on('shown.bs.modal', function () {
            $(this).find('.focusme').focus();
        });
    </script>


    <script src="assets/js/_navbar.js"></script>
    <script src="assets/js/_homepage.js"></script>
</html>