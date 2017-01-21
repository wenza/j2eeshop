<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/17/17
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="width:100%;height:100px;"><!--SPACER FOR FULLWIDTH--></div>
<div class="rev_slider_wrapper fullscreenbanner-container">
    <!-- the ID here will be used in the JavaScript below to initialize the slider -->
    <div id="rev_slider_1" class="rev_slider fullscreenbanner tp-overflow-hidden" style="display:none;">
        <ul>
            <!-- MINIMUM SLIDE STRUCTURE -->
            <li data-transition="random" data-delay="9000">
                <img alt="LOVELILI.cz" src="http://www.lovelili.cz/css/images/hp/1.jpg" class="rev-slidebg">
                <!--
                "tp-caption" is the official class declaration for a Slide Layer.
                "tp-resizeme" tells the Slider that the Layer should be responsive.
                "largewhitebg" is one of the pre-built Layer styles available inside: "/assets/css/layers.css"

                 data-responsive_offset="off"
                 data-responsive="off"
                -->
                <div class="tp-caption tp-resizeme"

                     data-basealign="slide"
                     data-x="left" data-hoffset="50"
                     data-y="top" data-voffset="200"
                     data-frames='[{"from":"y:50;opacity:0;","speed":1500,"to":"y:0px;opacity:1;","delay":500,"ease":"Power4.easeOut"}]'
                     style="font-size: 60px; line-height: 60px; font-weight: 700; color: rgba(255, 255, 255, 1.00);">
                    DISCOVERY OF <br>NATURAL WONDERS</div>

                <div class="tp-caption"
                     data-x="left" data-hoffset="50"
                     data-y="top" data-voffset="400"
                     data-width="none"
                     data-height="none"
                     data-basealign="slide"

                     data-frames='[{"from":"y:50;opacity:0;","speed":1500,"to":"y:0px;opacity:1;","delay":1000,"ease":"Power4.easeOut"}]'


                     style=""><button> BUTTON</button></div>

            </li>
            <li data-transition="random" data-delay="9000">
                <img alt="LOVELILI.cz" src="http://www.lovelili.cz/css/images/hp/2.jpg" class="rev-slidebg">
            </li>
            <li data-transition="random" data-delay="9000">
                <img alt="LOVELILI.cz" src="http://www.lovelili.cz/css/images/hp/FotorCreated2.jpg" class="rev-slidebg">
            </li>

        </ul>
        <!-- Example Progress Bar, with a height and background color added to its style attribute -->
        <div class="tp-bannertimer" style="height: 5px; background-color: rgba(255, 255, 255, 0.5);"></div>
    </div>
</div>

<jsp:include page="../_main/newsletter.jsp"/>