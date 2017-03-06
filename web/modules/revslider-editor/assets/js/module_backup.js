var RevSliderEditor = function () {
    var elementsCounter = 0;
    var editingEl = null;
    var handleInit = function() {
        $(".rev-layer").draggable();
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


        $('#wenza_revedit').click(function(){//$(document).on('click',function(){
            console.log()
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
            var html = '<div class="rev-layer '+type+' '+elementUniqueClass+'">TEXT</div>';
            if('button'==type){
                html = '<a href="#" class="rev-layer btn grey '+type+' '+elementUniqueClass+'">TEXT Tlačítka</a>';
            }
            addLayer(type,html,elementUniqueClass);
        });

        $('textarea[name="content"]').change(function(){
            editingEl.html($(this).val());
        });
        $('input[name="content"]').keyup(function(){
            editingEl.html($(this).val());
        });
        $('input[name="link"]').keyup(function(){
            editingEl.attr('href',$(this).val());
        });

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
        /*element.click(function(event){
            event.preventDefault();
            return false;
        });*/
        openElementEdit(element,type);
    }
    var openElementEdit = function(el){
        editingEl=el;
        $('.edit-element-li').hide();
        $('#edit-element-container').collapse('show');
        $('.edit-el-type-'+el.attr('type')).show();
        /*var defaultText = 'TEXT';
        el.html(defaultText);*/
        if(el.attr('type')=='text') {
            $('textarea[name="content"]').val(el.html());
            CKEDITOR.instances['content'].setData(el.html());
        }else if(el.attr('type')=='button') {
            console.log('this is button');
            $('input[name="content"]').val(el.html());
            $('input[name="link"]').val(el.attr('href'));
        }
        console.log('add layer edit ['+el.attr('type')+']- opened');
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
    return {
        //main function to initiate the module
        init: function () {
            handleInit();
            initRulersForContainers();
            initRulers();
        }
    };
}();