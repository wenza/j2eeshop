var RevSliderEditor = function () {
    var elementsCounter = 0;
    var editingEl = null;
    var toolbarSelectorCounter=0;
    var handleInit = function() {
        $('.rev-layer').draggable();
        /*$(".item").droppable({
            drop: function(event, ui) {
                var $this = $(this);
                $this.append(ui.draggable);

                var width = $this.width();
                var height = $this.height();
                var cntrLeft = (width / 2) - (ui.draggable.width() / 2);
                var cntrTop = (height / 2) - (ui.draggable.height() / 2);

                ui.draggable.css({
                    left: cntrLeft + "px",
                    top: cntrTop + "px"
                });
            }
        });*/

        //$('ruler-hor')
        initRulers();


        $('#wenza_revedit,.add-layer-button,#focus-add-layer-button-x,.rs-slide-device_selector,#button_show_all_layer').click(function(){//$(document).on('click',function(){
            console.log();
            $('.collapse').collapse('hide');
        })

        $('.rs-slide-device_selector').click(function(){
            $('.rs-slide-device_selector.selected').removeClass('selected');
            $(this).addClass('selected');

            /*var elWidth = $('.rs-slide-device_selector.selected').data('w');
            */
            var el = $('.layers-span.layers-'+$(this).data('res'));

            $('.layers-span').removeClass('active');
            //el.css('width',elWidth);
            el.addClass('active');
            initRulers();
        });

        $('.add-layer-button').click(function(){
            console.log('add layer - clicked');
            elementsCounter++;
            var elementUniqueClass = 'added-element-'+elementsCounter;
            var type = $(this).attr('type');
            var html = '<div class="rev-layer rev-'+type+' '+elementUniqueClass+'" data-sel="'+elementUniqueClass+'">TEXT</div>';
            if('button'==type){
                html = '<a href="#" class="rev-layer rev-'+type+' '+elementUniqueClass+'" data-sel="'+elementUniqueClass+'">TEXT Tlačítka</a>';
            }
            addLayer(type,html,elementUniqueClass);
        });

        $('#textcontentckedit,#textcontentckeditnumbertwo').change(function(){
            editingEl.html($(this).val());
            $('#the_current-editing-layer-title').val($(this).val());
            $('.list-name-'+editingEl.data('sel')).val($(this).val());

        });
        /*$('input[name="content"]').keyup(function(){
            editingEl.html($(this).val());
            $('#the_current-editing-layer-title').val($(this).val());
            $('.list-name-'+editingEl.data('sel')).val($(this).val());
            console.log('selector=.list-name-'+editingEl.data('sel'));
        });*/
        $('input[name="link"]').keyup(function(){
            editingEl.attr('href',$(this).val());
            $('.list-name-'+editingEl.data('sel')).val($(this).val());
        });
        $('input[name="image-url"]').change(function(){
            updateSlideBG('background-image',$(this));
        });
        $('input[name="background-color"]').change(function(){
            updateSlideBG('background-color',$(this));
        });
        $('.revslider-save-btn').click(function(){
            exportElements();
            $('#revslider-slide-save-form').submit();
        });

    };
    var updateSlideBG = function(type,updatingElement) {
        /*$('.rev-slidebg').remove();
         var html = '<img src="'+updatingElement.val()+'"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>';
         var layers = $('.layers-span');
         layers.each(function( index ) {
         var layer = $(layers[index]);
         layer.prepend(html);
         });*/
        if (type == 'background-image') {
            $('.slider-bg').css('background-color', 'rgba(0,0,0,0)');
            $('.slider-bg').css('background-image', 'url(\'' + updatingElement.val() + '\'');
            $('.slider-bg').attr('bg',updatingElement.val());
        }else if(type=='background-color'){
            $('.slider-bg').attr('bg','/modules/revslider-editor/assets/img/transparent.png');
            $('.slider-bg').css('background-image', 'url(\'../img/transparent.png\'');
            $('.slider-bg').css('background-color', updatingElement.val() );
        }
    };
    var addLayer = function(type,layerHTML,elementUniqueClass){
        var layers = $('.layers-span');
        layers.each(function( index ) {
            var layer = $(layers[index]);
            layer.append(layerHTML);
            console.log('add layer - appended');
        });
        var element = $('.'+elementUniqueClass);
        element.draggable();//.resizable();
        element.attr('type',type);
        element.dblclick(function(){
            console.log('doubleclicked - '+element.html());
            element = $(this);
            openElementEdit(element);
            //$('#edit-element-container').collapse('show');
            //CKEDITOR.instances['content'].setData(element.html());
        });
        element.click(function(event){
            event.preventDefault();
            return false;
        });
        openElementEdit(element,type);
    }
    var openElementEdit = function(el){
        editingEl=el;
        $('.edit-element-li').hide();
        $('#edit-element-container').collapse('show');
        console.log('selector=.edit-el-type-'+el.attr('type'));
        //$('.edit-element-li.edit-el-type-'+el.attr('type')).css('display','block');
        $('.edit-el-type-'+el.attr('type')).show();
        /*var defaultText = 'TEXT';
        el.html(defaultText);*/
        if(el.attr('type')=='text') {
            $('textarea[name="text-content"]').val(el.html());
            CKEDITOR.instances.textcontentckedit.setData(el.html());
            $('#the_current-editing-layer-title').val(el.html());
        }else if(el.attr('type')=='button') {
            console.log('this is button');
            /*$('input[name="content"]').val(el.html());
            $('input[name="link"]').val(el.attr('href'));
            $('#the_current-editing-layer-title').val(el.html());*/

            $('textarea[name="content"]').val(el.html());
            CKEDITOR.instances.textcontentckeditnumbertwo.setData(el.html());
            $('#the_current-editing-layer-title').val(el.html());
        }
        console.log('add layer edit ['+el.attr('type')+']- opened');
        updateQuickLayer();
    }
    var initRulersForContainers = function(){
        var layers = $('.layers-span');
        var defaultActive = $('.layers-span.active');
        layers.each(function( index ) {
            $('.layers-span.active').removeClass('active');
            //console.log( index + ": " + $( this ).text() );
            var layer = $(layers[index]);
            layer.addClass('active');

            var relativeX = layer.offset().left - $("#wenza_revedit").offset().left;
            //-600 = 0
            var pleft = $('.container-editor').css('padding-left');
            var addPLeft = (parseInt(relativeX)+parseInt(pleft));
            var leftNegative = -600;
            var layersSpanBorderSize = 4;
            var result = leftNegative+addPLeft+layersSpanBorderSize;
            layer.attr('subtract',result);
        });
        $('.layers-span.active').removeClass('active');
        defaultActive.addClass('active');
    }
    var initRulers = function(){
        /*var relativeX = $(".layers-span").offset().left - $("#wenza_revedit").offset().left;
        //-600 = 0
        var pleft = $('.container-editor').css('padding-left');
        var addPLeft = (parseInt(relativeX)+parseInt(pleft));
        var leftNegative = -600;
        var layersSpanBorderSize = 4;
        var result = leftNegative+addPLeft+layersSpanBorderSize;*/

        $('#ruler-hor').css('left',$('.layers-span.active').attr('subtract')+'px');
        //console.log((parseInt(relativeX)+parseInt(pleft))+'px');
    }
    var updateQuickLayer = function(){
        var container = $('.layers-span.layers-desktop');
        var html = '';
        if(container.children().length==0){
            html+='<li class="nolayersavailable" style="display: block;">'+
                    '<div class="add-layer-button">'+
                        'Slide neobsahuje vrstvy'+
                    '</div>'+
                '</li>';
        }
        container.children().each(function () {
            toolbarSelectorCounter++;
            var child = $(this);
            html+=''+
                '<li class="quicksortlayer ui-state-default layer-toolbar-li menu-'+child.data('sel')+'" data-serial="0" id="layer_quicksort_0">\n' +
                '                <span class="layer-short-tool revdarkgray layer-title-with-icon">\n' +
                '                    <i class="rs-icon-layer'+child.attr('type')+'_n"></i>\n' +
                '                    <input class="layer-title-in-list list-name-'+child.data('sel')+'" type="text" disabled value="'+child.html()+'">\n' +
                '                </span>\n' +
                '                <span class="quick-edit-toolbar-in-list">\n' +
                '                    <span data-sel="'+child.data('sel')+'" class="button_edit_layer layer-short-tool revblue" id="">\n' +
                '                        <i class="white-icon glyphicon glyphicon-pencil"></i>\n' +
                '                    </span>\n' +
                '                    <span data-sel="'+child.data('sel')+'" class="button_delete_layer layer-short-tool revred" id="">\n' +
                '                        <i class="rs-lighttrash"></i>\n' +
                '                    </span>\n' +
                '                    <span style="display:block;float:none;clear:both"></span>\n' +
                '                </span>\n' +
                '                <div style="clear:both;display:block"></div>\n' +
                '            </li>';
        });
        $('#quick-layers-all-layers').html(html);
        $('.button_delete_layer').click(function(){
            var selector = $(this).data('sel');
            $('.'+selector).remove();
            $('.menu-'+selector).remove();
            updateQuickLayer();
        });
        $('.button_edit_layer').click(function(){
            var selector = $(this).data('sel');
            var element = $('.'+selector);

            $('.collapse').collapse('hide');
            openElementEdit(element);
        });

    }
    var exportElements = function(){
        var storeDiv = $('#revslider-stored-file');
        var storeTextArea = $('#revslider-slider-content');
        storeDiv.html('');
        var background = $('.slider-bg');
        var bg = background.attr('bg');
        if(background.attr('bg')==undefined){
            bg='';
        }
        var backgroundEl = '<img src="'+background.attr('bg')+'" style="background-color:'+background.css('background-color')+'" alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>';
        storeDiv.append(backgroundEl);



        var container = $('.layers-span.layers-desktop');
        container.children().each(function () {
            var child = $(this);
            var selector = child.data('sel');

            storeDiv.append(child.clone());
            child=$(storeDiv.find('.'+selector));


            var data_desktop_X = parseInt($('.layers-span.layers-desktop>.'+selector).css('left'));
            var data_notebook_X = parseInt($('.layers-span.layers-notebook>.'+selector).css('left'));
            var data_tablet_X = parseInt($('.layers-span.layers-tablet>.'+selector).css('left'));
            var data_mobile_X = parseInt($('.layers-span.layers-mobile>.'+selector).css('left'));

            var data_desktop_Y = parseInt($('.layers-span.layers-desktop>.'+selector).css('top'));
            var data_notebook_Y = parseInt($('.layers-span.layers-notebook>.'+selector).css('top'));
            var data_tablet_Y = parseInt($('.layers-span.layers-tablet>.'+selector).css('top'));
            var data_mobile_Y = parseInt($('.layers-span.layers-mobile>.'+selector).css('top'));

            child.css('left','');
            child.css('top','');

            child.attr('data-hoffset','[\''+data_desktop_X+'\', \''+data_notebook_X+'\', \,'+data_tablet_X+'\', \''+data_mobile_X+'\']');
            child.attr('data-voffset','[\''+data_desktop_Y+'\', \''+data_notebook_Y+'\', \''+data_tablet_Y+'\', \''+data_mobile_Y+'\']');
            /*child.attr('data-speed',300);
            child.attr('data-easing','easeOutExpo');*/
            child.attr('data-width','none');
            child.attr('data-height','none');
            child.attr('data-whitespace','nowrap');
            child.attr('data-responsive_offset','on');
            child.attr('data-frames','data-frames-replaceme');//'[{\'delay\':0,\'speed\':1300,\'frame\':\'0\',\'from\':\'opacity:0;\',\'to\':\'opacity:1;\',\'ease\':\'Power3.easeInOut\'}]');
            child.attr('data-x','[\'left\',\'left\',\'left\',\'left\']');
            child.attr('data-y','[\'top\',\'top\',\'top\',\'top\']');

            child.addClass('tp-caption');

        });
        //console.log('you need to remove css.left');
        //$('#revslider-slider-content').val(container.html());
        console.log(storeDiv.html());
        storeTextArea.val(storeDiv.html());
    }
    var importLayers = function(){
        var selectorCounter = -999;
        var layersContainer = $('#revslider-stored-file');
        layersContainer.children().each(function(){
            selectorCounter++;
            var child = $(this);
            if(child.hasClass('rev-slidebg')){
                var color = child.css('background-color');
                var img = child.attr('src');
                $('.slider-bg').attr('bg',img);
                $('.slider-bg').css('background-image','url(\''+img+'\')');
                $('.slider-bg').css('background-color',color);
            }else{
                var type = child.attr('type');
                var html_desktop = '';
                var html_notebook = '';
                var html_tablet = '';
                var html_mobile = '';
                var left_arr = child.data('hoffset').substring(1,child.data('hoffset').length-1);
                var top_arr = child.data('voffset').substring(1,child.data('voffset').length-1);

                var left_desktop = parseInt(left_arr.split(',')[0].replace(/'/g , ''));
                var left_notebook = parseInt(left_arr.split(',')[1].replace(/'/g , ''));
                var left_tablet = parseInt(left_arr.split(',')[2].replace(/'/g , ''));
                var left_mobile = parseInt(left_arr.split(',')[3].replace(/'/g , ''));
                var top_desktop = parseInt(top_arr.split(',')[0].replace(/'/g , ''));
                var top_notebook = parseInt(top_arr.split(',')[1].replace(/'/g , ''));
                var top_tablet = parseInt(top_arr.split(',')[2].replace(/'/g , ''));
                var top_mobile = parseInt(top_arr.split(',')[3].replace(/'/g , ''));


                /*var html = '<div class="rev-layer '+type+' '+elementUniqueClass+'" data-sel="'+elementUniqueClass+'">TEXT</div>';
                if('button'==type){
                    html = '<a href="#" class="rev-layer btn grey '+type+' '+elementUniqueClass+'" data-sel="'+elementUniqueClass+'">TEXT Tlačítka</a>';
                }*/

                if(type=='button'){
                    html_desktop='<a href="'+child.attr('href')+'" class="rev-layer rev-'+type+' added-element-'+selectorCounter+'" data-sel="added-element-'+selectorCounter+
                        '" type="'+type+'" style="left: '+left_desktop+'px; top: '+top_desktop+'px;">'+child.html()+'</a>';
                    html_notebook='<a href="'+child.attr('href')+'" class="rev-layer rev-'+type+' added-element-'+selectorCounter+'" data-sel="added-element-'+selectorCounter+
                        '" type="'+type+'" style="left: '+left_notebook+'px; top: '+top_notebook+'px;">'+child.html()+'</a>';
                    html_tablet='<a href="'+child.attr('href')+'" class="rev-layer rev-'+type+' added-element-'+selectorCounter+'" data-sel="added-element-'+selectorCounter+
                        '" type="'+type+'" style="left: '+left_tablet+'px; top: '+top_tablet+'px;">'+child.html()+'</a>';
                    html_mobile='<a href="'+child.attr('href')+'" class="rev-layer rev-'+type+' added-element-'+selectorCounter+'" data-sel="added-element-'+selectorCounter+
                        '" type="'+type+'" style="left: '+left_mobile+'px; top: '+top_mobile+'px;">'+child.html()+'</a>';
                }else if(type=='text'){
                    html_desktop='<div class="rev-layer rev-'+type+' added-element-'+selectorCounter+'" data-sel="added-element-'+selectorCounter+
                        '" type="'+type+'" style="left: '+left_desktop+'px; top: '+top_desktop+'px;">'+child.html()+'</div>';
                    html_notebook='<div class="rev-layer rev-'+type+' added-element-'+selectorCounter+'" data-sel="added-element-'+selectorCounter+
                        '" type="'+type+'" style="left: '+left_notebook+'px; top: '+top_notebook+'px;">'+child.html()+'</div>';
                    html_tablet='<div class="rev-layer rev-'+type+' added-element-'+selectorCounter+'" data-sel="added-element-'+selectorCounter+
                        '" type="'+type+'" style="left: '+left_tablet+'px; top: '+top_tablet+'px;">'+child.html()+'</div>';
                    html_mobile='<div class="rev-layer rev-'+type+' added-element-'+selectorCounter+'" data-sel="added-element-'+selectorCounter+
                        '" type="'+type+'" style="left: '+left_mobile+'px; top: '+top_mobile+'px;">'+child.html()+'</div>';

                }
                var container_desktop = $('.layers-desktop');
                var container_notebook = $('.layers-notebook');
                var container_tablet = $('.layers-tablet');
                var container_mobile = $('.layers-mobile');

                var elementUniqueClass = 'added-element-'+selectorCounter ;
                container_desktop.append(html_desktop);
                container_notebook.append(html_notebook);
                container_tablet.append(html_tablet);
                container_mobile.append(html_mobile);
                var element = $('.'+elementUniqueClass);
                element.draggable();//.resizable();
                element.attr('type',type);
                element.dblclick(function(){
                    console.log('doubleclicked - '+element.html());
                    element = $(this);
                    openElementEdit(element);
                });
                element.click(function(event){
                    event.preventDefault();
                    return false;
                });
                openElementEdit(element,type);
            }

        });
        layersContainer.html('');
    }
    return {
        //main function to initiate the module
        init: function () {
            handleInit();
            initRulersForContainers();
            initRulers();
            updateQuickLayer();
            importLayers();
        },
        prepareElementsToSave : function(){
            exportElements();
        },
        importElementsFromSave : function(){
            importLayers();
        }
    };
}();