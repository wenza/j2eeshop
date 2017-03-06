<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CmsCategory" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Cms" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CmsCategoryLang" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CmsLang" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/21/17
  Time: 7:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = (CustomerSessionHolder) session.getAttribute("shC");
%>
<footer class="footer">
    <section>
        <div class="container">
                <%
                    List<CmsCategory> categories = sh.jpa.selectCmsCategoryByModuleName("footer-editor");
                    for(CmsCategory cmsCat : categories){
                        CmsCategoryLang cmsCategoryLang = cmsCat.getLang(sh.getLang(),sh.jpa);
                        %>
                        <div class="footer-block col-lg-2 col-md-2 col-sm-4 col-xs-12">
                            <h4 class="title-block"><span><%=cmsCategoryLang.getName()%></span></h4>
                            <ul class="footer-ul list-group">
                            <%

                            for(Cms cms : sh.jpa.selectCmsCategoryCmss(cmsCat)){
                                CmsLang cmsLang = cms.getLang(sh.getLang(),sh.jpa);
                                %><li><a href="?page=cms&id=<%=cms.getId()%>"><%=cmsLang.getName()%></a></li><%
                            }
                            %>
                            </ul>
                        </div>
                        <%

                    }
                %>
            <div class="footer-block col-lg-2 col-md-2 col-sm-4 col-xs-12">
                <h4 class="title-block"><span>Kontaktujte nás</span></h4>
                <ul class="footer-ul list-group">
                    <li><a href="#">Tel.: <%=sh.shopSettings.getContactPhone()%></a></li>
                    <li><a href="#">Email: <%=sh.shopSettings.getContactEmail()%></a></li>
                </ul>
            </div>
            <div class="footer-block footer-social col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <a target="_blank" href="<%=sh.shopSettings.getFacebookLink()%>" target="_blank" title="Facebook" class="facebook">Facebook</a>
                <a target="_blank" href="<%=sh.shopSettings.getYoutubeLink()%>" title="Youtube" class="youtube">Youtube</a>
                <a target="_blank" href="<%=sh.shopSettings.getInstagramLink()%>" title="Instagram" class="instagram">Instagram</a>
                <a target="_blank" href="<%=sh.shopSettings.getPinterestLink()%>" target="_blank" title="Pinterest" class="pinterest">Pinterest</a>
            </div>
        </div>
    </section>
</footer>