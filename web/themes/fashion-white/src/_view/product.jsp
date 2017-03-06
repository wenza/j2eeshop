<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Product" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ProductLang" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ProductImage" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = (CustomerSessionHolder) session.getAttribute("shC");
    Product product = sh.jpa.selectByID(Product.class,request);
    ProductLang plang = product.getLang(sh.getLang(),sh.jpa);
    List<ProductImage> productImages = sh.jpa.selectProductImages(product);
    String coverImgURL = "";
    for(ProductImage img : productImages){
        if(img.isCover())coverImgURL=img.getImageURL();
    }
%>
<div class="container-fluid row" style="margin-bottom:60px;">
    <div class="col-md-3 dynamic-height dynamic-center" style="text-align:center;padding:0 50px;"><!-- PADDING ONLY ON MOBILE -->
        <div id="dcc1" class="dynamic-center-content">
            <h1><%=plang.getName()%></h1>
            <h3><%=product.getFormattedPrice(sh.getCurr())%></h3>
            <div>
                <%=plang.getDescription()%>
                <%--<br><br>
                Rozměr: 29 x 19,5 x 5 cm--%>
            </div>
        </div>
    </div>
    <div class="col-md-6 dynamic-height item-image-container" style="text-align:center;height:520px;">
        <%--<div style="background-image: url(assets/img/the-bag.jpg)">
            <a class="image-viewer__zoom image-viewer__zoom-link tooltip--link" data-tooltip="open" data-title="Click To View Larger" href="#image-zoom-11480"></a>
            <img src="themes/fashion-white/assets/img/the-bag.jpg" alt="Half Moon Box" />
        </div>--%>
        <div class="slick-init" style="padding:30px;">
            <div style="background-image: url(<%=coverImgURL%>);"></div>
            <%

            for(ProductImage img : productImages){
                if(!img.equals(coverImgURL)){
                    %>
                    <div style="background-image: url(<%=img.getImageURL()%>);"></div>
                    <%
                }
            }
            %>

        </div>
    </div>
    <div class="col-md-3 dynamic-height dynamic-center" style="text-align:center;">
        <div id="dcc2" class="dynamic-center-content">
            <%--<div>
                <div class="input-group" style="width:75px;margin:auto;">
                    <input type="text" class="form-control" placeholder="1" size="2" value="1">
                    <span class="input-group-btn">
                    <span class="btn" style="cursor:auto;"> KS </span>
                </span>
                </div>
            </div>
            <div class="spacer-sm"></div>--%>
            <div>
                <input name="add-to-basket-id" value="<%=product.getId()%>" style="display:none;"/>
                <input name="add-to-basket-quantity" value="1" style="display:none;"/>
                <a class="btn btn-black add-to-basket-submit" >Přidat do košíku</a>
            </div>
            <div class="spacer-sm"></div>
            <div>
                <a href="?page=lili-help"> LILI HELP </a> | <a href="?page=blog"> BLOG </a> | <a> REKLAMACE </a>
            </div>
        </div>
    </div>
</div>
<hr>

<jsp:include page="../_main/newsletter.jsp"/>
<script>
    //Shop

    //$('.dynamic-height')
    function initItemContainers(){
        var pageHeight = $(window).height();
        var pageWidth = $(window).width();
        var navbarHeight = $('.ba-navbar').height();
        var isMobile = pageWidth>=992?false:true;

        if(!isMobile) {
            var resultHeight = pageHeight - navbarHeight;
            if(resultHeight<520)resultHeight=520;
            $('.dynamic-height').css('height', resultHeight + 'px');
            $('.dynamic-center').each(function() {
                var content = $(this).find('.dynamic-center-content');
                if(content.height()!=null) {
                    var contentHeight = content.height();
                    var halfHeight = contentHeight / 2;
                    var halfContainerHeight = resultHeight / 2;
                    var resultMarginTop = halfContainerHeight - halfHeight;
                    $(content).css('margin-top', resultMarginTop + 'px');
                }
            });

        }else{
            var itemImageContainer = $('.item-image-container').width();
            $('.item-image-container').css('height',itemImageContainer+'px');
        }
        $('.dynamic-height').css('opacity','1');
        $('.dynamic-center').css('padding','0 50px');



    }
    initItemContainers();
    $( window ).resize(function() {
       initItemContainers();
    });
    $('.slick-init').slick({
        /*autoplay: !0,
        autoplaySpeed: 2e3,
        pauseOnHover: !1,
        arrows: !1,
        centerMode: !0,
        fade: !0,
        cssEase: "ease-in-out",
        speed: 500*/
        infinite: true,
        speed: 0,
        fade: true,
        prevArrow: '<a href="javascript:;" class="slick-arrow slick-arrow--prev"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>',
        //nextArrow: '<a href="javascript:;" class="slick-arrow slick-arrow--next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>',
        nextArrow: '<a href="javascript:;" class="slick-arrow slick-arrow--next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>',
        responsive: [{
            breakpoint: 1023,
            settings: {
                fade: false,
                speed: 200
            }
        }]
    })
</script>