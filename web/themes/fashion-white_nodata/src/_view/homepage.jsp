<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Module" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleData" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.utils.FileHandler" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/17/17
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = (CustomerSessionHolder) session.getAttribute("shC");
    Module module = sh.jpa.selectModuleByName("revslider-editor");
    List<ModuleData> moduleData = sh.jpa.selectModuleDataByParentName(module,"homepage",ModuleData.TYPE_PAGE_ITEM);
%>


<div class="rev_slider_wrapper fullscreen-container" style="background-color:transparent;padding:0px;">
    <div id="rev_slider_4_1" class="rev_slider fullscreenbanner" style="display:block;" data-version="5.3.0.2.1">
        <ul>	<!-- SLIDE  -->

            <%
                for(ModuleData md : moduleData) {

                    String path=sh.shopSettings.getWarPath()+"/modules/backend_revslider-editor/user_data/slides/"+sh.mdv(md,"revslide.slide-path")+"-"+sh.shopSettings.defaultLanguage.getIsoCode()+".html";
                    %>
                    <li data-transition="random" data-delay="9000">
                        <%=FileHandler.read(path)%>
                    </li>
                    <%
                }
            %>
        </ul>
        <div class="tp-bannertimer"></div>
    </div>
</div>


<jsp:include page="../_main/newsletter.jsp"/>


<script src="themes/fashion-white/assets/js/_homepage.js"></script>