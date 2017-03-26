<%@ page import="java.util.Properties" %>
<%@ page import="com.worstentrepreneur.utils.PropertyHandler" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = AdminSessionHolder.get(session);
    String moduleName = "mailtemplate-editor";
    long id = TestReq.Long(request,"id");
    String valuesFolderPath = sh.getSettings().getWarPath()+"/modules/backend_mailtemplate-editor/user_data/template-values/"+id+".properties";
    Properties val = PropertyHandler.read(valuesFolderPath);
    String rootFolder = "/modules/backend_mailtemplate-editor/user_data/templates/universal/";//props.getProperty("template-folder");
    String templateFolder = rootFolder+"mailtemplate.html";
    System.out.println(val);
    if(val.getProperty("template-folder")!=null){
        rootFolder=val.getProperty("template-folder");
        templateFolder ="/modules/backend_mailtemplate-editor/user_data/template-values/"+id+".html";//val.getProperty("template-folder");
    }else{
        val=null;
    }
    if(request.getParameter("reformat-to")!=null){
        rootFolder = "/modules/backend_mailtemplate-editor/user_data/templates/"+TestReq.Str(request,"reformat-to")+"/";
        templateFolder = rootFolder+"mailtemplate.html";
    }
    System.out.println("VAL="+val);
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="?page=module&module=<%=moduleName%>&module-entity=page&action=process">
            <input type="text" name="id" value="<%=id%>" style="display:none;"/>
            <div class="page-title" style="margin-top:0;">
                <div class="row">
                    <div class="col-md-6 ta-l">
                        Editace šablony emailu
                    </div>
                    <div class="col-md-6 ta-r">
                        <button type="submit" style="margin-left:20px;" class="btn btn-circle green-jungle btn-outline pull-right active">Uložit</button>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
                <div class="form-body row seo" >
                    <div class="">

                        <div class="">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">
                                        Název šablony
                                    </label>
                                    <div class="col-md-9">
                                        <input type="text" name="name" class="form-control" value="<%=val!=null?val.getProperty("name"):""%>"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">
                                        Popis šablony
                                    </label>
                                    <div class="col-md-9">
                                        <input type="text" name="desc" class="form-control" value="<%=val!=null?val.getProperty("desc"):""%>"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">
                                        Předloha šablony
                                    </label>
                                    <div class="col-md-9">
                                        <%
                                            String templatesFolderPath = sh.getSettings().getWarPath()+"/modules/backend_mailtemplate-editor/user_data/templates/";
                                            File templatesFolder = new File(templatesFolderPath);
                                        %>
                                        <select id="module-mailtemplate-editor-template-path" class="form-control select2" name="template-folder" >
                                            <%
                                            for(File f : templatesFolder.listFiles()){
                                                Properties prop = PropertyHandler.read(f.getAbsolutePath()+"/mailtemplate.properties");
                                                boolean selected = false;
                                                if(templateFolder.contains("/"+f.getName()+"/")){
                                                    selected=true;
                                                }else{
                                                    if(val!=null){
                                                        if(val.getProperty("template-folder").contains("/"+f.getName()+"/")){
                                                            selected=true;
                                                        }
                                                    }
                                                }
                                            %>
                                                <option value="<%=f.getName()%>" <%=selected?"selected":""%>><%=prop.getProperty("name")%></option>
                                            <%
                                            }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <hr style="border-color: #cdcfd2;"/>
                        <%


                            //String template = MailContent.readFile(templatePath, StandardCharsets.UTF_8);


                            Properties main = PropertyHandler.read(sh.shopSettings.getWarPath()+"/"+ rootFolder +"mailtemplate.properties");
                            Properties lang = PropertyHandler.read(sh.shopSettings.getWarPath()+"/"+ rootFolder +"mailtemplate-lang.properties");
                            //Properties val = PropertyHandler.read(sh.shopSettings.getWarPath()+"/modules/backend_mailtemplate-editor/user_data/template-values/template-values-test.properties");
                            for(int i = 1;i<= TestReq.Int(main.getProperty("fields"));i++){
                                String fieldName = TestReq.Str(main.getProperty("field-"+i));
                                String defaultLang = TestReq.Str(lang.getProperty("default-lang"));
                                String name = TestReq.Str(lang.getProperty("field-"+i+"-"+defaultLang));
                                String nameDesc = TestReq.Str(lang.getProperty("field-"+i+"-desc-"+defaultLang));

                                String fieldType = TestReq.Str(main.getProperty("field-"+i+"-type"));
                                System.out.println("ftype="+fieldType);
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
                                                <input type="text" name="<%=fieldName%>" class="form-control mail-iframe-update" value="<%=val!=null?val.getProperty(fieldName):""%>"/>
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
                                                <textarea name="<%=fieldName%>" class="ckeditor-sm-init form-control mail-iframe-update"><%=val!=null?val.getProperty(fieldName):""%></textarea>
                                            </div>
                                            <%

                                        }else if("button".equals(fieldType)){
                                            String fieldName1 =fieldName+"TEXT";
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
                                                    <input type="text" name="<%=fieldName1%>" class="form-control mail-iframe-update" value="<%=val!=null?val.getProperty(fieldName1):""%>"/>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <%
                                                name = TestReq.Str(lang.getProperty("field-"+i+"-link-"+defaultLang));
                                                nameDesc = TestReq.Str(lang.getProperty("field-"+i+"-link-desc-"+defaultLang));
                                                String fieldName2=fieldName+"LINK";
                                                %>
                                                <label class="col-md-3 control-label">
                                                    <%=name%>
                                                    <%if(!"".equals(name)){%><br>
                                                    (<%=nameDesc%>)
                                                    <%}%>
                                                </label>
                                                <div class="col-md-9">
                                                    <input type="text" name="<%=fieldName2%>" class="form-control mail-iframe-update" value="<%=val!=null?val.getProperty(fieldName2):""%>"/>
                                                </div>
                                            </div>
                                            <%

                                        }else if("image-link".equals(fieldType)){
                                            name = TestReq.Str(lang.getProperty("field-"+i+"-image-"+defaultLang));
                                            nameDesc = TestReq.Str(lang.getProperty("field-"+i+"-image-desc-"+defaultLang));
                                            String fieldName1 =fieldName+"IMAGE";
                                            System.out.println("STILL IMAGE!");
                                            %>
                                            <div class="row">
                                                <label class="col-md-3 control-label">
                                                    <%=name%>
                                                    <%if(!"".equals(name)){%><br>
                                                    (<%=nameDesc%>)
                                                    <%}%>
                                                </label>
                                                <div class="col-md-9">
                                                    <div class="img-fileupload cloud mail-iframe-update" data-name="<%=fieldName1%>" data-value="<%=val!=null?val.getProperty(fieldName1):""%>" >
                                                        <input type="hidden" name="min-width" value="600"/>
                                                        <input type="hidden" name="min-height" value="315"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <%
                                                name = TestReq.Str(lang.getProperty("field-"+i+"-link-"+defaultLang));
                                                nameDesc = TestReq.Str(lang.getProperty("field-"+i+"-link-desc-"+defaultLang));
                                                String fieldName2=fieldName+"LINK";
                                                %>

                                                <label class="col-md-3 control-label">
                                                    <%=name%>
                                                    <%if(!"".equals(name)){%><br>
                                                    (<%=nameDesc%>)
                                                    <%}%>
                                                </label>
                                                <div class="col-md-9">
                                                    <input type="text" name="<%=fieldName2%>" class="form-control mail-iframe-update" value="<%=val!=null?val.getProperty(fieldName2):""%>"/>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <%
                                                name = TestReq.Str(lang.getProperty("field-"+i+"-title-"+defaultLang));
                                                nameDesc = TestReq.Str(lang.getProperty("field-"+i+"-title-desc-"+defaultLang));
                                                fieldName+="TITLE";
                                                %>
                                                <label class="col-md-3 control-label">
                                                    <%=name%>
                                                    <%if(!"".equals(name)){%><br>
                                                    (<%=nameDesc%>)
                                                    <%}%>
                                                </label>
                                                <div class="col-md-9">
                                                    <input type="text" name="<%=fieldName%>" class="form-control mail-iframe-update" value="<%=val!=null?val.getProperty(fieldName):""%>"/>
                                                </div>
                                            </div>
                                            <%
                                        }
                                        %>
                                    </div>
                                <%
                            }
                        %>

                            <hr style="border-color: #cdcfd2;"/>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">
                                        Nápověda výplní:
                                    </label>
                                    <div class="col-md-9">
                                        *|YEAR|* Rok ve který bude email odeslán<br>
                                        *|SHOPNAME|* Název eshopu<br>
                                        *|MC:SUBJECT|* Předmět<br>
                                        *|ORDER:ID|* Vyplní ID objednávky<br>
                                        *|ORDER:TABLE|* Vyplní se tabulkou objednávky<br>
                                        *|WEBSITELINK|* Odkaz na web<br>
                                        *|FACEBOOKLINK|* Odkaz na facebook<br>
                                        *|TWITTERLINK|* Odkaz na twitter<br>
                                        *|MAILTOADDRESS|* email na odpovědi<br>
                                        *|MAILTO|* Odkaz na odpovědi<br>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <iframe id="mailtemplate-iframe" src="<%=templateFolder%>?specialvar=<%=new Date().getTime()%>" class="auto-height-iframe mailtpl-editor-iframe" style="width:100%;" height="600px" frameborder="0">

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