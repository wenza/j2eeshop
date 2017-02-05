<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.bean.CategoryBean" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.MergeResult" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/26/17
  Time: 6:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="src/_main/session_controller.jsp"/>
<%
    AdminSessionHolder sh = (AdminSessionHolder) session.getAttribute("shX");
    String pageX = TestReq.Str(request,"page");
    String entName = TestReq.Str(request,"entity");
%>
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
        <%
        if("category".equals(entName) ){
            if("entity-process".equals(pageX)) {
                MergeResult mr = CategoryBean.merge(request,session);
                for(String err : mr.errors){
                    System.out.println(err);
                }
            }
            if("entity-form".equals(pageX)){
                %>
                    <jsp:include page="src/_view/category/form.jsp"/>

                <%
            }else if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/category/list.jsp"/><%
            }
        }else if("tax".equals(entName)){
            if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/tax/list.jsp"/><%
            }
        }else if("customer".equals(entName)){
            if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/customer/list.jsp"/><%
            }
        }else if("shipping".equals(entName)){
            if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/shipping/list.jsp"/><%
            }
        }else if("manufacturer".equals(entName)){
            if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/manufacturer/list.jsp"/><%
            }
        }else if("country".equals(entName)){
            if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/country/list.jsp"/><%
            }
        }else if("order-state".equals(entName)){
            if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/order-state/list.jsp"/><%
            }
        }else if("order".equals(entName)){
            if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/order/list.jsp"/><%
            }
        }else if("product".equals(entName)){
            if("entity-process".equals(pageX)) {
                MergeResult mr = CategoryBean.merge(request,session);
                for(String err : mr.errors){
                    System.out.println(err);
                }
            }
            if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/product/list.jsp"/><%
            }else if("entity-form".equals(pageX)){
                %><jsp:include page="src/_view/product/form.jsp"/><%
            }
        }else if("cms-category".equals(entName)){
            if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/cms-category/list.jsp"/><%
            }
        }else if("cms-of-category".equals(entName)){
            if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/cms-of-cms-category/list.jsp"/><%
            }
        }else if("attribute".equals(entName)){
            if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/attribute/list.jsp"/><%
            }
        }else if("attribute-value".equals(entName)){
            if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/attribute-value/list.jsp"/><%
            }
        }else if("attribute-value-combination".equals(entName)){
            if("entity-list".equals(pageX)){
                %><jsp:include page="src/_view/attribute-value-combination/list.jsp"/><%
            }
        }
        %>
        <%--<jsp:include page="src/_view/homepage.jsp"/>--%>

        <%--<jsp:include page="src/_main/sidebar_quick.jsp"/>--%>
    </div>
    <jsp:include page="src/_main/footer.jsp"/>
</div>
<%--<jsp:include page="src/_main/quick_nav.jsp"/>--%>
<jsp:include page="src/_main/footer_js.jsp"/>

</body>
</html>