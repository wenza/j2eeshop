<%@ page import="java.util.Properties" %>
<%@ page import="com.worstentrepreneur.utils.PropertyHandler" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="java.io.File" %>
<%@ page import="com.worstentrepreneur.j2eeshop.ShopSettingsSngl" %>
<%@ page import="com.worstentrepreneur.utils.MailContent" %>
<%@ page import="java.nio.charset.StandardCharsets" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 2/19/17
  Time: 2:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = AdminSessionHolder.get(session);
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="">
            <%--<input type="hidden" name="id" value="<%=entity!=null?entity.getId():0%>"/>
            <input type="hidden" name="column-1" value="<%=entity!=null?entity.getColumn1():entityType%>"/>--%>

            <%--<div class="page-title" style="margin-top:0;">
                <div class="row">
                    <div class="col-md-6 ta-l">
                        <%
                            for(Language lang : sh.shopSettings.languages){
                                ModuleDataLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
                        %>
                        <div class="col-md-12 form-group lang-group-<%=lang.getIsoCode()%> lang-group <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode()) ?"shown":""%>">
                            <label class="col-md-3 control-label" style="text-align:left;margin:0;padding:0;">Název(<%=lang.getIsoCode()%>)</label>
                            <div class="col-md-9">
                                <input type="text" name="lang-column-1-<%=lang.getIsoCode()%>" class="form-control"  value="<%=entLang!=null?entLang.getColumn1():""%>">
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <div class="col-md-6 ta-r">
                        <button type="submit" style="margin-left:20px;" class="btn btn-circle green-jungle btn-outline pull-right active">Uložit</button>
                        <span class="pull-right font-grey-salsa" style="margin-left:15px;">|</span>
                        <%
                            for(Language lang : sh.shopSettings.languages){
                        %>
                        <a style="margin-left:10px;" class="btn btn-circle green btn-outline lang-group-activator pull-right <%=sh.shopSettings.defaultLanguage.getId()==lang.getId()?"active":""%>" data-iso-code="<%=lang.getIsoCode()%>"> <%=lang.getName()%> (<%=lang.getIsoCode()%>) </a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>--%>

            <div class="portlet-body">
                <div class="form-body row seo" >
                    <div class="">

                        <div class="">
                            <div class="col-md-6">
                        <%
                            //String templatePath = sh.shopSettings.getWarPath()+"/admin/modules/mailtemplate-editor/templates/universal/mailtemplate.html";
                            //String template = MailContent.readFile(templatePath, StandardCharsets.UTF_8);
                            Properties main = PropertyHandler.read(sh.shopSettings.getWarPath()+"/admin/modules/mailtemplate-editor/templates/universal/mailtemplate.properties");
                            Properties lang = PropertyHandler.read(sh.shopSettings.getWarPath()+"/admin/modules/mailtemplate-editor/templates/universal/mailtemplate-lang.properties");
                            Properties val = PropertyHandler.read(sh.shopSettings.getWarPath()+"/admin/modules/mailtemplate-editor/template-values/template-values-test.properties");
                            for(int i = 1;i<= TestReq.Int(main.getProperty("fields"));i++){
                                String fieldName = TestReq.Str(main.getProperty("field-"+i));
                                String defaultLang = TestReq.Str(lang.getProperty("default-lang"));
                                String name = TestReq.Str(lang.getProperty("field-"+i+"-"+defaultLang));
                                String nameDesc = TestReq.Str(lang.getProperty("field-"+i+"-desc-"+defaultLang));

                                String fieldType = TestReq.Str(main.getProperty("field-"+i+"-type"));
                                //text
                                //ckeditor-sm
                                //button
                                //image-link
                                %>

                                        <div class="form-group">
                                            <%
                                            if("text".equals(fieldType)){
                                                %>
                                                <label class="col-md-3 control-label">
                                                    <%=name%>
                                                    <%if(!"".equals(nameDesc)){%><br>
                                                        (<%=nameDesc%>)
                                                    <%}%>
                                                </label>
                                                <div class="col-md-9">
                                                    <input type="text" name="<%=fieldName%>" class="form-control mail-iframe-update" value=""/>
                                                </div>
                                                <%
                                            }else if("ckeditor-sm".equals(fieldType)){
                                                %>
                                                <label class="col-md-3 control-label">
                                                    <%=name%>
                                                    <%if(!"".equals(nameDesc)){%><br>
                                                    (<%=nameDesc%>)
                                                    <%}%>
                                                </label>
                                                <div class="col-md-9">
                                                    <textarea name="<%=fieldName%>" class="ckeditor-sm-init form-control mail-iframe-update">Pooopis</textarea>
                                                </div>
                                                <%

                                            }else if("button".equals(fieldType)){
                                                %>
                                                <div class="row">
                                                    <%
                                                        name = TestReq.Str(lang.getProperty("field-"+i+"-text-"+defaultLang));
                                                        nameDesc = TestReq.Str(lang.getProperty("field-"+i+"-text-desc-"+defaultLang));
                                                    %>
                                                    <label class="col-md-3 control-label">
                                                        <%=name%>
                                                        <%if(!"".equals(name)){%><br>
                                                        (<%=nameDesc%>)
                                                        <%}%>
                                                    </label>
                                                    <div class="col-md-9">
                                                        <input type="text" name="<%=fieldName%>TEXT" class="form-control mail-iframe-update" value=""/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <%
                                                    name = TestReq.Str(lang.getProperty("field-"+i+"-link-"+defaultLang));
                                                    nameDesc = TestReq.Str(lang.getProperty("field-"+i+"-link-desc-"+defaultLang));
                                                    %>
                                                    <label class="col-md-3 control-label">
                                                        <%=name%>
                                                        <%if(!"".equals(name)){%><br>
                                                        (<%=nameDesc%>)
                                                        <%}%>
                                                    </label>
                                                    <div class="col-md-9">
                                                        <input type="text" name="<%=fieldName%>LINK" class="form-control mail-iframe-update" value=""/>
                                                    </div>
                                                </div>
                                                <%

                                            }else if("image-link".equals(fieldType)){
                                                name = TestReq.Str(lang.getProperty("field-"+i+"-image-"+defaultLang));
                                                nameDesc = TestReq.Str(lang.getProperty("field-"+i+"-image-desc-"+defaultLang));
                                                %>
                                                <div class="row">
                                                    <label class="col-md-3 control-label">
                                                        <%=name%>
                                                        <%if(!"".equals(name)){%><br>
                                                        (<%=nameDesc%>)
                                                        <%}%>
                                                    </label>
                                                    <div class="col-md-9">
                                                        <div class="img-fileupload cloud mail-iframe-update" data-name="<%=fieldName%>IMAGE" data-value="" >
                                                            <input type="hidden" name="min-width" value="600"/>
                                                            <input type="hidden" name="min-height" value="315"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <%
                                                    name = TestReq.Str(lang.getProperty("field-"+i+"-link-"+defaultLang));
                                                    nameDesc = TestReq.Str(lang.getProperty("field-"+i+"-link-desc-"+defaultLang));
                                                    %>

                                                    <label class="col-md-3 control-label">
                                                        <%=name%>
                                                        <%if(!"".equals(name)){%><br>
                                                        (<%=nameDesc%>)
                                                        <%}%>
                                                    </label>
                                                    <div class="col-md-9">
                                                        <input type="text" name="<%=fieldName%>LINK" class="form-control mail-iframe-update" value=""/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <%
                                                    name = TestReq.Str(lang.getProperty("field-"+i+"-title-"+defaultLang));
                                                    nameDesc = TestReq.Str(lang.getProperty("field-"+i+"-title-desc-"+defaultLang));
                                                    %>
                                                    <label class="col-md-3 control-label">
                                                        <%=name%>
                                                        <%if(!"".equals(name)){%><br>
                                                        (<%=nameDesc%>)
                                                        <%}%>
                                                    </label>
                                                    <div class="col-md-9">
                                                        <input type="text" name="<%=fieldName%>TITLE" class="form-control mail-iframe-update" value=""/>
                                                    </div>
                                                </div>
                                                <%
                                            }
                                            %>
                                        </div>
                                <%
                            }
                        %>
                        </div>

                            <div class="col-md-6">
                                <iframe src="modules/mailtemplate-editor/templates/universal/mailtemplate.html" class="auto-height-iframe mailtpl-editor-iframe" style="width:100%;" height="600px" frameborder="0">

                                </iframe>
                            </div>
                            <script>

                            </script>
                        </div>
                    </div>
                </div>

            </div>
        </form>
    </div>
</div>