<%@ page import="java.util.Properties" %>
<%@ page import="com.worstentrepreneur.utils.PropertyHandler" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = AdminSessionHolder.get(session);
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="">
            <div class="portlet-body">
                <div class="form-body row seo" >
                    <div class="">

                        <div class="">
                            <div class="col-md-6">
                        <%
                            //String template = MailContent.readFile(templatePath, StandardCharsets.UTF_8);
                            Properties main = PropertyHandler.read(sh.shopSettings.getWarPath()+"/modules/backend_mailtemplate-editor/user_data/templates/universal/mailtemplate.properties");
                            Properties lang = PropertyHandler.read(sh.shopSettings.getWarPath()+"/modules/backend_mailtemplate-editor/user_data/templates/universal/mailtemplate-lang.properties");
                            Properties val = PropertyHandler.read(sh.shopSettings.getWarPath()+"/modules/backend_mailtemplate-editor/user_data/template-values/template-values-test.properties");
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
                                <iframe src="/modules/backend_mailtemplate-editor/user_data/templates/universal/mailtemplate.html" class="auto-height-iframe mailtpl-editor-iframe" style="width:100%;" height="600px" frameborder="0">

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