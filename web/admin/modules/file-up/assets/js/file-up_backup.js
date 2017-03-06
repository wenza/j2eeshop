/** READ !!!
 * IT WAS NECESSARY TO ADD IN FILE jquery.ajaxfileupload.js AT LINE 74 code: settings.action=settings.action+$element.data('params');
 * TO SUPPORT PARAMETERS TO THE SERVLET REQUEST
 */
var FileUp = function () {
    var handleFileUp = function(servletURL,servletName,errorContainerSelector) {
        var fileUploadDivs = $('.img-fileupload');
        fileUploadDivs.each(function( index ) {
            var currentFileUploadDiv = $(fileUploadDivs[index]);
            //if(index==0){
                currentFileUploadDiv.parent().append('<input id="ffile-up-'+index+'" type="file" name="fileupload-hidden-file-btn"/>');
            //}
            var inputName = currentFileUploadDiv.data('name');
            var inputValue = currentFileUploadDiv.data('value');
            console.log(inputName);
            currentFileUploadDiv.append(
                '<button type="button" class="btn" ><i class="fa fa-upload"></i> Upload</button>'+
                '<input type="text" name="'+inputName+'" value="'+inputValue+'">'
            );
            $(this).data('my-index',index);
        });
        fileUploadDivs.click(function(){
            var inputFile = $('input[name="fileupload-hidden-file-btn"]#ffile-up-'+$(this).data('my-index'));
            inputFile.data('visible-container',$(this));
            var params = '&';
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
            inputFile.data('params',params);
            inputFile.click();

        });
        //var currPath = window.location.href;
        var imagesPath = servletURL;
        var errorContainer = $(errorContainerSelector);
        /*
        To enable possibility to upload same image to all fileuploads on the page we need to have own input, therefore
        aim on each one = iterate through divs :/
         */
        fileUploadDivs.each(function( index ) {
            $('input[name="fileupload-hidden-file-btn"]#ffile-up-'+index).ajaxfileupload({//$('input[name="fileupload-hidden-file-btn"]').ajaxfileupload({
                action: servletURL + '/' + servletName + '?',
                onComplete: function (response) {
                    var visibleContainer = $(this).data('visible-container');
                    var urlInput = visibleContainer.find('input[type="text"]');
                    visibleContainer.find('button').html('Upload');
                    if (response.msg == undefined) {
                        errorContainer.html('<h2>Ooops there is a problem!</h2><ul><li>' + response.message + '</li></ul>');
                    } else {
                        if (response.success == false) {
                            errorContainer.html('' + response.msg + '');
                        } else {
                            visibleContainer.css('background-image', 'url(\'' + imagesPath + response.msg + '\')');
                            visibleContainer.find('button').hide();
                            visibleContainer.removeClass('cloud');
                            visibleContainer.css('border', 'none');
                            urlInput.val(response.msg);

                        }
                    }
                },
                onStart: function (response) {
                    var visibleContainer = $(this).data('visible-container');
                    visibleContainer.find('button').html('Uploading...');
                    errorContainer.html('');
                    console.log('upload started');
                },
                onCancel: function (response) {
                    var visibleContainer = $(this).data('visible-container');
                    visibleContainer.find('button').html('Upload');
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