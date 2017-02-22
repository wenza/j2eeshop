<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 2:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<div class="container-fluid row page-headline">
    <h1>Blog</h1>
    <p>Vítejte ve Blogu LOVELILI.cz, zde se dozvíte všechny novinky ať už o výrobě našich výrobků, tak třeba i tip na dovolenou anebo co dnes v dnešních horkých dnech uvařit k obědu po těžkém dni v práci.</p>
</div>--%>

<div class="rev_slider_wrapper fullscreenbanner-container">
    <!-- the ID here will be used in the JavaScript below to initialize the slider -->
    <div id="rev_slider_2" class="rev_slider fullscreenbanner tp-overflow-hidden" style="display:none;">
        <ul>
            <li data-transition="random" data-delay="9000">
                <img alt="LOVELILI.cz" src="http://www.lovelili.cz/css/images/main1a.jpg" class="rev-slidebg">
            </li>

        </ul>
        <!-- Example Progress Bar, with a height and background color added to its style attribute -->
        <div class="tp-bannertimer"></div>
    </div>
</div>

<hr>
<jsp:include page="../_main/newsletter.jsp"/>


<script>
    $("#rev_slider_2").show().revolution({
        sliderLayout: "fullscreen",
        onHoverStop: "off",
        shuffle: "on",
        minHeight: '600',
        spinner: 'spinner2',
        fullScreenOffsetContainer: ".ba-navbar"
    });
</script>