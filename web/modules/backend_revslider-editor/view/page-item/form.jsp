<%@ page import="java.util.Properties" %>
<%@ page import="java.io.File" %>
<%@ page import="com.worstentrepreneur.j2eeshop.ShopSettingsSngl" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleData" %>
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
    ModuleData md = sh.jpa.selectByID(ModuleData.class,request);//id
    ModuleData modulePage = sh.jpa.selectByID(ModuleData.class,TestReq.Int(request,"page-id"));//id
    String lang = TestReq.Str(request,"lang");
    if(modulePage!=null){
        String path = "";
        if(md!=null)path=sh.shopSettings.getWarPath()+"/modules/backend_revslider-editor/user_data/slides/"+sh.mdv(md,"revslide.slide-path")+"-"+lang+".html";
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">


            <div class="portlet-body">
                <div class="form-body row" >
                    <div class="col-md-6">
                        <div class="tabbable-line" style="min-height:300px;padding-bottom:50px;">
                            <ul class="nav nav-tabs ">
                                <li class="active">
                                    <a href="#tab_15_1" data-toggle="tab"> Pozadí celého slidu</a>
                                </li>
                                <li>
                                    <a href="#tab_15_2" data-toggle="tab"> Animace celého slidu </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_15_1">
                                    <div class="col-md-3 col-sm-3 col-xs-3">
                                        <ul class="nav nav-tabs tabs-left">
                                            <li class="active">
                                                <a href="#tab_6_1" data-toggle="tab"> Obrázek </a>
                                            </li>
                                            <li>
                                                <a href="#tab_6_2" data-toggle="tab"> Barva </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-9">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_6_1">
                                                <div class="img-fileupload cloud" data-name="image-url" data-value="" ></div>
                                            </div>
                                            <div class="tab-pane" id="tab_6_2">
                                                <input style="width:200px;" type="text" name="background-color" class="colorpicker-rgba form-control" value="rgba(0,0,0,1)" data-color-format="rgba" />
                                                <div style="width:30px;height:30px;background-color:rgba(0,0,0,0)"></div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <div class="tab-pane" id="tab_15_2">
                                    <%--<p> Howdy, I'm in Section 2. </p>
                                    <p> Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
                                        consequat. Ut wisi enim ad minim veniam, quis nostrud exerci tation. </p>
                                    <p>
                                        <a class="btn green" href="ui_tabs_accordions_navs.html#tab_15_2" target="_blank"> Activate this tab via URL </a>
                                    </p>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <a class="revslider-save-btn btn green">Uložit</a>

                        <form id="revslider-slide-save-form" class="form-horizontal" method="post" role="form" action="?page=module&module=<%=moduleName%>&module-entity=page-item&action=process&page-id=<%=modulePage.getId()%>&lang=<%=lang%>">
                            <input name="id" value="<%=md!=null?md.getId():0%>" style="display:none;"/>
                            <div class="hidden-btn">
                                <div id="revslider-stored-file"><%=FileHandler.read(path)%></div>
                                <textarea id="revslider-slider-content" name="revslider-slider-content"></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-12">
                        <div class="container-editor">
                            <jsp:include page="frg/_rulers.jsp"/>
                            <div id="top-toolbar-wrapper">
                                <jsp:include page="frg/_top_toolbar_add_layer.jsp"/>
                                <span id="rs-edit-layers-on-btn">
                                    <div class="rs-slide-device_selector rs-slide-ds-desktop selected" data-res="desktop" data-w="1240"></div>
                                    <div class="rs-slide-device_selector rs-slide-ds-notebook" data-res="notebook" data-w="1024"></div>
                                    <div class="rs-slide-device_selector rs-slide-ds-tablet" data-res="tablet" data-w="778"></div>
                                    <div class="rs-slide-device_selector rs-slide-ds-mobile" data-res="mobile" data-w="480"></div>
                                </span>
                                <jsp:include page="frg/_top_toolbar_quick_layer.jsp"/>
                            </div>
                            <div id="wenza_revedit" style="overflow: hidden; margin: 0px auto; max-width: 100%;">
                                <div class="slider-bg" bg="/modules/backend_revslider-editor/assets/img/transparent.png"></div>
                                <div class="layers-span layers-desktop active" style="width:1240px;height:868px;"></div>
                                <div class="layers-span layers-notebook" style="width:1024px;height:768px;"></div>
                                <div class="layers-span layers-tablet" style="width:778px;height:960px;"></div>
                                <div class="layers-span layers-mobile" style="width:480px;height:720px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</div>
<%}%>