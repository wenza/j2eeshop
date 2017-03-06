<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String query = TestReq.Str(request,"q");
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
    if(!"".equals(query)){
        List<Product> productList = sh.jpa.selectProductBySearch(query);
        if(productList.isEmpty()){
            %>
            <div class="container-fluid row page-headline">
                <h1>Výsledek pro vyhledávání "<%=query%>" nebyl nalezen</h1>
            </div>
            <%
        }else{
            %>
            <div class="container-fluid row page-headline">
                <h1>Výsledek vyhledávání "<%=query%>"</h1>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <%
                    for(Product p : productList){
                        request.setAttribute("product",p);
                        %><jsp:include page="/modules/frontend-category-item-box/box.jsp"/><%
                    }
                    %>

                </div>
            </div>
            <hr>
            <%
        }
    }else{
        %>

        <div class="container-fluid row page-headline">
            <h1>Výsledek pro vyhledávání "<%=query%>" nebyl nalezen</h1>
        </div>
        <%
    }
    %>
<jsp:include page="../_main/newsletter.jsp"/>