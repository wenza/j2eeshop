<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/23/17
  Time: 11:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
%>
<div class="container-fluid row exclude-dynamic-height">
    <div class="spacer-sm"></div>
    <div class="checkout-wizard">
        <div class="form-body">
            <ul class="nav nav-pills nav-justified steps">
                <li class="step-1">
                    <a href="?page=checkout&step=1" class="step" >
                        <span class="number"> 1 </span>
                        <span class="desc">KOŠÍK</span>
                    </a>
                </li>
                <%
                if(sh.customer==null){
                    %>
                    <li class="step-2">
                        <a href="?page=checkout&step=2" class="step" >
                            <span class="number"> 2 </span>
                            <span class="desc">ÚČET</span>
                        </a>
                    </li>
                    <%
                }
                %>
                <li class="step-<%=sh.customer==null?3:2%>">
                    <a href="?page=checkout&step=<%=sh.customer==null?3:2%>" class="step">
                        <span class="number"> <%=sh.customer==null?3:2%> </span>
                        <span class="desc">ADRESA </span>
                    </a>
                </li>
                <li class="step-<%=sh.customer==null?4:3%>">
                    <a href="?page=checkout&step=<%=sh.customer==null?4:3%>" class="step active">
                        <span class="number"> <%=sh.customer==null?4:3%> </span>
                        <span class="desc">ZPŮSOB DOPRAVY A PLATBY</span>
                    </a>
                </li>
                <li class="step-<%=sh.customer==null?5:4%>">
                    <a href="?page=checkout&step=<%=sh.customer==null?5:4%>" class="step">
                        <span class="number"> <%=sh.customer==null?5:4%> </span>
                        <span class="desc">POTVRZENÍ </span>
                    </a>
                </li>
            </ul>
            <div class="progress">
                <div class="progress-bar progress-bar-dark checkout-progress-bar" style="width:0;"></div>
            </div>
        </div>
    </div>
</div>