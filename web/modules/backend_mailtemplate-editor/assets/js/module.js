var MailTemplateEditor = function () {
    var update = function(inputVal, inputName){
        console.log('inputname='+inputName+' , inputval='+inputVal);
        /*var body = $('.mailtpl-editor-iframe').contents().find('body');
         var newHTML = body.html().replace('a','x');
         body.html(newHTML);*/
        var ifrBody = $('.mailtpl-editor-iframe').contents();
        var el = $('.mailtpl-editor-iframe').contents().find(
            'h1:contains(*|'+inputName+'|*),'+
            'h2:contains(*|'+inputName+'|*),'+
            'h3:contains(*|'+inputName+'|*),'+
            'h4:contains(*|'+inputName+'|*),'+
            'h5:contains(*|'+inputName+'|*),'+
            'span:contains(*|'+inputName+'),'+
            'p:contains(*|'+inputName+'|*),'+
            'textarea:contains(*|'+inputName+'|*),'+
            'div:contains(*|'+inputName+'|*),'+
            'a:contains(*|'+inputName+'|*)'
        )
        var finalEl = el;
        el.each(function( index ) {
            finalEl=$(el[index]);
        });
        finalEl.addClass(inputName+'_html');

        //http://localhost:8080/admin/?page=module&module=mailtemplate-editor&module-entity=page&action=form

        ifrBody.find('[name*='+inputName+']').addClass(inputName+'_name');
        ifrBody.find('[value*='+inputName+']').addClass(inputName+'_value');
        ifrBody.find('[src*='+inputName+']').addClass(inputName+'_src');
        ifrBody.find('[id*='+inputName+']').addClass(inputName+'_id');
        ifrBody.find('[href*='+inputName+']').addClass(inputName+'_href');
        ifrBody.find('[title*='+inputName+']').addClass(inputName+'_title');

        ifrBody.find('.'+inputName+'_name').attr('name',inputVal);
        ifrBody.find('.'+inputName+'_value').attr('value',inputVal);
        ifrBody.find('.'+inputName+'_src').attr('src',inputVal);
        ifrBody.find('.'+inputName+'_id').attr('id',inputVal);
        ifrBody.find('.'+inputName+'_href').attr('href',inputVal);
        ifrBody.find('.'+inputName+'_title').attr('title',inputVal);
        ifrBody.find('.'+inputName+'_html').html(inputVal);
    }
    var handleInit = function() {
        $('.mail-iframe-update').keyup(function () {
            var inputVal = $(this).val();
            var inputName = $(this).attr('name');
            console.log(inputName);
            update(inputVal,inputName);
        });
        $('.mail-iframe-update').change(function () {
            var inputVal = $(this).val();
            var inputName = $(this).attr('name');
            console.log(inputName);
            update(inputVal,inputName);
        });
        $('.img-fileupload.mail-iframe-update>input[type="text"]').change(function () {

            var inputVal = $(this).val();
            var inputName = $(this).attr('name');
            console.log(inputName);
            update(inputVal,inputName);
        });
    }
    return {
        //main function to initiate the module
        init: function () {
            handleInit();
        }
    };
}();