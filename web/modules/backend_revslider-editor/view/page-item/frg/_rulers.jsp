<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 2/19/17
  Time: 9:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="ruler-hor" style="background-position: -5px 50%;">
    <ul class="linear-texts" style="left: 0px;">
        <%
            for(int i = -600;i<=4000;i++){
        %><li><span><%=i%></span></li><%
            i+=99;
        }
    %>
    </ul>
</div>
<div id="ruler-ver">
    <ul class="linear-texts">
        <%
            for(int i = 0;i<=1900;i++){
        %><li><span><%=i%></span></li><%
            i+=99;
        }
    %>
    </ul>
</div>