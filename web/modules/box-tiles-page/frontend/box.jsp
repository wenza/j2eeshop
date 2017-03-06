<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleData" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleDataLang" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 8:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    CustomerSessionHolder sh = (CustomerSessionHolder) session.getAttribute("shC");
    ModuleData md = (ModuleData) request.getAttribute("module-data");
    ModuleDataLang mdl = md.getLang(sh.getLang(),sh.jpa);
%>
<div class="image-link-box col-xs-6 col-sm-4 col-md-3 col-lg-5ths">
    <h3>
        <a href="<%=md.getColumn5()%>" target="_blank">
            <strong><%=mdl.getColumn1()%></strong>
        </a>
    </h3>
    <a href="<%=md.getColumn5()%>" target="_blank">
        <img src="<%=md.getColumn4()%>" title="<%=mdl.getColumn1()%>" class="img-responsive" alt="<%=mdl.getColumn1()%>">
    </a>
</div>

<%--
<div class="productcat col-xs-12 col-sm-6 col-md-4 col-lg-2">
    <h3>
        <a href="/img/gallery-full/1059/0.jpg" class="fancybox" title="Blogerka Renáta Brožová">

            <strong>Blogerka Renáta Brožová</strong>
        </a>
    </h3>
    <a id="img1059" rel="gallery2" href="/img/gallery-full/1059/0.jpg" class="fancybox">

        <img src="/img/blogcrop/1059/0.jpg" title="Blogerka Renáta" class="img-responsive" alt="Blogerka Renáta Brožová">
    </a>
</div>--%>
