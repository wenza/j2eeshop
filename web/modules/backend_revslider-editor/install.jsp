<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Module" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleData" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleDataLang" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.utils.FileHandler" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = (AdminSessionHolder) session.getAttribute("shX");
    String className = TestReq.Str(request,"module");
    Module module = sh.jpa.selectModuleByName(className);
    if(module==null){
        module = new Module();
        module.setName(className);
        module = (Module) sh.jpa.merge(module);
        System.out.println(className);

        //Slider
        ModuleData md = new ModuleData();
        md.setModule(module);
        sh.smdv(md,"row-type",ModuleData.TYPE_PAGE+"");
        sh.smdv(md,"revslider.name","Slider 1");
        md=(ModuleData) sh.jpa.merge(md);
        //sh.mdv

        ModuleData slide = new ModuleData();
        slide.setModule(module);
        sh.smdv(slide,"revslide.parent-id",md.getId()+"");
        slide=(ModuleData) sh.jpa.merge(slide);
        sh.smdv(slide,"revslide.slide-path","slide-"+slide.getId()+"");
        sh.smdv(slide,"revslide.languages-array","cs,en");
        sh.smdv(slide,"row-type",ModuleData.TYPE_PAGE_ITEM+"");
        slide=(ModuleData) sh.jpa.merge(slide);

        String slideContent = "<img src=\"/modules/backend_revslider-editor/assets/img/transparent.png\" style=\"background-color:rgba(0, 0, 0, 0)\" alt=\"\" data-bgposition=\"center center\" data-bgfit=\"cover\" data-bgrepeat=\"no-repeat\" class=\"rev-slidebg\" data-no-retina=\"\">\n" +
                "<div class=\"rev-layer text added-element-1 ui-draggable ui-draggable-handle tp-caption\" data-sel=\"added-element-1\" type=\"text\" data-hoffset=\"['158', '0', ,0', '0']\" data-voffset=\"['132', '0', '0', '0']\" data-width=\"none\" data-height=\"none\" data-whitespace=\"nowrap\" data-responsive_offset=\"on\" data-frames='[{\"delay\":0,\"speed\":1300,\"frame\":\"0\",\"from\":\"opacity:0;\",\"to\":\"opacity:1;\",\"ease\":\"Power3.easeInOut\"}]'\n" +
                "    TEXT\n" +
                "</div>\n";

        FileHandler.write(sh.shopSettings.getWarPath()+"/modules/backend_revslider-editor/user_data/slides/"+sh.mdv(slide,"revslide.slide-path")+"-cs.html",slideContent);
        FileHandler.write(sh.shopSettings.getWarPath()+"/modules/backend_revslider-editor/user_data/slides/"+sh.mdv(slide,"revslide.slide-path")+"-en.html",slideContent);




    }

%>