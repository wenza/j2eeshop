$( ".header-account-menu-link" ).mouseenter(function() {
    $('.header-account-menu-link.underline').removeClass('underline');

    var parent = $(this);
    parent.addClass('underline');
    $('.header_account_content').hide();

    var subClass = $('.'+parent.data('subcls'));
    console.log('sc='+subClass+' - '+subClass);
    subClass.show();

    $('.activator-activated').removeClass('active');
    $('.activator-activated').removeClass('activator-activated');
    var classX = $(this).data('cls');
    $('.'+classX).addClass('active');
    $('.'+classX).addClass('activator-activated');
    $('.'+classX).mouseleave(function() {

        parent.removeClass('underline');
        $(this).removeClass('active');
        $('.activator-activated').removeClass('active');
    });
});
$('.open-search').click(function(){
    $('.header-search-holder').addClass('active');
    $('.input-search').focus();
});
$('.input-search').focusout(function() {
    $('.header-search-holder').removeClass('active');
});
$(window).scroll(function(){
    console.log(window.pageYOffset);
    var bar = $('.ba-navbar');
    if(window.pageYOffset>27){
        if(!bar.hasClass('shadow')){
            bar.addClass('shadow');
        }
    }else{
        if(bar.hasClass('shadow')){
            bar.removeClass('shadow');
        }
    }
    /*if($( window ).height()>500){
        if( scroll_static ){
            console.log('start scrolling');
            scroll_static = false;
            $('.ks-button-abs-3').addClass('ks-button-closed');
        }
        if(TO !== false){ clearTimeout(TO); }
        TO = setTimeout(stopScroll, 400);
    }else{
        if(TO==false){
            console.log('screen height small');
            $('.ks-button-abs-3').hide();
            TO=true;
        }
    }*/
});