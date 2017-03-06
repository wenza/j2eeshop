<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CategoryLang" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Product" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    CustomerSessionHolder sh = (CustomerSessionHolder) session.getAttribute("shC");
    Category category = sh.jpa.selectByID(Category.class,request);
    List<Category> categories = sh.jpa.selectCategoryChildren(category);
    for(Category cat : categories){
        CategoryLang clang = cat.getLang(sh.getLang(),sh.jpa);
        %>

        <div class="container-fluid row page-headline">
            <h1><%=clang.getName()%></h1>
        </div>
        <%
        for(Product p : sh.jpa.selectCategoryProducts(cat)){
            request.setAttribute("product",p);
            %>
            <div class="container-fluid">
                <div class="row">
                    <jsp:include page="/modules/frontend-category-item-box/box.jsp"/>
                </div>
            </div>
            <%
        }
    }
%>

<hr>
<jsp:include page="../_main/newsletter.jsp"/>