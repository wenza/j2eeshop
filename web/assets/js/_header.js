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