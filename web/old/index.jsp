<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/15/17
  Time: 8:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>LOVELILI.cz - fashion - LoveLili.cz</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,minimum-scale=1 ">
    <meta name="Description" content="LOVELILI.cz - accessories">
    <meta name="author" content="E-shop, SEO by MediaEnergy s.r.o. (www.mediaenergy.cz), web">
    <meta name="robots" content="index,follow">
    <meta name="googlebot" content="snippet,archive">
    <link rel="shortcut icon" href="/favicon.ico" type="image/vnd.microsoft.icon">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
    <link href="/css/style.css" rel="stylesheet" type="text/css">
    <link href="/css/jquery.fancybox.css" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>


    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <link  rel="stylesheet" href="/js/jquery-ui.css" type="text/css">
    <script type="text/javascript" src="/js/netteForms.js"></script>
    <script type="text/javascript" src="/components/nette.ajax.js/nette.ajax.js"></script>
    <script type="text/javascript" src="/components/nette.ajax.js/extensions/spinner.ajax.js"></script>
    <script type='text/javascript' src='/js/jquery.fancybox.pack.js'></script>
    <script type='text/javascript' src='/js/jquery.cookie.js'></script>
    <script type="text/javascript" src="/js/app/lovelili.js"></script>
    <script type='text/javascript' src='/js/front.js'></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body id="homepage" class="homepage onpage">
<div class="container-fluid" id="header">
    <div id="searchbox" class="hidden-xs">
        <span id="searchtitle">Vyhledávání</span>
        <form action="/" method="post" id="frm-searchForm">
            <label for="frm-searchForm-search">Vyhledávání na webu:</label>
            <input type="text" name="search" class="search" data-autocomplete-url="/front.homepage/search" id="frm-searchForm-search" required data-nette-rules='[{"op":":filled","msg":"Položka Vyhledat je povinná."}]'>
            <button type="submit"><strong>Hledej</strong></button>
            <div><input type="hidden" name="do" value="searchForm-submit"><!--[if IE]><input type=IEbug disabled style="display:none"><![endif]--></div>
        </form>

    </div><!-- END #searchbox  -->
    <div id="snippet-signInForm-"><div id="kos-box" class="hidden-xs">
        <div id="choose0">
            <span id="myAcc"><a href="#">Můj účet</a></span>
            <span id="snippet-cart-small">
    Prázdný košík
</span>
        </div>
        <div id="choose1">
            <a href="" onclick="$('#loginPopup').show();$('#kos-box').hide();return false;">Přihlášení</a> |
            <a href="/registrace">Registrace</a>
        </div>
    </div>
        <div id="loginPopup" class="hidden-xs">
            <form action="/" method="post" id="frm-signInForm-form">

                <ul id="logTrueForm" >
                    <li>
                        <label for="frm-signInForm-form-username">Login</label>
                        <input type="text" name="username" id="frm-signInForm-form-username" required data-nette-rules='[{"op":":filled","msg":"Zadejte login."}]' class="form-control">
                    </li>
                    <li>
                        <label for="frm-signInForm-form-password">Heslo</label>
                        <input type="password" name="password" id="frm-signInForm-form-password" required data-nette-rules='[{"op":":filled","msg":"Zadejte heslo."}]' class="form-control">
                    </li>
                    <li class="remember">
                        <label for="frm-signInForm-form-remember"><input type="checkbox" name="remember" id="frm-signInForm-form-remember">Zapamatovat</label>

                    </li>
                    <li>
                        <span><input type="submit" name="ok" class="btn btn-default btn-sm" id="submit" value="Přihlásit"></span>
                    </li>
                </ul>
                <p id="choose2">
                    <a href="/registrace">Registrace</a> |
                    <a href="/zapomenute-heslo" title="Neznáte heslo? Klikněte zde.">Zapomenuté heslo</a>
                </p>
                <a href="" onclick="$('#loginPopup').hide();$('#kos-box').show();return false;" id="close">Zavřít</a>
                <div><input type="hidden" name="do" value="signInForm-form-submit"></div>
            </form>

        </div>
        <script>
            $('#loginPopup').hide();
        </script></div>      <div class="container">
    <div class="row">
        <div class="col-xs-12">
            <a href="/?g" class="img-responsive" id="logo"><img src="/css/images/logo.png" class="img-responsive" title="" alt=""></a>
        </div>
    </div>
    <div class="row hidden-xs">
        <div class="col-xs-12">
            <ul class="nav nav-justified">
                <li class="pink it2"><a href="/shop" title="">Shop</a></li>
                <li class="it1 blog"><a href="/blog" title="Blog">Blog</a></li>
                <li class="it3 who-loves-lili"><a title="Who loves Lili" href="/who-loves-lili">Who loves Lili</a></li>
                <li class="it4 lili-help"><a title="Lili Help" href="/lili-help">Lili Help</a></li>
                <li class="it3 just-in"><a title="Just in" href="/justin">Just in</a></li>
            </ul>
        </div>
    </div>
