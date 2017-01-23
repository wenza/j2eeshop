<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/17/17
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
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
            <div class="header-search-holder" >
                <div class="input-group">
                    <input type="text" class="form-control input-search" placeholder="Search for..."/>
                    <span class="input-group-btn">
                            <button class="btn" type="button" style="margin-top:-16px;"> &gt; </button>
                        </span>
                </div><!-- /input-group -->
            </div>
            <a href="#" class="open-search">Vyhledávání</a>
        </div>
        <div class="ba-account-container">
            <a href="#" class="header-account-menu-link" data-cls="header-account-menu" data-subcls="content-register-login">
                <span>Můj účet</span>
            </a>
            <a href="#" class="header-account-menu-link" data-cls="header-account-menu" data-subcls="content-basket">
                    <span>
                        <span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span>
                        <span>4</span>
                    </span>
            </a>
            <div class="header-account-menu" >
                <ul class="header_account_content content-register-login">
                    <li>
                        <a data-toggle="modal" data-target="#modal-1">Registrace</a>
                    </li>
                    <li>
                        <a data-toggle="modal" data-target="#modal-2" href="#">Přihlášení</a>
                    </li>
                </ul>
                <ul class="header_account_content content-basket">
                    <%
                        for(int i = 0;i<2;i++){
                    %>
                    <li style="width:100%;padding-top:10px;padding-bottom:10px;">
                        <div style="width:36%;float:left;">
                            <a href="#toproduct">
                                <img style="max-width:100%;vertical-align:bottom;" src="http://www.lovelili.cz/img/x/661/0-crazy-race.jpg">
                            </a>
                        </div>
                        <div style="width:64%;float:left;">
                            <ul style="list-style: none;padding: 0;margin: 0;">
                                <li style="font-size: 15px;font-size: 1.5rem;margin-top: 0;width:100%;"><a href="#">CRAZY RACE</a></li>
                                <li style="margin-top:5px;width:100%;">3 900,-</li>
                                <li style="margin-top:5px;width:100%;">Velikost 1</li>
                            </ul>
                        </div>
                    </li>
                    <%
                        }
                    %>
                    <li style="width:100%;border-top:1px solid black;height:1px;"></li>
                    <li style="width:100%;text-align:center;line-height: 34px;">Celkem 5 Produktů</li>
                    <li style="width:100%;border-top:1px solid black;height:1px;"></li>
                    <li style="width:100%;text-align:right;line-height: 34px;"><span style="float:left;">Mezisoučet</span> 2 832,-</li>
                    <li style="width:100%;border-top:1px solid black;height:1px;"></li>
                    <li style="width:100%;text-align:center;line-height: 40px;margin-bottom:-10px;">Do košíku</li>
                </ul>
            </div>
        </div>
        <!-- /.nav-collapse -->
    </div><!-- /.container -->
    <div id="navbar" class="navbar-collapse collapse ba-subnavbar">
        <ul class="nav navbar-nav ba-subnavbar-ul">
            <%
                List<String> shopNavigatorShownPages = Arrays.asList(new String[]{"shop","category","item"});
                if(shopNavigatorShownPages.contains(pageX)){
                    long category = TestReq.Long(request,"id");
                    //TODO when in product (?page=item&id=1) I get category and through parents I get from one of below and mark it as "active"
                    %>
                    <li <%=1==category?"class=\"active\"":""%>><a href="?page=category&id=1">BAGS</a></li>
                    <li <%=2==category?"class=\"active\"":""%>><a href="?page=category&id=2">WALLETS</a></li>
                    <li <%=3==category?"class=\"active\"":""%>><a href="?page=category&id=3">ACCESSORIES</a></li>
                    <li <%=4==category?"class=\"active\"":""%>><a href="?page=category&id=4">FASHION</a></li>
                    <li <%=5==category?"class=\"active\"":""%>><a href="?page=category&id=5">GIFT</a></li>
                    <%
                }else{
                    %>
                    <li <%="shop".equals(pageX)?"class=\"active\"":""%>><a href="?page=shop">SHOP</a></li>
                    <li <%="blog".equals(pageX)?"class=\"active\"":""%>><a href="?page=blog" <%=pageX%>>BLOG</a></li>
                    <li <%="who-loves-lili".equals(pageX)?"class=\"active\"":""%>><a href="?page=who-loves-lili">WHO LOVES LILI</a></li>
                    <li <%="lili-help".equals(pageX)?"class=\"active\"":""%>><a href="?page=lili-help">LILI HELP</a></li>
                    <li <%="just-in".equals(pageX)?"class=\"active\"":""%>><a href="?page=just-in">JUST IN</a></li>
                    <%
                }
            %>

            <%--<li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li role="separator" class="divider"></li>
                    <li class="dropdown-header">Nav header</li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">One more separated link</a></li>
                </ul>
            </li>--%>
        </ul>
    </div>
</nav><!-- /.navbar -->