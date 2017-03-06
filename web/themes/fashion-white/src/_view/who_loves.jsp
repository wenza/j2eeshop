<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleData" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleDataLang" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    CustomerSessionHolder sh = (CustomerSessionHolder) session.getAttribute("shC");
    Class className = ModuleData.class;
    ModuleData entity = (ModuleData) sh.getJPA().selectByID(className,request);
    ModuleDataLang mdl = entity.getLang(sh.getLang(),sh.jpa);
%>
<div class="hidden">
    <h1><%=mdl.getColumn1()%></h1>
    <%--<p>Vítejte ve Blogu LOVELILI.cz, zde se dozvíte všechny novinky ať už o výrobě našich výrobků, tak třeba i tip na dovolenou anebo co dnes v dnešních horkých dnech uvařit k obědu po těžkém dni v práci.</p>--%>
</div>

<jsp:include page="/modules/box-tiles-page/frontend/page.jsp"/>
<jsp:include page="../_main/newsletter.jsp"/>