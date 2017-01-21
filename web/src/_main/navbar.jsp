<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/17/17
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="ba-navbar">
    <div class="ba-header">
        <div class="ba-logo-holder">
            <a href="http://www.lovelili.cz/" title="LOVELILI">
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
                        <a href="#">Registrace</a>
                    </li>
                    <li>
                        <a href="#">Přihlášení</a>
                    </li>
                </ul>
                <ul class="header_account_content content-basket">
                    <%
                        for(int i = 0;i<2;i++){
                    %>
                    <li style="width:100%;padding-top:10px;padding-bottom:10px;">
                        <div style="width:36%;float:left;">
                            <a href="#toproduct">
                                <img style="max-width:100%;vertical-align:bottom;" src="https://cdn.victoriabeckham.com/media/catalog/product/cache/1/thumbnail/80x/9df78eab33525d08d6e5fb8d27136e95/p/s/pss17_tp_knt_057_crimson_1.jpg">
                            </a>
                        </div>
                        <div style="width:64%;float:left;">
                            <ul style="list-style: none;padding: 0;margin: 0;">
                                <li style="font-size: 15px;font-size: 1.5rem;margin-top: 0;width:100%;"><a href="#">Diagonal Stitch Short Sleeve Polo Neck</a></li>
                                <li style="margin-top:5px;width:100%;">5 323,-</li>
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
            <li class="active" ><a href="#">SHOP</a></li>
            <li ><a href="#">BLOG</a></li>
            <li ><a href="#">WHO LOVES LILI</a></li>
            <li ><a href="#">LILI HELP</a></li>
            <li ><a href="#">JUST IN</a></li>
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