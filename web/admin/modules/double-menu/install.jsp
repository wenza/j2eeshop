<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Module" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleData" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = (AdminSessionHolder) session.getAttribute("shX");
    String className = "double-menu";
    Module module = sh.jpa.selectModuleByName(className);
    if(module==null){
        module = new Module();
        module.setName(className);
        //module.setShortData("levels=2");
        module = (Module) sh.jpa.merge(module);

        ModuleData md = new ModuleData();
        //md.setColumn1("1");//level
        md.setColumn1(sh.shopSettings.defaultLanguage.getIsoCode());
        md.setColumn2("1");//order in menu
        md.setColumn3("?page=shop");//link
        md.setColumn4("SHOP");//link text
        md.setModule(module);



        ModuleData md2 = new ModuleData();
        //md2.setColumn1("1");//level
        md2.setColumn1(sh.shopSettings.defaultLanguage.getIsoCode());
        md2.setColumn2("5");//order in menu
        md2.setColumn3("?page=blog");//link
        md2.setColumn4("BLOG");//link text
        md2.setModule(module);


        ModuleData md3 = new ModuleData();
        //md3.setColumn1("1");//level
        md3.setColumn1(sh.shopSettings.defaultLanguage.getIsoCode());
        md3.setColumn2("10");//order in menu
        md3.setColumn3("?page=help");//link
        md3.setColumn4("HELP");//link text
        md3.setModule(module);


        sh.jpa.merge(md);
        sh.jpa.merge(md2);
        sh.jpa.merge(md3);


    }

%>