</div>
</div>
<div id="snippet--flashes"></div>  <div class="container-fluid">
    <div class="row">
        <div id="bg">

            <script type="text/javascript">
                $(window).load(function() {
                    var i = 0;
                    var j = 0;
                    var images = ['/css/images/hp/1.jpg','/css/images/hp/2.jpg','/css/images/hp/FotorCreated2.jpg'];
                    var layer1 = $('#firstlayer');
                    var layer2 = $('#secondlayer');
                    //Initial Background image setup
                    layer1.css('background-image', 'url(/css/images/hp/2.jpg)');
                    layer2.css('background-image', 'url(/css/images/hp/FotorCreated2.jpg)');
                    //Change image at regular intervals
                    setInterval(function(){
                        if (j == 0){
                            layer2.fadeOut(1500);
                            layer1.css('background-image', 'url(' + images [i++] +')');
                            layer1.fadeIn(1500);
                            j++;
                        }
                        else {
                            layer1.fadeOut(1500);
                            layer2.css('background-image', 'url(' + images [i++] +')');
                            layer2.fadeIn(1500);
                            j = 0;
                        }
                        if(i == images.length) i = 0;

                    }, 6000);
                });
            </script>
            <style>
                #slidecontent{ position: relative; width: 100%;   background-size: 100% auto!important; display: block; overflow: hidden;  }
                #firstlayer, #secondlayer{ position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-repeat: no-repeat; background-size: 100% auto!important; }

                .slogbox { position: absolute; top: 0px; left: 50px; z-index: 99; }


            </style>
            <!-- div id="top_slider" class="top_slider" style="z-index:2; position: relative;">
               <a href="#" onclick="mute(); return false;" id="muteBtn"></a>
               <video autoplay="" loop="" poster="/css/images/hp.jpg" id="bgvid" style="background-color: #fff;">
                 <source src="http://www.lovelili.cz/css/video/lovelili-white.mp4" type="video/mp4" style="height: 100%;">
               </video>
             </div-->

            <div id="slidecontent">
                <img src="/css/images/hp/blank.png" class="img-responsive">

                <div id="firstlayer"></div>
                <div id="secondlayer"></div>







            </div>



        </div>
        <script>
            /*function resizeVideo() {
             $("#bg").height($("#bg video").height());
             }
             $(document).ready(function () {
             resizeVideo();
             $(window).bind('resize', resizeVideo);
             });
             setInterval(function(){ resizeVideo(); }, 1500);
             */
        </script>
        <script>
            /*
             function mute(){
             if(
             document.getElementById("bgvid").muted) {
             document.getElementById("bgvid").muted=!document.getElementById("bgvid").muted;
             document.getElementById("muteBtn").style.opacity = 1;
             }else{
             document.getElementById("bgvid").muted=!document.getElementById("bgvid").muted;
             document.getElementById("muteBtn").style.opacity = 0.5
             }
             }  */
        </script>
    </div>
