var FrontendCore = function () {
    var core = function() {
        function reinitLogin(){
            $('.success-container').html('');
            $('.error-container').html('');
            //$('.reg-form').show();
            //$('.submit-registration').show();
        }
        function reinitRegister(){
            $('.success-container').html('');
            $('.error-container').html('');
            //$('.registration-form').show();
            //$('.submit-registration').show();

        }
        function register(){
            reinitRegister();
            var reqData = '';
            $("form.register-form :input").each(function(){
                var input = $(this); // This is the jquery object of the input, do what you will
                reqData+=input.attr("name")+'='+encodeURIComponent(input.val())+'&';
            });
            reqData=reqData.substring(0,reqData.length-1);
            $.ajax('ajax_customer_registration.jsp', {
                dataType: 'json',
                //dataType: "html",
                data: reqData,
                type: 'POST',
                success: function(mergeResult) {
                    if(mergeResult.entity!=null){
                        $('.success-container').html('Registrace proběhla vpořádku');
                        var currPath = window.location.href;
                        var withoutHT = currPath.substring(0, currPath.indexOf('#'));
                        if(currPath.indexOf('#')==-1){
                            withoutHT = currPath;
                        }
                        if(withoutHT.split('?').length > 1  && withoutHT.split('?')[1] !== ''){
                            console.log('params found');
                            window.location = withoutHT.replace('logout','logged')+'&logged';
                        }else{
                            window.location = withoutHT.replace('logout','logged')+'?logged';
                        }
                    }else{
                        $('.error-container').html(JSON.stringify(mergeResult.errors).replace(/["'()]/g,' '));
                    }
                },
                error: function(responseData,status,err) {
                    console.log("error: "+responseData+" status: "+status+" er:"+err);
                    console.log(responseData);
                    $('.error-container').html("error: "+responseData+" status: "+status+" er:"+err);
                }
            });
        }
        function login() {
            reinitLogin();
            var reqData = '';
            $("form.login-form :input").each(function(){
                var input = $(this); // This is the jquery object of the input, do what you will
                reqData+=input.attr("name")+'='+encodeURIComponent(input.val())+'&';
            });
            reqData=reqData.substring(0,reqData.length-1);
            $.ajax('ajax_customer_login.jsp', {
                dataType: 'json',
                //dataType: "html",
                data: reqData,
                type: 'POST',
                success: function(mergeResult) {
                    console.log(mergeResult);
                    if(mergeResult.entity!=null){
                        $('.success-container').html('Přihlášení proběhlo vpořádku');
                        var currPath = window.location.href;
                        var withoutHT = currPath.substring(0, currPath.indexOf('#'));
                        if(currPath.indexOf('#')==-1){
                            withoutHT = currPath;
                        }
                        if(withoutHT.split('?').length > 1 && withoutHT.split('?')[1] !== ''){
                            console.log('params found');
                            window.location = withoutHT.replace('logout','logged')+'&logged';
                        }else{
                            window.location = withoutHT.replace('logout','logged')+'?logged';
                        }
                    }else{
                        $('.error-container').html(JSON.stringify(mergeResult.errors).replace(/["'()]/g,' '));
                    }
                },
                error: function(responseData,status,err) {
                    console.log("error: "+responseData+" status: "+status+" er:"+err);
                    console.log(responseData);
                    $('.error-container').html("error: "+responseData+" status: "+status+" er:"+err);
                }
            });
        }
        function processBasketHTML(mergeResult,showBasket){
            console.log(mergeResult);
            if(mergeResult.entity!=null){
                var o2pArr = mergeResult.entity.order_products;
                var html = "";
                var prodCount = 0;
                var sum = 0;
                $(o2pArr).each(function(index1){
                    var o2p = o2pArr[index1];
                    var product = o2p.product;
                    var cover = "";
                    var images = product.images;
                    sum+=o2p.priceTaxIncl;
                    prodCount+=o2p.quantity;
                    $(images).each(function(index2){
                        var image = images[index2];
                        console.log(image);
                        if(image.cover)cover=image.imageURL;
                    });

                    html +=  "<li style=\"width:100%;padding-top:10px;padding-bottom:10px;\">\n" +
                        "                                <div style=\"width:36%;float:left;\">\n" +
                        "                                    <a href=\"?page=product&id="+product.id+"\">\n" +
                        "                                        <img style=\"max-width:100%;vertical-align:bottom;\" src=\""+cover+"\">\n" +
                        "                                    </a>\n" +
                        "                                </div>\n" +
                        "                                <div style=\"width:64%;float:left;\">\n" +
                        "                                    <ul style=\"list-style: none;padding: 0;margin: 0;\">\n" +
                        "                                        <li style=\"font-size: 15px;font-size: 1.5rem;margin-top: 0;width:100%;\"><a href=\"#\">"+product.lang.name+" ("+o2p.quantity+"x)</a></li>\n" +
                        "                                        <li style=\"margin-top:5px;width:100%;\">"+o2p.priceTaxIncl+" "+(SHOP_SETTINGS.default_currency.sign)+"</li>\n" +
                        //"                                        <li style=\"margin-top:5px;width:100%;\">Velikost 1</li>\n" +
                        "                                    </ul>\n" +
                        "                                </div>\n" +
                        "                            </li>";
                });

                html+="<li style=\"width:100%;border-top:1px solid black;height:1px;\"></li>\n" +
                    "                            <li style=\"width:100%;text-align:center;line-height: 34px;\">Celkem "+prodCount+" Produktů</li>\n" +
                    "                            <li style=\"width:100%;border-top:1px solid black;height:1px;\"></li>\n" +
                    "                            <li style=\"width:100%;text-align:right;line-height: 34px;\"><span style=\"float:left;\">Mezisoučet</span> "+sum+" "+(SHOP_SETTINGS.default_currency.sign)+"</li>\n" +
                    "                            <li style=\"width:100%;border-top:1px solid black;height:1px;\"></li>";
                html+="<li style=\"width:100%;text-align:center;line-height: 40px;margin-bottom:-10px;\"><a href=\"?page=checkout\" class=\"btn btn-black\">Do košíku</a></li>";
                $('.header_account_content.content-basket').html(html);
                $('.content-basket-count').html(prodCount);
                if(showBasket) {
                    appearPanel();
                    hidePanel(1500);
                }
            }else{
                $('.error-container').html(JSON.stringify(mergeResult.errors).replace(/["'()]/g,' '));
            }
        }
        function getOrderToProduct(){
            $.ajax('ajax_order_to_product_get_json.jsp', {
                dataType: 'json',
                type: 'POST',
                success: function(mergeResult) {
                    processBasketHTML(mergeResult,false);
                },
                error: function(responseData,status,err) {
                    $('.error-container').html("error: "+responseData+" status: "+status+" er:"+err);
                }
            });
        }
        function changeProductAmount(productID,quantity){
            $.ajax('ajax_order_to_product_json.jsp', {
                dataType: 'json',
                //dataType: "html",
                data: 'product-id='+productID+'&quantity='+quantity,
                type: 'POST',
                success: function(mergeResult) {
                    processBasketHTML(mergeResult,true);
                },
                error: function(responseData,status,err) {
                    $('.error-container').html("error: "+responseData+" status: "+status+" er:"+err);
                }
            });
        }
        $('.login-form').submit(function(event){
            event.preventDefault();
            login();
        });
        $('.submit-login').click(function() {
            /*var btn = $(this);
            btn.prop('disabled', true);*/
            $('.login-form').submit();
        });
        $('.register-form').submit(function(event){
            event.preventDefault();
            register();
        });
        $('.submit-registration').click(function() {
            /*var btn = $(this);
             btn.prop('disabled', true);*/
            $('.register-form').submit();
        });
        $('.add-to-basket-submit').click(function(){
            var parentEl = $(this).parent();
            var productID = parentEl.find('input[name="add-to-basket-id"]').val();
            var productAmount = parentEl.find('input[name="add-to-basket-quantity"]').val();
            changeProductAmount(productID,productAmount);
        });
        getOrderToProduct();
        $('.newsletter-form').submit(function(evt){
            console.log('submitted');
            evt.preventDefault();
            var form = $(this);
            var input = form.find('.mail');
            $.ajax('ajax_newsletter_signup.jsp', {
                dataType: 'json',
                //dataType: "html",
                data: 'mail='+input.val(),
                type: 'POST',
                success: function(mergeResult) {
                    if(mergeResult.entity!=null){
                        $('.success-container').html('Registrace emailu "'+input.val()+'" k newsletteru byla provedena vpořádku');
                        console.log('ok');

                    }else{
                        console.log('nok');
                        $('.error-container').html(JSON.stringify(mergeResult.errors).replace(/["'()]/g,' '));
                    }
                },
                error: function(responseData,status,err) {
                    console.log("error: "+responseData+" status: "+status+" er:"+err);
                    console.log(responseData);
                    $('.error-container').html("error: "+responseData+" status: "+status+" er:"+err);
                }
            });
        });
    }

    return {
        //main function to initiate the module
        init: function () {
            $(function() {
                core();
            });
        }
    };

}();