<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/17/17
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>

<link crossorigin="anonymous" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" rel="stylesheet"><!-- Optional theme -->


<!--
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script><!-- Latest compiled and minified JavaScript -->

<script crossorigin="anonymous" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- REVOLUTION MODULE -->
<link rel="stylesheet" type="text/css" href="modules/frontend-slider_revolution_responsive/assets/css/settings.css">
<link rel="stylesheet" type="text/css" href="modules/frontend-slider_revolution_responsive/assets/css/layers.css">
<link rel="stylesheet" type="text/css" href="modules/frontend-slider_revolution_responsive/assets/css/navigation.css">
<script type="text/javascript" src="modules/frontend-slider_revolution_responsive/assets/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="modules/frontend-slider_revolution_responsive/assets/js/jquery.themepunch.revolution.min.js"></script>

<!-- SLIDER REVOLUTION 5.0 EXTENSIONS  (Load Extensions only on Local File Systems !  The following part can be removed on Server for On Demand Loading) -->
<script type="text/javascript" src="modules/frontend-slider_revolution_responsive/assets/js/extensions/revolution.extension.actions.min.js"></script>
<script type="text/javascript" src="modules/frontend-slider_revolution_responsive/assets/js/extensions/revolution.extension.carousel.min.js"></script>
<script type="text/javascript" src="modules/frontend-slider_revolution_responsive/assets/js/extensions/revolution.extension.kenburn.min.js"></script>
<script type="text/javascript" src="modules/frontend-slider_revolution_responsive/assets/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="modules/frontend-slider_revolution_responsive/assets/js/extensions/revolution.extension.migration.min.js"></script>
<script type="text/javascript" src="modules/frontend-slider_revolution_responsive/assets/js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="modules/frontend-slider_revolution_responsive/assets/js/extensions/revolution.extension.parallax.min.js"></script>
<script type="text/javascript" src="modules/frontend-slider_revolution_responsive/assets/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="modules/frontend-slider_revolution_responsive/assets/js/extensions/revolution.extension.video.min.js"></script>

<!-- SLICK -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
<link rel="stylesheet" type="text/css" href="/modules/frontend-slick-slider/assets/additional.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>


<!-- img_link_box -->
<link rel="stylesheet" type="text/css" href="modules/image_link_box/assets/css/module.css"/>
<link rel="stylesheet" type="text/css" href="modules/category-item-box/assets/css/module.css"/>

<!-- FORM WIZARD LAYOUT -->
<link rel="stylesheet" type="text/css" href="modules/checkout-wizard/assets/css/module.css"/>


<link href="themes/fashion-white/assets/css/app.css" rel="stylesheet"/>
<script>
    //SHOULD BE USED AS MODULE
    function loadDynamicHeight(){
        var pageHeight = $(window).height();
        var pageWidth = $(window).width();
        var navbarHeight = $('.ba-navbar').height();
        var subtractHeight = navbarHeight;
        $('.exclude-dynamic-height').each(function() {
            subtractHeight+=$(this).height();
        });
        var isMobile = pageWidth>=992?false:true;
        if(!isMobile) {
            var resultHeight = pageHeight - subtractHeight;//780//529px
            if(resultHeight<520)resultHeight=520;
            $('.dynamic-height').css('min-height', resultHeight + 'px');
            $('.dynamic-center').each(function() {
                var content = $(this).find('.dynamic-center-content');
                if(content.height()!=null) {
                    var contentHeight = content.height();
                    var halfHeight = contentHeight / 2;
                    var halfContainerHeight = resultHeight / 2;
                    var resultMarginTop = halfContainerHeight - halfHeight;
                    $(content).css('padding-top', resultMarginTop + 'px');
                    /*$('.dynamic-height').css('height', resultHeight + 'px');*/
                }
            });
        }
        $('.dynamic-height').css('opacity','1');
        $('.dynamic-center').css('padding','0 50px');

    }
</script>