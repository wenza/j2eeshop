<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/26/17
  Time: 6:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
    <!-- BEGIN SIDEBAR -->
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
            <li class="sidebar-toggler-wrapper hide">
                <div class="sidebar-toggler">
                    <span></span>
                </div>
            </li>
            <!-- END SIDEBAR TOGGLER BUTTON -->
            <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
            <li class="sidebar-search-wrapper">
                <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                <!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
                <!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
                <%--<form class="sidebar-search  sidebar-search-bordered" action="page_general_search_3.html" method="POST">
                    <a href="javascript:;" class="remove">
                        <i class="icon-close"></i>
                    </a>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                            <a href="javascript:;" class="btn submit">
                                <i class="icon-magnifier"></i>
                            </a>
                        </span>
                    </div>
                </form>--%>
                <!-- END RESPONSIVE QUICK SEARCH FORM -->
            </li>
            <li class="nav-item start ">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-home"></i>
                    <span class="title">Přehledy</span>
                </a>
            </li>
            <li class="heading">
                <h3 class="uppercase">Features</h3>
            </li>
            <li class="nav-item  ">
                <a href="?page=entity-list&entity=category" class="nav-link nav-toggle">
                    <i class="icon-diamond"></i>
                    <span class="title">Kategorie</span>
                </a>
            </li>
            <li class="nav-item  ">
                <a href="?page=entity-list&entity=product" class="nav-link nav-toggle">
                    <i class="icon-diamond"></i>
                    <span class="title">Produkty</span>
                </a>
            </li>
            <li class="nav-item  ">
                <a href="?page=entity-list&entity=customer" class="nav-link nav-toggle">
                    <i class="icon-diamond"></i>
                    <span class="title">Klienti</span>
                </a>
            </li>
            <li class="nav-item  ">
                <a href="?page=entity-list&entity=order" class="nav-link nav-toggle">
                    <i class="icon-diamond"></i>
                    <span class="title">Objednávky</span>
                </a>
            </li>
            <li class="nav-item  ">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-diamond"></i>
                    <span class="title">Moduly</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item  ">
                        <a href="?page=entity-list&entity=shipping" class="nav-link ">
                            <span class="title">Dopravci a platby</span>
                        </a>
                    </li>
                    <li class="nav-item  ">
                        <a href="?" class="nav-link ">
                            <span class="title">Slider revolution</span>
                        </a>
                    </li>
                    <li class="nav-item  ">
                        <a href="?" class="nav-link ">
                            <span class="title">Double menu</span>
                        </a>
                    </li>
                    <li class="nav-item  ">
                        <a href="?" class="nav-link ">
                            <span class="title">Newsletter</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item  ">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-diamond"></i>
                    <span class="title">CMS</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item  ">
                        <a href="?page=entity-list&entity=cms-of-category&parent-id=1" class="nav-link ">
                            <span class="title">Zápatí</span>
                        </a>
                    </li>
                    <li class="nav-item  ">
                        <a href="?page=entity-list&entity=cms-category" class="nav-link ">
                            <span class="title">CMS Kategorie</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="heading">
                <h3 class="uppercase">BLBOSTI</h3>
            </li>

            <%--<li class="nav-item  ">
                <a href="?page=" class="nav-link nav-toggle">
                    <i class="icon-diamond"></i>
                    <span class="title">Skupiny klientů</span>
                </a>
            </li>--%>
            <li class="nav-item  ">
                <a href="?page=entity-list&entity=manufacturer" class="nav-link nav-toggle">
                    <i class="icon-diamond"></i>
                    <span class="title">Výrobci</span>
                </a>
            </li>
            <li class="nav-item  ">
                <a href="?page=entity-list&entity=tax" class="nav-link nav-toggle">
                    <i class="icon-diamond"></i>
                    <span class="title">Daňové sazby</span>
                </a>
            </li>
            <li class="nav-item  ">
                <a href="?page=entity-list&entity=country" class="nav-link nav-toggle">
                    <i class="icon-diamond"></i>
                    <span class="title">Země</span>
                </a>
            </li>
        </ul>
        <!-- END SIDEBAR MENU -->
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>
<!-- END SIDEBAR -->