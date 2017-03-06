<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/15/17
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String pageX = TestReq.Str(request,"page");
long idX = TestReq.Long(request,"id");//pageX);
CustomerSessionHolder sh = CustomerSessionHolder.get(session);
%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../../themes_shared/_main/head_seo.jsp"/>

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
    }else if("cms".equals(pageX)){
        if(idX!=0){
            %><jsp:include page="src/_view/cms_open.jsp"/><%
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
    }else if("product".equals(pageX)){
        %><jsp:include page="src/_view/product.jsp"/><%
    }else if("basket".equals(pageX)){
        %><jsp:include page="src/_view/basket.jsp"/><%
    }else if("checkout".equals(pageX)){
        int currentStep = TestReq.Int(request,"step");
        if(sh.customer==null?currentStep==6:currentStep==5){
            %><jsp:include page="src/_view/checkout_submitted.jsp"/><%
        }else{
            %><jsp:include page="../../modules/checkout-wizard/module.jsp"/><%
        }
    }else if("search".equals(pageX)){
        %><jsp:include page="src/_view/search.jsp"/><%
    }else if("box-tiles-page".equals(pageX)){
        //page not found
        %><jsp:include page="/modules/box-tiles-page/frontend/page.jsp" /><%
    }
    %>

    <jsp:include page="src/_main/footer.jsp"/>

    <!-- MODALS -->
    <jsp:include page="src/_main/modal_register.jsp"/>
    <jsp:include page="src/_main/modal_login.jsp"/>
    <jsp:include page="src/_main/modal_forgot_pwd.jsp"/>
    <jsp:include page="src/_main/modal_register_done.jsp"/>
    <script>
        $('.focusmodal').on('shown.bs.modal', function () {
            $(this).find('.focusme').focus();
        });
        //for each element that is classed as 'pull-down', set its margin-top to the difference between its own height and the height of its parent
        $('.pull-down').each(function() {
            var $this = $(this);
            $this.css('margin-top', $this.parent().height() - $this.height());
        });
        <%
        if(request.getParameter("logged")!=null){
            %>$('#modal-5').modal('show');<%
        }
        %>
    </script>


    <script src="themes/fashion-white/assets/js/_navbar.js"></script>
</html>