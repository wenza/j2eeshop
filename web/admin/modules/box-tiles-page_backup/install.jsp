<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Module" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleData" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleDataLang" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = (AdminSessionHolder) session.getAttribute("shX");
    String className = "box-tiles-page";
    Module module = sh.jpa.selectModuleByName(className);
    int TYPE_PAGE = 1;
    int TYPE_BOX_TILE = 5;
    if(module==null){
        module = new Module();
        module.setName(className);
        module = (Module) sh.jpa.merge(module);

        ModuleData tilesPage = new ModuleData(module,TYPE_PAGE+"","");
        tilesPage=(ModuleData) sh.jpa.merge(tilesPage);

        ModuleDataLang tilesPageLang = new ModuleDataLang(tilesPage,sh.shopSettings.defaultLanguage,"WROTE ABOUT US","meta-title","meta-desc","meta-keywords");
        tilesPageLang=(ModuleDataLang)sh.jpa.merge(tilesPageLang);


        /**TILES**/
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




    }

%>