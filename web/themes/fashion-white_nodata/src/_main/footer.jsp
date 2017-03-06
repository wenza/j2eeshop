<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CmsCategory" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Cms" %><%--
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
            <div class="footer-block col-lg-2 col-md-2 col-sm-4 col-xs-12">
                <h4 class="title-block"><span>O Lovelili</span></h4>
                <ul class="footer-ul list-group">
                    <li><a href="#">O nás</a></li>
                    <li><a href="#">Psali o nás</a></li>
                    <li><a href="#">Kontakt</a></li>
                </ul>
            </div>
            <div class="footer-block col-lg-2 col-md-2 col-sm-4 col-xs-12">
                <h4 class="title-block"><span>Nakupovaní online</span></h4>
                <ul class="footer-ul list-group">
                    <li><a href="#">Obchodní podmínky</a></li>
                    <li><a href="#">Reklamace</a></li>
                </ul>
            </div>
            <div class="footer-block col-lg-2 col-md-2 col-sm-4 col-xs-12">
                <h4 class="title-block"><span>Důležité informace</span></h4>
                <ul class="footer-ul list-group">
                    <li><a href="#">Kdo nás prodává</a></li>
                    <li><a href="#">Chcete nás prodávat</a></li>
                    <li><a href="#">Jak pečovat o naše výrobky</a></li>
                </ul>
            </div>
            <div class="footer-block col-lg-2 col-md-2 col-sm-4 col-xs-12">
                <h4 class="title-block"><span>Kontaktujte nás</span></h4>
                <ul class="footer-ul list-group">
                    <li><a href="#">Tel.: +420 602 800 818</a></li>
                    <li><a href="#">Email: info@lovelili.eu</a></li>
                </ul>
            </div>
            <div class="footer-block footer-social col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <a target="_blank" href="https://www.facebook.com/lovelili.cz" target="_blank" title="Facebook" class="facebook">Facebook</a>
                <a target="_blank" href="https://www.youtube.com/channel/UC6L8SCNB4KOWCkxNAOCvD9g" title="Youtube" class="youtube">Youtube</a>
                <a target="_blank" href="http://instagram.com/lovelili.cz" title="Instagram" class="instagram">Instagram</a>
                <a target="_blank" href="https://www.pinterest.com/lovelili0552/" target="_blank" title="Pinterest" class="pinterest">Pinterest</a>
            </div>
        </div>
    </section>
</footer>