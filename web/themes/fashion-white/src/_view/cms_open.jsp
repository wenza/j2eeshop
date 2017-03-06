<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Cms" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CmsLang" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 9:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
    Cms cms = sh.jpa.selectByID(Cms.class,request);
    CmsLang cmsLang = cms.getLang(sh.getLang(),sh.jpa);
%>
<div class="container page-headline">
    <h1><%=cmsLang.getName()%></h1>
    <p>
        <%=cmsLang.getDescription()%>
    </p>
</div>

<div class="container">
    <div class="col-md-12">
        <%=cmsLang.getContent()%>
    </div>
</div>