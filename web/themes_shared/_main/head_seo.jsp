<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/17/17
  Time: 8:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<title>LOVELILI</title>
<meta content="DESC" name="description">
<meta content="KW1, KW2" name="keywords">
<meta content="TITLE" property="og:title">
<meta content="DESC" property="og:description">
<meta content="SITE_NAME" property="og:site_name">
<meta content="http://lovelili.com/" property="og:url">
<meta content="http://lovelelili.com/logo2.png" property="og:image">
<meta content="website" property="og:type"><!-- Latest compiled and minified CSS -->--%>
<%
    String pageX = TestReq.Str(request,"page");
    int idX = TestReq.Int(request,"id");//pageX);
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
    System.out.println("SHA = "+sh);
    System.out.println("SHA = "+sh.shopSettings);
    request.setAttribute("seo-site-name",sh.shopSettings.seoSiteName);
    request.setAttribute("seo-url",request.getRequestURL().toString().replaceAll("index\\.jsp","")+"?"+request.getQueryString());
    request.setAttribute("seo-title",sh.shopSettings.seoDefaultTitle);
    request.setAttribute("seo-description",sh.shopSettings.seoDefaultDescription);
    request.setAttribute("seo-keywords",sh.shopSettings.seoDefaultKeywords);
    request.setAttribute("seo-img",sh.shopSettings.seoSiteImageUrl);
    System.out.println("SHO");
    if("".equals(pageX)){

    }else if("shop".equals(pageX)){

    }else if("category".equals(pageX)){
        Category ent = sh.jpa.selectByID(Category.class,idX);
        CategoryLang entl = ent.getLang(sh.getLang(),sh.jpa);
        if("".equals(TestReq.Str(entl.getMetaTitle())))entl.setMetaTitle(entl.getName());
        if(!"".equals(TestReq.Str(entl.getMetaTitle())))request.setAttribute("seo-title",entl.getMetaTitle());
        if(!"".equals(TestReq.Str(entl.getMetaDescription())))request.setAttribute("seo-description",entl.getMetaDescription());
        if(!"".equals(TestReq.Str(entl.getMetaKeywords())))request.setAttribute("seo-keywords",entl.getMetaKeywords());
        if(!"".equals(TestReq.Str(ent.getImageURL())))request.setAttribute("seo-img",sh.shopSettings.shopUrl+ent.getImageURL());

        %><%

    }else if("product".equals(pageX)){
        Product ent = sh.jpa.selectByID(Product.class,idX);
        ProductLang entl = ent.getLang(sh.getLang(),sh.jpa);
        ProductImage pi = null;
        for(ProductImage pis: sh.jpa.selectProductImages(ent)){
            if(pis.isCover())pi = pis;
        }

        if("".equals(TestReq.Str(entl.getMetaTitle())))entl.setMetaTitle(entl.getName());
        if(!"".equals(TestReq.Str(entl.getMetaTitle())))request.setAttribute("seo-title",entl.getMetaTitle());
        if(!"".equals(TestReq.Str(entl.getMetaDescription())))request.setAttribute("seo-description",entl.getMetaDescription());
        if(!"".equals(TestReq.Str(entl.getMetaKeywords())))request.setAttribute("seo-keywords",entl.getMetaKeywords());
        if(pi!=null)request.setAttribute("seo-img",sh.shopSettings.shopUrl+pi.getImageURL());

    }else if("blog".equals(pageX)){
        //CmsCategory ent = sh.jpa.selectByID(CmsCategory.class,idX);
        List<CmsCategory> cmsCategories = sh.jpa.selectCmsCategoryByModuleName("blog-editor");
        for(CmsCategory ent : cmsCategories) {
            CmsCategoryLang entl = ent.getLang(sh.getLang(), sh.jpa);

            if ("".equals(TestReq.Str(entl.getMetaTitle()))) entl.setMetaTitle(entl.getName());
            if (!"".equals(TestReq.Str(entl.getMetaTitle()))) request.setAttribute("seo-title", entl.getMetaTitle());
            if (!"".equals(TestReq.Str(entl.getMetaDescription())))
                request.setAttribute("seo-description", entl.getMetaDescription());
            if (!"".equals(TestReq.Str(entl.getMetaKeywords())))
                request.setAttribute("seo-keywords", entl.getMetaKeywords());
            if (!"".equals(TestReq.Str(ent.getImageURL())))
                request.setAttribute("seo-img", sh.shopSettings.shopUrl + ent.getImageURL());
        }

    }else if("cms".equals(pageX)){
        Cms ent = sh.jpa.selectByID(Cms.class,idX);
        CmsLang entl = ent.getLang(sh.getLang(),sh.jpa);

        if("".equals(TestReq.Str(entl.getMetaTitle())))entl.setMetaTitle(entl.getName());
        if(!"".equals(TestReq.Str(entl.getMetaTitle())))request.setAttribute("seo-title",entl.getMetaTitle());
        if(!"".equals(TestReq.Str(entl.getMetaDescription())))request.setAttribute("seo-description",entl.getMetaDescription());
        if(!"".equals(TestReq.Str(entl.getMetaKeywords())))request.setAttribute("seo-keywords",entl.getMetaKeywords());
        if(!"".equals(TestReq.Str(ent.getImageURL())))request.setAttribute("seo-img",sh.shopSettings.shopUrl+ent.getImageURL());

    }else if("box-tiles-page".equals(pageX)){
        ModuleData md = sh.jpa.selectByID(ModuleData.class,idX);
        ModuleDataLang mdl = md.getLang(sh.getLang(),sh.jpa);

        if("".equals(TestReq.Str(mdl.getColumn2())))mdl.setColumn2(mdl.getColumn1());
        /*request.setAttribute("seo-title",mdl.getColumn2());
        request.setAttribute("seo-description",mdl.getColumn3());
        request.setAttribute("seo-keywords",mdl.getColumn4());
        request.setAttribute("seo-img",sh.shopSettings.shopUrl+md.getColumn2());*/


        if(!"".equals(TestReq.Str(mdl.getColumn2())))request.setAttribute("seo-title",mdl.getColumn2());
        if(!"".equals(TestReq.Str(mdl.getColumn3())))request.setAttribute("seo-description",mdl.getColumn3());
        if(!"".equals(TestReq.Str(mdl.getColumn4())))request.setAttribute("seo-keywords",mdl.getColumn4());
        if(!"".equals(TestReq.Str(md.getColumn2())))request.setAttribute("seo-img",sh.shopSettings.shopUrl+md.getColumn2());



    }else{

    }
    /*
    http://localhost:8080/?page=shop
    http://localhost:8080/?page=category&id=2
    http://localhost:8080/?page=product&id=7
    http://localhost:8080/?page=blog --cms kategorie
    http://localhost:8080/?page=blog&id=8 -- cms detail
    http://localhost:8080/?page=cms&id=10
    http://localhost:8080/?page=cms&id=1
    http://localhost:8080/?page=box-tiles-page&id=3
    http://localhost:8080/?page=box-tiles-page&id=6
    http://localhost:8080/?page=checkout
    */
%>
<jsp:include page="frg/head_seo_frg.jsp"/>