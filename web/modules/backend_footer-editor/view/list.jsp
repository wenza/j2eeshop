<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTreeObj" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTreeState" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%--
Created by IntelliJ IDEA.
User: wenza
Date: 6/3/14
Time: 10:30 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = (AdminSessionHolder) session.getAttribute("shX");
    String className = TestReq.Str(request,"module");
    Module module = sh.jpa.selectModuleByName(className);
    //List<ModuleData> data = sh.getJPA().selectModuleData(module);
    //String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();

%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE TITLE-->
        <h1 class="page-title"> Zápatí stránky
            <small>obsahuje kategorie z CMS jako nadpisy, tyto kategorie obsahují "články" vyberte "články" které chcete aby byly zobrazeny v zápatí</small>
            <%--<a href="?page=entity-form&entity=<%=entityName%>" class="btn sbold green pull-right">
                <i class="fa fa-plus"></i> Uložit
            </a>--%>
        </h1>
        <!-- END PAGE TITLE-->
        <div class="row">
            <div class="col-md-12">

                <input name="shipping-price-limit-6-countries" class="jcvd" value="" style="display:none;"/>
                <div data-counter="0" class="countries-checkbox-tree tree-demo border-default" style="border:none;padding:0px;"> </div>
                <%
                    List<JTreeObj> children = new ArrayList<JTreeObj>();
                    for(CmsCategory cmsC : sh.jpa.selectCmsCategoryByModuleName(module.getName())){
                        CmsCategoryLang cmsCLang = cmsC.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                        List<Cms> cmss = sh.jpa.selectCmsCategoryCmss(cmsC);

                        JTreeState jts = new JTreeState(false,false,true);

                        List<JTreeObj> categoryChildren = new ArrayList<JTreeObj>();

                        for(Cms cms : cmss){
                            CmsLang cmsLang = cms.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                            String content = "<span>"+cmsLang.getName()+"</span>" +
                                    "<span class=\"actions\">" +
                                        "&nbsp;&nbsp;&nbsp;<a class=\"btn btn-circle green btn-xs\" href=\"?page=entity-form&entity=cms-of-category&id="+cms.getId()+"\">Upravit</a>" +
                                        "&nbsp;&nbsp;&nbsp;<a class=\"btn btn-circle red btn-xs\" href=\"\">Odstranit</a>" +
                                    "</span>";
                            JTreeObj child = new JTreeObj(cms.getId(),"no-icon",content,jts,new ArrayList<JTreeObj>());
                            categoryChildren.add(child);
                        }

                        String content = "<span>"+cmsCLang.getName()+"</span>" +
                                "<span class=\"actions\">" +
                                "&nbsp;&nbsp;&nbsp;<a class=\"btn btn-circle green-meadow btn-xs\" href=\"?page=entity-form&entity=cms-of-category&parent-id="+cmsC.getId()+"\">Přidat článek</a>" +
                                "&nbsp;&nbsp;&nbsp;<a class=\"btn btn-circle green btn-xs\" href=\"?page=entity-form&entity=cms-category&id="+cmsC.getId()+"\">Upravit</a>" +
                                "&nbsp;&nbsp;&nbsp;<a class=\"btn btn-circle red btn-xs\" href=\"\">Odstranit</a>" +
                                "</span>";
                        JTreeObj jto = new JTreeObj(-1, "", content, jts, categoryChildren);

                        children.add(jto);
                    }

                    JTreeState jtsX = new JTreeState(false,false,true);
                    JTreeObj jtoX = new JTreeObj(-1, "", "<span>/ &nbsp;&nbsp;&nbsp;</span><span class=\"actions\"><a class=\"btn btn-circle green-meadow btn-xs\" href=\"?page=entity-form&entity=cms-category&module-name="+module.getName()+"\">Přidat Kategorii</a></span>", jtsX, children);

                %>
                <script>
                    multipleJTreeData.push(
                        [
                            <%=sh.objectMapper.writeValueAsString(jtoX)%>

                    ]);
                </script>
            </div>
        </div>
    </div>
    <!-- END CONTENT BODY -->
</div>
