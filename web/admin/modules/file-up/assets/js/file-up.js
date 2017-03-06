var FileUp = function () {
    var handleFileUp = function(servletURL,servletName,errorContainerSelector) {
        var fileUploadDivs = $('.img-fileupload');
        fileUploadDivs.each(function( index ) {
            console.log('found-div-for-img-fileupload');
            var currentFileUploadDiv = $(fileUploadDivs[index]);
            currentFileUploadDiv.parent().append('<input id="ffile-up-'+index+'" type="file" name="fileupload-hidden-file-btn"/>');
            var inputName = currentFileUploadDiv.data('name');
            var inputValue = currentFileUploadDiv.data('value');
            currentFileUploadDiv.append(
                '<button type="button" class="btn" ><!--<i class="fa fa-upload"></i> -->Upload</button>'+
                '<input type="text" name="'+inputName+'" value="'+inputValue+'">'
            );
            console.log('inval='+inputValue);
            if(inputValue!=''){
                currentFileUploadDiv.css('background-image', 'url(\'' + inputValue + '\')');
                currentFileUploadDiv.find('button.btn').hide();
                currentFileUploadDiv.removeClass('cloud');
                currentFileUploadDiv.css('border', 'none');
                $('input[name="'+inputName+'"]').val(inputValue);
            }

            $(this).data('my-index',index);
        });
        fileUploadDivs.click(function(){
            var inputFile = $('input[name="fileupload-hidden-file-btn"]#ffile-up-'+$(this).data('my-index'));
            inputFile.click();

        });
        var imagesPath = servletURL;
        var errorContainer = $(errorContainerSelector);
        /*
        To enable possibility to upload same image to all fileuploads on the page we need to have own input, therefore
        aim on each one = iterate through divs :/
         */
        fileUploadDivs.each(function( index ) {
            var visibleContainer = $(fileUploadDivs[index]);
            var button = visibleContainer.find('button');
            var urlInput = visibleContainer.find('input[type="text"]');
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
            $('input[name="fileupload-hidden-file-btn"]#ffile-up-'+index).ajaxfileupload({//$('input[name="fileupload-hidden-file-btn"]').ajaxfileupload({
                action: servletURL + '/' + servletName + '?'+params,
                valid_extensions : ['gif','png','jpg','jpeg','svg'],
                onComplete: function (response) {
                    button.html('Upload');
                    if (response.msg == undefined) {
                        errorContainer.html('<h2>Ooops there is a problem!</h2><ul><li>' + response.message + '</li></ul>');
                    } else {
                        if (response.success == false) {
                            errorContainer.html('' + response.msg + '');
                            console.log(response.msg);
                        } else {
                            visibleContainer.css('background-image', 'url(\'' + imagesPath + response.msg + '\')');
                            button.hide();
                            visibleContainer.removeClass('cloud');
                            visibleContainer.css('border', 'none');
                            urlInput.val(response.msg).change();

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
        });
    }
    return {
        //main function to initiate the module
        init: function (servletURL,servletName,errorContainerSelector) {
            handleFileUp(servletURL,servletName,errorContainerSelector);
        }
    };
}();