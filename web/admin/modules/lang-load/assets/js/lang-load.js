var LangLoad = function () {
    var handleLangLoad = function(params) {
        var languagesISO = params.languagesISO; //= ['cs','en'];//<%=Arrays.asList(Settings.DEFAULT_FRONTENT_LANGUAGES_ISO)%>;
        //var defaultLanguageISO = '<%=Settings.DEFAULT_FRONTEND_LANG_ISO%>';
        var langInDivs = $('.form-group.lang-in');
        langInDivs.each(function(index){
            var langInDiv = $(langInDivs[index]);
            var label = langInDiv.find('label.control-label:first');
            var input = langInDiv.find('input[type="text"]:first');
            var isHiddenWithModule = false;
            if(!input.length){
                input = langInDiv.find('textarea:first');
                isHiddenWithModule=true;
                //var parent = input.parent();
                //parent.addClass('lang-in-mod-input-container');

            }
            if(input.hasClass('ckeditor-sm-init')){
                var editorID = 'cke_'+input.attr('name');
                //cke_editor1-cs
            }
            $(languagesISO).each(function( indexLangISO ) {
                var langISO = languagesISO[indexLangISO];
                var thisLangCopy = input.clone();
                thisLangCopy.attr('name',thisLangCopy.attr('name')+'-'+langISO);
                if(isHiddenWithModule) {
                    thisLangCopy.addClass('lang-in-mod-input lang-in-mod-input-' + langISO);
                }else{
                    thisLangCopy.addClass('lang-in-input lang-in-input-' + langISO);
                }
                thisLangCopy.data('langISO',langISO);

                //thisLangCopy.hide();
                var selector = 'lang-load-container-'+thisLangCopy.attr('name')+'-'+langISO;
                input.parent().append('<div id="'+selector+'" class="lang-in-input lang-in-input-' + langISO+'"></div>');
                $('#'+selector).append(thisLangCopy);
                $('#'+selector).hide();
            });
            label.append('<span class="lang-in-iso"></span>');
            input.remove();
        });
        handleFullInit(params);
    }
    var handleFullInit = function(params) {
        $('.lang-in-input').hide();
        $('.lang-in-input-'+params.languagesISO[0]).show();
    }
    return {
        //main function to initiate the module
        initAfterJQuery: function (params) {
            handleLangLoad(params);
        }
    };
}();
