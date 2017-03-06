<%@ page import="java.util.Properties" %>
<%@ page import="java.io.File" %>
<%@ page import="com.worstentrepreneur.j2eeshop.ShopSettingsSngl" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleData" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Module" %>
<%@ page import="com.worstentrepreneur.utils.*" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 2/19/17
  Time: 2:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = AdminSessionHolder.get(session);
    String moduleName = TestReq.Str(request,"module");
    Module module = sh.jpa.selectModuleByName(moduleName);
    String lang = TestReq.Str(request,"lang");
    if(lang==null)lang=sh.shopSettings.defaultLanguage.getIsoCode();
    if(module!=null) {
        ModuleData parent = sh.jpa.selectByID(ModuleData.class, TestReq.Int(request, "page-id"));
        if (parent != null) {
            String revslider_slider_content = TestReq.Str(request, "revslider-slider-content").replaceAll("\"data-frames-replaceme\"","'[{\"delay\":0,\"speed\":1300,\"frame\":\"0\",\"from\":\"opacity:0;\",\"to\":\"opacity:1;\",\"ease\":\"Power3.easeInOut\"}]'");
    /*TestReq.printParams(request);
    TestReq.printProcessJSPHeader(request);*/


            ModuleData slide = sh.jpa.selectByID(ModuleData.class, TestReq.Int(request, "id"));
            if (slide == null) slide = new ModuleData();


            slide.setModule(module);
            sh.smdv(slide, "revslide.parent-id", parent.getId() + "");
            slide = (ModuleData) sh.jpa.merge(slide);
            sh.smdv(slide, "revslide.slide-path", "slide-" + slide.getId() + "");
            sh.smdv(slide, "revslide.languages-array", "cs,en");
            sh.smdv(slide, "row-type", ModuleData.TYPE_PAGE_ITEM + "");
            slide = (ModuleData) sh.jpa.merge(slide);

            System.out.println(revslider_slider_content);

            FileHandler.write(sh.shopSettings.getWarPath()+"/modules/revslider-editor/slides/"+sh.mdv(slide,"revslide.slide-path")+"-"+lang+".html",revslider_slider_content);
        }
    }
%>