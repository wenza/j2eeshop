<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 2:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid row page-headline">
    <h1>Blog</h1>
    <p>Vítejte ve Blogu LOVELILI.cz, zde se dozvíte všechny novinky ať už o výrobě našich výrobků, tak třeba i tip na dovolenou anebo co dnes v dnešních horkých dnech uvařit k obědu po těžkém dni v práci.</p>
</div>
<div class="container">
    <div class="row page-content">
        <%
            for(int i = 0;i<1;i++){
        %>
        <div class="col-md-12">
            <h2 class="ccc-c-pink">Elpha Jewels pro LOVELILI</h2>
            <a class="mgg" href="?page=blog&id=1" style="display:block;width:100%;height:355px;background-image:url('http://lovelili.cz/img/960x500/1227/0');background-size: cover;background-position: center center;">
                <%--<img src="" title="" alt="Elpha Jewels pro LOVELILI">--%>
                <div class="ccc-c-pink" style="position:absolute;width:70px;height:70px;background:white;margin-top: 10px;
    right: 25px;padding: 10px;font-size: 20px;line-height: 25px;font-weight:900;">30.11.<br><span style="font-weight:300;font-size: 14px;" class="year">2016</span></div>
            </a>
            <div class="spacer-sm"></div>
            <p>
                ELPHA jewels je magická značka. Vytváří krásné šperky z přírodních materiálů. Z léčivých polodrahokamů, hřejivého dřeva a vzácných kovů. Jsou láskyplně poskládány do harmonických náramků, prstenů a náhrdelníků či mal. Mají dokreslit osobnost svých nositelů a nositelek, doprovázet je na jejich…
            </p>
            <div class="spacer-sm"></div>
            <a href="?page=blog&id=1" class="btn btn-pink">Více</a>
            <div class="spacer-sm"></div>
            <hr>
            <div class="spacer-sm"></div>
        </div>
        <%
            }
        %>
        <div class="col-md-12">

            <div>
                <h2 class="ccc-c-pink" style="display:inline-block;">Elpha Jewels pro LOVELILI</h2>
                <span>30.11.2016</span>
            </div>
            <div class="spacer-sm"></div>
            <p>
                ELPHA jewels je magická značka. Vytváří krásné šperky z přírodních materiálů. Z léčivých polodrahokamů, hřejivého dřeva a vzácných kovů. Jsou láskyplně poskládány do harmonických náramků, prstenů a náhrdelníků či mal. Mají dokreslit osobnost svých nositelů a nositelek, doprovázet je na jejich…
            </p>
            <div class="spacer-sm"></div>
            <a href="?page=blog&id=1" class="btn btn-pink">Více</a>
            <div class="spacer-sm"></div>
            <hr>
            <div class="spacer-sm"></div>
        </div>
        <%
            for(int i = 0;i<1;i++){
        %>
        <div class="col-md-12">
            <h2 class="ccc-c-pink">Elpha Jewels pro LOVELILI</h2>
            <a class="mgg" href="?page=blog&id=1" style="display:block;width:100%;height:355px;background-image:url('http://lovelili.cz/img/960x500/1227/0');background-size: cover;background-position: center center;">
                <%--<img src="" title="" alt="Elpha Jewels pro LOVELILI">--%>
                <div class="ccc-c-pink" style="position:absolute;width:70px;height:70px;background:white;margin-top: 10px;
    right: 25px;padding: 10px;font-size: 20px;line-height: 25px;font-weight:900;">30.11.<br><span style="font-weight:300;font-size: 14px;" class="year">2016</span></div>
            </a>
            <div class="spacer-sm"></div>
            <p>
                ELPHA jewels je magická značka. Vytváří krásné šperky z přírodních materiálů. Z léčivých polodrahokamů, hřejivého dřeva a vzácných kovů. Jsou láskyplně poskládány do harmonických náramků, prstenů a náhrdelníků či mal. Mají dokreslit osobnost svých nositelů a nositelek, doprovázet je na jejich…
            </p>
            <div class="spacer-sm"></div>
            <a href="?page=blog&id=1" class="btn btn-pink">Více</a>
            <div class="spacer-sm"></div>
            <hr>
            <div class="spacer-sm"></div>
        </div>
        <%
            }
        %>
    </div>

</div>
<hr>
<jsp:include page="../_main/newsletter.jsp"/>