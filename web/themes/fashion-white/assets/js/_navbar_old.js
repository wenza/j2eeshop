var panel, paneli = $(".header-account-panel-hover");
paneli.hover(function() {//TODO: UNDERLINE
    panel && clearTimeout(panel);
    paneli.children(".header-account-menu").removeClass("active");
    $(this).children(".header-account-menu").addClass("active");
}, function() {
    panel = setTimeout(function() {
        paneli.children(".header-account-menu").removeClass("active")
    }, 500);
});

$('.open-search').click(function(){
    $('.header-search-holder').addClass('active');
    $('.input-search').focus();
});
$('.input-search').focusout(function() {
    $('.header-search-holder').removeClass('active');
});
$(window).scroll(function(){
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
});