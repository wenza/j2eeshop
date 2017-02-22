$('input[name="iso-code"]').keyup(function(){
    $('.currency-iso-code-fill').html($(this).val());
});