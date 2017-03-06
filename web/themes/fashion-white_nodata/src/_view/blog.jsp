<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Cms" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CmsCategory" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CmsLang" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 2:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
%>
<div class="container-fluid row page-headline">
    <h1>Blog</h1>
    <p>Vítejte v Blogu LOVELILI.cz, zde se dozvíte všechny novinky ať už o výrobě našich výrobků, tak třeba i tip na dovolenou anebo co dnes v dnešních horkých dnech uvařit k obědu po těžkém dni v práci.</p>
</div>
<div class="container">
    <div class="row page-content">
        <%
        List<CmsCategory> cmsCategories = sh.jpa.selectCmsCategoryByModuleName("blog-editor");
        //for(int i = 0;i<1;i++){
            System.out.println("CMSXdsa-------------=");
        for(CmsCategory cmsCategory : cmsCategories) {
            System.out.println("CMSXdsa=");
            for(Cms cms : sh.jpa.selectCmsCategoryCmss(cmsCategory)) {
                System.out.println("CMSXdsa=432");
                CmsLang cmsLang = cms.getLang(sh.getLang(),sh.jpa);
                if(!"".equals(cms.getImageURL())){
                    %>
                    <div class="col-md-12">
                        <h2 class="ccc-c-pink"><%=cmsLang.getName()%></h2>
                        <a class="mgg" href="?page=blog&id=<%=cms.getId()%>" style="display:block;width:100%;height:355px;background-image:url('<%=cms.getImageURL()%>');background-size: cover;background-position: center center;">
                            <%--<img src="" title="" alt="Elpha Jewels pro LOVELILI">--%>
                            <div class="ccc-c-pink" style="position:absolute;width:70px;height:70px;background:white;margin-top: 10px;
                right: 25px;padding: 10px;font-size: 20px;line-height: 25px;font-weight:900;">30.11.<br><span style="font-weight:300;font-size: 14px;" class="year">2016</span></div>
                        </a>
                        <div class="spacer-sm"></div>
                        <p>
                            <%=cmsLang.getDescription()%>
                        </p>
                        <div class="spacer-sm"></div>
                        <a href="?page=blog&id=<%=cms.getId()%>" class="btn btn-pink">Více</a>
                        <div class="spacer-sm"></div>
                        <hr>
                        <div class="spacer-sm"></div>
                    </div>
                    <%
                }else{
                    %>
                    <div class="col-md-12">
                        <div>
                            <h2 class="ccc-c-pink" style="display:inline-block;"><%=cmsLang.getName()%></h2>
                            <span>30.11.2016</span>
                        </div>
                        <div class="spacer-sm"></div>
                        <p>
                            <%=cmsLang.getDescription()%>
                        </p>
                        <div class="spacer-sm"></div>
                        <a href="?page=blog&id=<%=cms.getId()%>" class="btn btn-pink">Více</a>
                        <div class="spacer-sm"></div>
                        <hr>
                        <div class="spacer-sm"></div>
                    </div>
                    <%
                }
            }
        }
        %>
    </div>

</div>
<hr>
<jsp:include page="../_main/newsletter.jsp"/>