</div>    <div class="container-fluid" id="footer1">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <p id="breadcrumb"></p>
            </div>
            <div class="col-md-7">
                <div id="newsbox">

                    <table class="table">
                        <tr><td>                <label class="hidden-xs">Odebírejte náš newsletter</label>
                            <label class="visible-xs">Newsletter</label></td>
                            <td>
                                <input type="text" class="form-control" placeholder="Zde zadejte Váš e-mail" id="newsletter-input">
                            </td>
                            <td>                <a href="http://www.lovelili.cz/formular.php" class="btn fancybox.ajax" id="newsletter-submit">Odeslat</a></td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid" id="footer2">
    <div class="container">
        <div class="row fivecol">
            <div class="col-sm-12 col-md-5">
                <div id="footer-one">
                    <h2 class="footer-h2">O lovelili</h2>
                    <ul class="footer-ul list-unstyled">
                        <li><a href="/o-nas">O nás</a></li>
                        <li><a href="/psali-o-nas">Psali o nás</a></li>
                        <li><a href="/wallpaper">Wallpaper</a></li>
                        <li><a href="/kontakt">Kontakt</a></li>

                    </ul>
                </div>
            </div>
            <div class="col-sm-12 col-md-5">
                <div id="footer-two">
                    <h2 class="footer-h2">Nakupovaní online</h2>
                    <ul class="footer-ul list-unstyled">

                        <li><a href="/obchodni-podminky">Obchodní podmínky</a></li>
                        <li><a href="/reklamace">Reklamace</a></li>

                    </ul>
                </div>
            </div>
            <div class="col-sm-12 col-md-5">
                <div id="footer-three">
                    <h2 class="footer-h2">Důležité informace</h2>
                    <ul class="footer-ul list-unstyled">
                        <li><a href="kdo-nas-prodava">Kdo nás prodává</a></li>
                        <li><a href="/chcete-nas-prodavat">Chcete nás prodávat</a></li>
                        <li><a href="/jak-pecovat-o-nase-vyrobky">Jak pečovat o naše výrobky</a></li>

                    </ul>
                </div>
            </div>
            <div class="col-sm-12 col-md-5">
                <div id="footer-four">
                    <h2 class="footer-h2">Kontaktujte nás</h2>
                    <p>Tel.: +420 602 800 818<br>
                        Email: <a href="mailto:info@lovelili.eu">info@lovelili.eu</a></p>
                </div>
            </div>
            <div class="col-xs-12 col-md-5 relative">
                <p id="footer-social">
                    <a href="https://www.facebook.com/lovelili.cz" target="_blank" title="Facebook" class="facebook">Facebook</a>
                    <a href="https://www.youtube.com/channel/UC6L8SCNB4KOWCkxNAOCvD9g" title="Youtube" class="youtube">Youtube</a>
                    <a href="http://instagram.com/lovelili.cz" title="Instagram" class="instagram">Instagram</a>
                    <a href="https://www.pinterest.com/lovelili0552/" target="_blank" title="Pinterest" class="pinterest">Pinterest</a>
                </p>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid" id="footer3">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p id="firmCopyright1">© Copyright 2017 lovelili.cz</p>
            </div>
            <div class="col-md-6 relative text-right">
                <p id="copyright" class="text-right"><a href="http://www.mediaenergy.cz/tvorba-www-stranek">Tvorba WWW stránek</a> &amp;
                    <a href="http://www.mediaenergy.cz/e-shopy/">E-shopy</a> by MEDIA ENERGY s.r.o. <a id="medialogo" class="hidden-xs" href="http://www.mediaenergy.cz" title="Značka kvalitního a SEO eshopu - MEDIA ENERGY s.r.o."><strong>Značka kvality - MEDIA ENERGY s.r.o.</strong></a>
                </p>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-default navbar-fixed-top visible-xs" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a href="#" onclick="return false;" data-toggle="collapse" data-target="#navbar1" class="icon pull-left"><span class="glyphicon glyphicon-search"></span></a>
            <a href="/kosik" class="icon pull-left"><span class="glyphicon glyphicon-shopping-cart"></span></a>
            <a href="#" onclick="return false;" data-toggle="collapse" data-target="#navbar3" class="icon pull-right"><span class="glyphicon glyphicon-align-justify"></span></a>
            <a href="#" onclick="return false;" data-toggle="collapse" data-target="#navbar2" class="icon pull-right"><span class="glyphicon glyphicon-user"></span></a>
        </div>
        <div id="navbar1" class="navbar-collapse collapse">
            <form action="/" method="post" id="frm-searchForm">
                <input type="text" name="search" class="form-control" data-autocomplete-url="/front.homepage/search" id="frm-searchForm-search" required data-nette-rules='[{"op":":filled","msg":"Položka Vyhledat je povinná."}]' placeholder="Zadejte výraz...">
                <button type="submit" class="hidden"><strong>Hledej</strong></button>
                <div><input type="hidden" name="do" value="searchForm-submit"><!--[if IE]><input type=IEbug disabled style="display:none"><![endif]--></div>
            </form>

        </div>

        <div id="navbar2" class="navbar-collapse collapse">
            <p class="basketRow"></p>
            <div class="row">
                <div class="col-xs-12">
                    <span>Přihlásit se</span>
                </div>
                <form action="/?do=signInForm-form-submit" method="post" id="frm-signInForm-form">
                    <div class="col-xs-12">
                        <input type="text" name="username" id="frm-signInForm-form-username" required data-nette-rules='[{"op":":filled","msg":"Zadejte login."}]' class="form-control">
                    </div>
                    <div class="col-xs-12">
                        <input type="password" name="password" id="frm-signInForm-form-password" required data-nette-rules='[{"op":":filled","msg":"Zadejte heslo."}]' class="form-control">
                    </div>
                    <div class="col-xs-12">
                        <input type="submit" name="ok" class="btn btn-default btn-sm" id="submit" value="Přihlásit">
                    </div>
                </form>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/registrace">Registrace</a></li>
            </ul>
        </div>

        <div id="navbar3" class="navbar-collapse collapse">
            <p class="basketRow"></p>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/">Home</a></li>
                <li class="dropdown">
                    <a href="/shop" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Shop <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="kabelky">
                            <a href="/kabelky" title="BAGS">
                                BAGS
                            </a>
                        </li>
                        <li class="penezenky">
                            <a href="/penezenky" title="WALLETS">
                                WALLETS
                            </a>
                        </li>
                        <li class="boho">
                            <a href="/boho" title="ACCESSORIES">
                                ACCESSORIES
                            </a>
                        </li>
                        <li class="coming-soon">
                            <a href="/coming-soon" title="FASHION">
                                FASHION
                            </a>
                        </li>
                        <li class="gift">
                            <a href="/gift" title="GIFT">
                                GIFT
                            </a>
                        </li>
                    </ul>
                </li>
                <li><a href="/blog">Blog</a></li>
                <li><a href="/who-loves-lili">Who loves Lili</a></li>
                <li><a href="/lili-help">Lili help</a></li>
                <li><a href="/just-in">Just in</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="hidden">
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-56307610-1']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
</div>
<div id="welcome">
    <div id="inner">
        <img src="/css/images/logo.png" class="img-responsive" id="logogo" title="" alt="">
    </div>
</div>
<script>
    $( document ).ready(function() {
        $('#welcome').delay(3000).fadeOut(1000);
        $('#welcome #logogo').delay(2000).fadeOut(1000);
        function resizeWelcome() {
            $("#welcome #inner").height($("#welcome").height());
            $("#welcome #inner").width($("#welcome").width());
        }
        $(document).ready(function () {
            resizeWelcome();
            $(window).bind('resize', resizeWelcome);
        });
        setInterval(function(){ resizeWelcome(); }, 500);
    });
</script>

<script>
    $( document ).ready(function() {
        if ($('#logTrueForm .error' ).length > 0){
            $('#loginPopup').show();
            $('#kos-box').hide();
        }
    });
</script>
<script type="text/javascript">
    /* <![CDATA[ */
    var google_conversion_id = 962820117;
    var google_custom_params = window.google_tag_params;
    var google_remarketing_only = true;
    /* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script>
<noscript>
    <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/962820117/?value=0&amp;guid=ON&amp;script=0">
    </div>
</noscript>
</body>
</html>
