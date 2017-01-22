<%@ page import="com.worstenrepreneur.utils.TestReq" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/15/17
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String pageX = TestReq.Str(request,"page");
    long idX = TestReq.Long(request,"id");//pageX);
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
        if(idX!=0){
            %><jsp:include page="src/_view/blog_open.jsp"/><%
        }else{
            %><jsp:include page="src/_view/blog.jsp"/><%
        }
    }else if("who-loves-lili".equals(pageX)){
        //Will be something like image-box-module
        %><jsp:include page="src/_view/who_loves.jsp"/><%
    }else if("just-in".equals(pageX)){
        %><jsp:include page="src/_view/just_in.jsp"/><%
    }else if("lili-help".equals(pageX)){
        %><jsp:include page="src/_view/text_content_open.jsp"/><%
    }else if("shop".equals(pageX)){
        %><jsp:include page="src/_view/shop_page.jsp"/><%
    }else if("category".equals(pageX)){
        %><jsp:include page="src/_view/category.jsp"/><%
    }else if("item".equals(pageX)){
        %><jsp:include page="src/_view/item.jsp"/><%
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
</html>