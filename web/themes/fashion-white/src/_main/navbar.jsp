<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleData" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Module" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Category" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CategoryLang" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/17/17
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = (CustomerSessionHolder) session.getAttribute("shC");
    String pageX = TestReq.Str(request,"page");
%>
<nav class="ba-navbar">
    <div class="ba-header">
        <div class="ba-logo-holder">
            <a href="?" title="LOVELILI">
                <img src="http://www.lovelili.cz/css/images/logo.png" width="100%"/>
            </a>
        </div>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <%--<a class="navbar-brand" href="#">Project name</a>--%>
        </div>
        <div class="ba-search-container">
            <form method="post" action="?page=search">
                <div class="header-search-holder" >
                    <div class="input-group">
                        <input type="text" name="q" class="form-control input-search" placeholder="Search for..."/>
                        <span class="input-group-btn">
                                <button class="btn btn-search" name="submit" type="submit" style="margin-top:-16px;"> &gt; </button>
                            </span>
                    </div><!-- /input-group -->
                </div>
            </form>
            <a href="#" class="open-search">Vyhledávání</a>
        </div>
        <div class="ba-account-container">
            <ul class="header-account-panel">
                <li class="header-account-panel-hover panel-account">
                    <a href="#" class="header-account-menu-link">
                        <span>Můj účet <%--(<%=sh.customer!=null?sh.customer.getEmail():"Nepřihlášen/a"%>)--%></span>
                    </a>
                    <div class="header-account-menu panel-account" >
                        <ul class="header_account_content content-register-login">
                            <%
                            if(sh.customer!=null){
                                %>
                            <li>
                                <a href="?page=account">Detail účtu</a>
                            </li>
                            <li>
                                <a href="?logout">Odhlášení</a>
                            </li>
                            <%
                            }else{
                            %>
                                <li>
                                    <a data-toggle="modal" data-target="#modal-1">Registrace</a>
                                </li>
                                <li>
                                    <a data-toggle="modal" data-target="#modal-2" href="#">Přihlášení</a>
                                </li>
                            <%
                            }
                            %>
                        </ul>
                    </div>
                </li>
                <li class="header-account-panel-hover panel-basket">
                    <a href="#" class="header-account-menu-link">
                        <span>
                            <span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span>
                            <span class="content-basket-count">0</span>
                        </span>
                    </a>
                    <div class="header-account-menu panel-basket" >
                        <ul class="header_account_content content-basket">
                            <li style="width:100%;text-align:center;">Košík je prázdný</li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <!-- /.nav-collapse -->
    </div><!-- /.container -->
    <div id="navbar" class="navbar-collapse collapse ba-subnavbar">
        <ul class="nav navbar-nav ba-subnavbar-ul">
            <%


                Module module = sh.jpa.selectModuleByName("double-menu");
                List<ModuleData> data = sh.getJPA().selectModuleDataLang(module,sh.getLang().getIsoCode());
                if(!"shop".equals(pageX) && !"category".equals(pageX)){
                    for(ModuleData md : data) {
                        boolean active = false;
                        ModuleData langData = sh.jpa.selectModuleDataLangCoresponding(module, sh.getLang().getIsoCode(), md.getColumn2());
                        System.out.println(sh.reqURI(request)+"=?="+md.getColumn3());
                        if(sh.reqURI(request).contains(md.getColumn3()) || md.getColumn3().contains(sh.reqURI(request))){
                            active = true;
                            if("".equals(pageX))active=false;
                        }
                        %><li <%=active?"class=\"active\"":""%>><a href="<%=md.getColumn3()%>"><%=langData.getColumn4()%></a></li><%
                    }
                }else{
                    Category root = sh.jpa.selectRootCategory();
                    for(Category cat : sh.jpa.selectCategoryChildren(root)){
                        CategoryLang cl = cat.getLang(sh.getLang(),sh.jpa);
                        boolean active = sh.reqURI(request).contains("page=category&id="+cat.getId())?true:false;
                        %>
                        <li <%=active?"class=\"active\"":""%>><a href="?page=category&id=<%=cat.getId()%>"><%=cl.getName()%></a></li>
                        <%
                    }
                }

            %>
        </ul>
    </div>
</nav><!-- /.navbar -->