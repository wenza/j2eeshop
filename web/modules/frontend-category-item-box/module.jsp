<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- container -->
<div class="container-fluid">
    <div class="row">
        <%
            for(int i = 0;i<15;i++){
                %>
                <jsp:include page="box.jsp"/>
                <%
            }
        %>
    </div>
</div>