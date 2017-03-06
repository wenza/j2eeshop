<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = (AdminSessionHolder) session.getAttribute("shX");
    String className = "blog-editor";
    Module module = sh.jpa.selectModuleByName(className);
    if(module==null){
        module = new Module();
        module.setName(className);
        module = (Module) sh.jpa.merge(module);

        CmsCategory cmsCategory = new CmsCategory();
        cmsCategory.setModule(module.getName());
        cmsCategory.setActive(true);
        cmsCategory.setDateAdd(new Date());
        cmsCategory.setDateUpd(new Date());
        cmsCategory.setPosition(1);
        cmsCategory.setImageURL("");
        cmsCategory=(CmsCategory) sh.jpa.merge(cmsCategory);

        CmsCategoryLang cmsCLang = new CmsCategoryLang();
        cmsCLang.setCmsCategory(cmsCategory);
        cmsCLang.setLang(sh.shopSettings.defaultLanguage);
        cmsCLang.setMetaDescription("");
        cmsCLang.setMetaKeywords("");
        cmsCLang.setMetaTitle("BLOG");
        cmsCLang.setName("BLOG");
        cmsCLang = (CmsCategoryLang) sh.jpa.merge(cmsCLang);

        Cms cms = new Cms();
        cms.setCategory(cmsCategory);
        cms.setActive(true);
        cms.setDateAdd(new Date());
        cms.setDateUpd(new Date());
        cms.setImageURL("");
        cms.setPosition(1);
        cms = (Cms)sh.jpa.merge(cms);

        CmsLang cmsLang = new CmsLang();
        cmsLang.setContent("");
        cmsLang.setDescription("");
        cmsLang.setName("Test Blog record");
        cmsLang.setLang(sh.shopSettings.defaultLanguage);
        cmsLang.setMetaDescription("");
        cmsLang.setMetaTitle("");
        cmsLang.setCms(cms);
        cmsLang.setMetaKeywords("");
        cmsLang = (CmsLang) sh.jpa.merge(cmsLang);

/**TILES**//*

        //TileWithURL
        ModuleData mdTile = new ModuleData(module,TYPE_BOX_TILE+"",tilesPage.getId()+"",5+"","http://www.latextemplates.com/wp-content/uploads/2012/08/article_1.png","https://www.google.cz/?gfe_rd=cr&ei=g2imWMObLszR8gey-qegBg#q=article+link");
        mdTile=(ModuleData) sh.jpa.merge(mdTile);

        ModuleDataLang mdTileLang = new ModuleDataLang(mdTile,sh.shopSettings.defaultLanguage,"ELPHA JEWELS pro nas vytvorila...");
        mdTileLang=(ModuleDataLang)sh.jpa.merge(mdTileLang);

        //TILE WITHOUT URL
        ModuleData mdTile2 = new ModuleData(module,TYPE_BOX_TILE+"",tilesPage.getId()+"",5+"","http://www.latextemplates.com/wp-content/uploads/2012/08/article_1.png","");
        mdTile2=(ModuleData) sh.jpa.merge(mdTile2);

        ModuleDataLang mdTileLang2 = new ModuleDataLang(mdTile2,sh.shopSettings.defaultLanguage,"BOMTOM");
        mdTileLang2=(ModuleDataLang)sh.jpa.merge(mdTileLang2);
*/




    }

%>