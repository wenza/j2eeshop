var MultiFileUp = function () {
    var clickers = function(){

        $('.multi-img').unbind('click');
        return $('.multi-img').click(function(){
            var parent =$(this).parent();
            var overlay = $(parent.find('.multi-imgs-overlay'));
            var visibleContainer = parent.find('.multi-img-fileupload');
            var myInput = $($(this).find('input[name="'+visibleContainer.data('name')+'"]'));
            if(!overlay.length){
                //doesnt exists
                console.log('myinput=');
                console.log(myInput);
                console.log(myInput.val());
                var cover = parent.find('.iscover');
                if(cover.length) {
                    var previousInput = cover.find('input');
                    var previousName = previousInput.attr('name');
                    console.log('pnema='+previousName);
                    previousName = previousName.substring(0, previousName.length - ('-cover').length);
                    console.log('pnema2='+previousName);
                    var previous = cover.parent();
                    var inputHTML = '<input type="text" name="' + previousName + '" value="' + previousInput.val() + '" style="display:none;">';
                    previous.append(inputHTML);
                    cover.remove();
                }


                var coverHTML='<div class="iscover">Cover<input type="text" name="'+visibleContainer.data('name')+'-cover" value="'+myInput.val()+'" style="display:none;"/></div>';
                myInput.remove();
                $(this).append(coverHTML);
            }else {
                overlay.addClass('open');
            }
        });
    }
    var handleMultiFileUp = function(servletURL,servletName,errorContainerSelector) {
        var fileUploadDivs = $('.multi-img-fileupload');
        fileUploadDivs.each(function( index ) {
            var currentFileUploadDiv = $(fileUploadDivs[index]);
            currentFileUploadDiv.parent().append('<input id="multi-ffile-up-'+index+'" type="file" name="multi-fileupload-hidden-file-btn"/>');
            var inputName = currentFileUploadDiv.data('name');
            var inputValue = currentFileUploadDiv.data('value');
            currentFileUploadDiv.append(
                '<button type="button" class="btn" ><span class="glyphicon glyphicon-plus"></span></button>'//+
                //'<input type="text" name="'+inputName+'" value="'+inputValue+'">'
            );
            $(this).data('my-index',index);
        });
        fileUploadDivs.click(function(){
            var inputFile = $('input[name="multi-fileupload-hidden-file-btn"]#multi-ffile-up-'+$(this).data('my-index'));
            inputFile.click();

        });
        var imagesPath = servletURL;
        var errorContainer = $(errorContainerSelector);
        /*
        To enable possibility to upload same image to all fileuploads on the page we need to have own input, therefore
        aim on each one = iterate through divs :/
         */
        clickers();
        fileUploadDivs.each(function( index ) {
            var visibleContainer = $(fileUploadDivs[index]);
            var visibleContainerParent = $(visibleContainer.parent());
            var button = visibleContainer.find('button');
            //var urlInput = visibleContainer.find('input[type="text"]');
            var params = '';
            var paramElements = $(this).find('input[type="hidden"]');
            paramElements.each(function( index ) {
                var paramElement = $(paramElements[index]);
                params+=paramElement.attr('name')+'='+paramElement.attr('value')+'&';
            });
            if(params=='&'){
                params='';
            }else{
                params=params.substr(0,params.length-1);
            }
            $('input[name="multi-fileupload-hidden-file-btn"]#multi-ffile-up-'+index).ajaxfileupload({//$('input[name="fileupload-hidden-file-btn"]').ajaxfileupload({
                action: servletURL + '/' + servletName + '?'+params,
                valid_extensions : ['gif','png','jpg','jpeg','svg'],
                onComplete: function (response) {
                    button.html('<span class="glyphicon glyphicon-plus"></span>');
                    if (response.msg == undefined) {
                        errorContainer.html('<h2>Ooops there is a problem!</h2><ul><li>' + response.message + '</li></ul>');
                    } else {
                        if (response.success == false) {
                            errorContainer.html('' + response.msg + '');
                            console.log(response.msg);
                        } else {
                            //visibleContainer.css('background-image', 'url(\'' + imagesPath + response.msg + '\')');
                            var coverHTML = '';
                            var inputHTML = '<input type="text" name="'+visibleContainer.data('name')+'" value="'+imagesPath + response.msg+'" style="display:none;">';
                            var hasCover = false;
                            if(!visibleContainerParent.find('.iscover').length){
                                coverHTML='<div class="iscover">Cover<input type="text" name="'+visibleContainer.data('name')+'-cover" value="'+imagesPath + response.msg+'" style="display:none;"/></div>';
                                hasCover=true;
                            }
                            var addHTML = '' +
                                '<div class="multi-img">'+
                                    '<div class="multi-img-image" style="background-image:url(\'' + imagesPath + response.msg + '\');"></div>'+
                                    coverHTML+
                                    (!hasCover?inputHTML:'')+
                                '</div>' +
                                '';
                            visibleContainerParent.append(addHTML);
                            clickers();

                        }
                    }
                },
                onStart: function (response) {
                    button.show();
                    button.html('Uploading...');
                    errorContainer.html('');
                    console.log('upload started');
                },
                onCancel: function (response) {
                    button.show();
                    button.html('Upload');
                    console.log('upload error-' + ($(this).attr('id')));
                }
            });
            $('.multi-img-overflow-close').click(function(){
                var overlay = $($(this).parent());
                overlay.removeClass('open');
            });
        });
    }
    return {
        //main function to initiate the module
        init: function (servletURL,servletName,errorContainerSelector) {
            handleMultiFileUp(servletURL,servletName,errorContainerSelector);
        }
    };
}();