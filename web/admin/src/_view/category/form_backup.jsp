<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.ShopSettings_removeme" %>
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
    Class className = Category.class;
    Category entity = (Category)sh.getJPA().selectByID(className,request);
    String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE TITLE-->
        <h1 class="page-title"> Kategorie
            <small></small>
            <a href="?page=entity-view&entity=<%=entityName%>" class="btn sbold green pull-right bg-green-jungle bg-font-green-jungle">
                <i class="fa fa-check"></i> Uložit
            </a>
        </h1>
<!--
Název
Zobrazeno(SWITCH)
Nadřazená kategorie
Popis(WISIWYG)
Cover image(Recommended dimensions (for the default theme): 1425px x 285px)
Thumbnail(Recommended dimensions (for the default theme): 125px x 125px)
Meta titulek(70)
Meta popis(160)
Meta klíčová slova - TAGy
Do kategorie vidí tyto skupiny zákazníků:


As writing name it goes to meta headline
As writing description, it goes also to meta desc.
FILEUPLOADS
-->

        <div class="tabbable-custom ">
            <ul class="nav nav-tabs ">
                <%

                for(String langISO : ShopSettings_removeme.DEFAULT_FRONTENT_LANGUAGES_ISO){
                    %>
                    <li class="<%=langISO.equals(ShopSettings_removeme.DEFAULT_FRONTEND_LANG_ISO)?"active":""%>">
                        <a href="#tab-lang-<%=langISO%>" data-toggle="tab"> <%=langISO%> </a>
                    </li>
                    <%
                }
                %>
            </ul>
            <div class="tab-content">
                <form class="form-horizontal" role="form">
                    <%
                    for(String langISO : ShopSettings_removeme.DEFAULT_FRONTENT_LANGUAGES_ISO){
                        %>
                        <div class="tab-pane <%=langISO.equals(ShopSettings_removeme.DEFAULT_FRONTEND_LANG_ISO)?"active":""%>" id="tab-lang-<%=langISO%>">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Název</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" placeholder="">
                                                <%--<span class="help-block"> <code>25 znaků</code> </span>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Aktivní</label>
                                            <div class="col-md-9">
                                                <input  type="checkbox" class="make-switch" checked data-on-color="success" data-off-color="danger" data-on-text="<i class='fa fa-check'></i>" data-off-text="<i class='fa fa-remove'></i>">
                                                <%--<input type="text" class="form-control maxlength_alloptions" maxlength="4" placeholder="Enter text">--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Nadřazená kategorie</label>
                                            <div class="col-md-9">
                                                <input name="parent-id" value="" style="display:none;"/>
                                                <div id="categories-tree" class="tree-demo border-default" style="border:1px solid black;padding:5px;"> </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Popis</label>
                                            <div class="col-md-9">
                                                <textarea class="ckeditor-sm-init form-control" name="editor1" rows="1"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Meta titulek</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control maxlength_alloptions" maxlength="70" placeholder="">
                                                <%--<span class="help-block"> <code>25 znaků</code> </span>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Meta popis</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control maxlength_alloptions" maxlength="160" placeholder="">
                                                <%--<span class="help-block"> <code>25 znaků</code> </span>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Meta klíčová slova/tagy</label>
                                            <div class="col-md-9">
                                                <input type="text" value="" class="tagsinput-def">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">
                                                Obrázek použitý v SEO<br>(facebook,twitter...)<br>minimum 600 x 315px</label>
                                            <div class="col-md-9">
                                                <div class="img-fileupload cloud" data-name="img-url-1" data-value="none">
                                                    <input type="hidden" name="min-width" value="600"/>
                                                    <input type="hidden" name="min-height" value="315"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Náhled kategorie</label>
                                            <div class="col-md-9">
                                                <div class="img-fileupload cloud" data-name="img-url-2" data-value="none">
                                                    <input type="hidden" name="min-width" value="540"/>
                                                    <input type="hidden" name="min-height" value="960"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                        <%
                    }
                    %>
                </form>
            </div>
        </div>
    </div>
</div>

<script>

    var categoriesTableData = [{
        "db_id":1,
        "icon": "fa fa-warning icon-state-danger",
        "text": "1",
        "children": [
            {
                "db_id":2,
                "icon": "fa fa-warning icon-state-danger",
                "text": "1.1",
                "state": {
                    "selected": false,
                    "disabled": true
                },
                "children":[
                    {
                        "db_id":3,
                        "icon": "fa fa-warning icon-state-danger",
                        "text": "1.1.1",
                        "state": {
                            "selected": true
                        }
                    }
                ]
            }]
    }];
</script>