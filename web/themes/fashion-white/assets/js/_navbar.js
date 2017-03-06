/** PANEL BASKET **/
var panel, paneli = $(".header-account-panel-hover.panel-basket");
function appearPanel(){
    panel && clearTimeout(panel);
    paneli.children(".header-account-menu.panel-basket").removeClass("active");
    $(paneli).children(".header-account-menu.panel-basket").addClass("active");
}
function hidePanel(timeoutMs){
    panel = setTimeout(function() {
        paneli.children(".header-account-menu.panel-basket").removeClass("active")
    }, timeoutMs);
}
paneli.hover(function() {//TODO: UNDERLINE
    appearPanel();
    hidePanelAccount(200);
}, function() {
    hidePanel(500);
});
/** PANEL ACCOUNT **/
var panel2, paneli2 = $(".header-account-panel-hover.panel-account");
function appearPanelAccount(){
    panel2 && clearTimeout(panel);
    paneli2.children(".header-account-menu.panel-account").removeClass("active");
    $(paneli2).children(".header-account-menu.panel-account").addClass("active");
}
function hidePanelAccount(timeoutMs){
    panel2 = setTimeout(function() {
        paneli2.children(".header-account-menu.panel-account").removeClass("active")
    }, timeoutMs);
}
paneli2.hover(function() {//TODO: UNDERLINE
    appearPanelAccount();
    hidePanel(200);
}, function() {
    hidePanelAccount(500);
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