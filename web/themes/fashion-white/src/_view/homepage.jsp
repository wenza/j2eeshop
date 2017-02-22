<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/17/17
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<div class="rev_slider_wrapper fullscreenbanner-container">
    <div id="rev_slider_4_1" class="rev_slider fullscreenbanner tp-overflow-hidden" style="display:none;">
        <ul>
            <li data-transition="random" data-delay="9000">
                <img alt="LOVELILI.cz" src="http://www.lovelili.cz/css/images/hp/1.jpg" class="rev-slidebg">
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
        <div class="tp-bannertimer"></div>
    </div>--%>
</div>


<div class="rev_slider_wrapper fullscreen-container" style="background-color:transparent;padding:0px;">
    <div id="rev_slider_4_1" class="rev_slider fullscreenbanner" style="display:block;" data-version="5.3.0.2.1">
        <ul>	<!-- SLIDE  -->
            <li data-transition="random" data-delay="9000">
                <img src="http://www.lovelili.cz/css/images/hp/1.jpg"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
                <div class="tp-caption "
                     data-x="['left','left','left','left']" data-hoffset="['0','200','400','400']"
                     data-y="['top','top','top','top']" data-voffset="['76','76','76','0']"
                     data-width="none"
                     data-height="none"
                     data-whitespace="nowrap"

                     data-responsive_offset="on"

                     data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                     data-textAlign="['inherit','inherit','inherit','inherit']"

                     style="z-index: 5;font-size: 60px;line-height:60px;">Caption Text1 </div>
                <a href="#" class="tp-caption "
                   data-sel="added-element-2"
                   type="button"
                   data-x="['left','left','left','left']" data-hoffset="['203', '264' ,'528' ,'153']"
                   data-y="['top','top','top','top']" data-voffset="['181' ,'5', '0' ,'150']"

                   data-width="none"
                   data-height="none"
                   data-whitespace="nowrap"

                   data-responsive_offset="on"

                   data-frames='[{"delay":0,"speed":1300,"frame":"0","from":"opacity:0;","to":"opacity:1;","ease":"Power3.easeInOut"}]'
                   style="font-size: 60px;color:white;line-height:60px;"
                >TEXT Tlačítka aa</a>
            </li>
            <%--<li data-transition="random" data-delay="9000">
                <img src="http://www.lovelili.cz/css/images/hp/2.jpg"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
                <div class="tp-caption "
                     id="slide-6-layer-1"
                     data-x="['left','left','left','left']" data-hoffset="['0','200','400','400']"
                     data-y="['top','top','top','top']" data-voffset="['76','76','76','0']"
                     data-width="none"
                     data-height="none"
                     data-whitespace="nowrap"

                     data-type="text"
                     data-responsive_offset="on"

                     data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                     data-textAlign="['inherit','inherit','inherit','inherit']"

                     style="z-index: 5;">Caption Text1 </div>
                <a href="#" class="tp-caption tp-resizeme"
                   data-sel="added-element-2"
                   type="button"
                   data-x="['left','left','left','left']" data-hoffset="['203', '264' ,'528' ,'153']"
                   data-y="['top','top','top','top']" data-voffset="['181' ,'5', '13' ,'80']"


                   data-width="none"
                   data-height="none"
                   data-whitespace="nowrap"

                   data-type="text"
                   data-responsive_offset="on"

                   data-frames='[{"delay":0,"speed":1300,"frame":"0","from":"opacity:0;","to":"opacity:1;","ease":"Power3.easeInOut"}]'

                >TEXT Tlačítka aa</a>
            </li>--%>
        </ul>
        <div class="tp-bannertimer"></div>
    </div>
</div>


<jsp:include page="../_main/newsletter.jsp"/>


<script src="themes/fashion-white/assets/js/_homepage.js"></script>