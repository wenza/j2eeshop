<%@ page import="com.worstentrepreneur.j2eeshop.ShopSettings_removeme" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/26/17
  Time: 6:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    var settings = {
        languagesISO:['cs','en'],
        decimals:0
    }
</script>
<!--[if lt IE 9]>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/respond.min.js"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/excanvas.min.js"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/ie8.fix.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<%--<script src="/modules/backend_lang-load/assets/js/lang-load.js" type="text/javascript"></script>
<script>
    LangLoad.initAfterJQuery(settings);
</script>--%>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->


<script src="/modules/backend_metronic-4.7.1/assets/global/scripts/datatable.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/typeahead/handlebars.min.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/typeahead/typeahead.bundle.min.js" type="text/javascript"></script>
<script src="assets/plugins/ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="assets/plugins/ckeditor/adapters/jquery.js" type="text/javascript"></script>
<script src="/modules/backend_file-up/assets/js/jquery.ajaxfileupload.js" type="text/javascript"></script>
<script src="/modules/backend_file-up/assets/js/file-up.js" type="text/javascript"></script>
<script src="/modules/backend_multiple-file-up/assets/js/module.js" type="text/javascript"></script>

<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>

<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/bootstrap-tabdrop/js/bootstrap-tabdrop.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>


<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/global/plugins/jquery-minicolors/jquery.minicolors.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="/modules/backend_metronic-4.7.1/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->

<script src="assets/js/tables.js" type="text/javascript"></script>
<script src="assets/js/ckeditor.js" type="text/javascript"></script>
<script src="assets/js/jstree.js" type="text/javascript"></script>
<script src="assets/js/inputs.js" type="text/javascript"></script>
<script src="assets/js/select2.js" type="text/javascript"></script>
<script src="assets/js/price-tax-calculator.js" type="text/javascript"></script>
<script src="assets/js/update.js" type="text/javascript"></script>
<script src="assets/js/currency.js" type="text/javascript"></script>
<script src="assets/js/colorpickers.js" type="text/javascript"></script>
<script src="assets/js/shipping-price-limits.js" type="text/javascript"></script><!--MUST BE INITIALISED AT LEAST AFTER jstree.js-->
<script src="/modules/backend_double-menu/assets/js/module.js" type="text/javascript"></script>
<script src="/modules/backend_mailtemplate-editor/assets/js/module.js" type="text/javascript"></script>
<script src="/modules/backend_revslider-editor/assets/js/module.js" type="text/javascript"></script>

<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="/modules/backend_metronic-4.7.1/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<script src="/modules/backend_metronic-4.7.1/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>
<!-- END THEME LAYOUT SCRIPTS -->
<script>
    function str2url(str, encoding, ucfirst){
        str = str.toUpperCase();
        str = str.toLowerCase();
        if (false) {//PS_ALLOW_ACCENTED_CHARS_URL
            str = str.replace(/[^a-z0-9\s\'\:\/\[\]-]\\u00A1-\\uFFFF/g, '');
        }else{
            /* Lowercase */
            str = str.replace(/[\u00E0\u00E1\u00E2\u00E3\u00E5\u0101\u0103\u0105\u0430]/g, 'a');
            str = str.replace(/[\u0431]/g, 'b');
            str = str.replace(/[\u00E7\u0107\u0109\u010D\u0446]/g, 'c');
            str = str.replace(/[\u010F\u0111\u0434]/g, 'd');
            str = str.replace(/[\u00E8\u00E9\u00EA\u00EB\u0113\u0115\u0117\u0119\u011B\u0435\u044D]/g, 'e');
            str = str.replace(/[\u0444]/g, 'f');
            str = str.replace(/[\u011F\u0121\u0123\u0433\u0491]/g, 'g');
            str = str.replace(/[\u0125\u0127]/g, 'h');
            str = str.replace(/[\u00EC\u00ED\u00EE\u00EF\u0129\u012B\u012D\u012F\u0131\u0438\u0456]/g, 'i');
            str = str.replace(/[\u0135\u0439]/g, 'j');
            str = str.replace(/[\u0137\u0138\u043A]/g, 'k');
            str = str.replace(/[\u013A\u013C\u013E\u0140\u0142\u043B]/g, 'l');
            str = str.replace(/[\u043C]/g, 'm');
            str = str.replace(/[\u00F1\u0144\u0146\u0148\u0149\u014B\u043D]/g, 'n');
            str = str.replace(/[\u00F2\u00F3\u00F4\u00F5\u00F8\u014D\u014F\u0151\u043E]/g, 'o');
            str = str.replace(/[\u043F]/g, 'p');
            str = str.replace(/[\u0155\u0157\u0159\u0440]/g, 'r');
            str = str.replace(/[\u015B\u015D\u015F\u0161\u0441]/g, 's');
            str = str.replace(/[\u00DF]/g, 'ss');
            str = str.replace(/[\u0163\u0165\u0167\u0442]/g, 't');
            str = str.replace(/[\u00F9\u00FA\u00FB\u0169\u016B\u016D\u016F\u0171\u0173\u0443]/g, 'u');
            str = str.replace(/[\u0432]/g, 'v');
            str = str.replace(/[\u0175]/g, 'w');
            str = str.replace(/[\u00FF\u0177\u00FD\u044B]/g, 'y');
            str = str.replace(/[\u017A\u017C\u017E\u0437]/g, 'z');
            str = str.replace(/[\u00E4\u00E6]/g, 'ae');
            str = str.replace(/[\u0447]/g, 'ch');
            str = str.replace(/[\u0445]/g, 'kh');
            str = str.replace(/[\u0153\u00F6]/g, 'oe');
            str = str.replace(/[\u00FC]/g, 'ue');
            str = str.replace(/[\u0448]/g, 'sh');
            str = str.replace(/[\u0449]/g, 'ssh');
            str = str.replace(/[\u044F]/g, 'ya');
            str = str.replace(/[\u0454]/g, 'ye');
            str = str.replace(/[\u0457]/g, 'yi');
            str = str.replace(/[\u0451]/g, 'yo');
            str = str.replace(/[\u044E]/g, 'yu');
            str = str.replace(/[\u0436]/g, 'zh');

            /* Uppercase */
            str = str.replace(/[\u0100\u0102\u0104\u00C0\u00C1\u00C2\u00C3\u00C4\u00C5\u0410]/g, 'A');
            str = str.replace(/[\u0411]/g, 'B');
            str = str.replace(/[\u00C7\u0106\u0108\u010A\u010C\u0426]/g, 'C');
            str = str.replace(/[\u010E\u0110\u0414]/g, 'D');
            str = str.replace(/[\u00C8\u00C9\u00CA\u00CB\u0112\u0114\u0116\u0118\u011A\u0415\u042D]/g, 'E');
            str = str.replace(/[\u0424]/g, 'F');
            str = str.replace(/[\u011C\u011E\u0120\u0122\u0413\u0490]/g, 'G');
            str = str.replace(/[\u0124\u0126]/g, 'H');
            str = str.replace(/[\u0128\u012A\u012C\u012E\u0130\u0418\u0406]/g, 'I');
            str = str.replace(/[\u0134\u0419]/g, 'J');
            str = str.replace(/[\u0136\u041A]/g, 'K');
            str = str.replace(/[\u0139\u013B\u013D\u0139\u0141\u041B]/g, 'L');
            str = str.replace(/[\u041C]/g, 'M');
            str = str.replace(/[\u00D1\u0143\u0145\u0147\u014A\u041D]/g, 'N');
            str = str.replace(/[\u00D3\u014C\u014E\u0150\u041E]/g, 'O');
            str = str.replace(/[\u041F]/g, 'P');
            str = str.replace(/[\u0154\u0156\u0158\u0420]/g, 'R');
            str = str.replace(/[\u015A\u015C\u015E\u0160\u0421]/g, 'S');
            str = str.replace(/[\u0162\u0164\u0166\u0422]/g, 'T');
            str = str.replace(/[\u00D9\u00DA\u00DB\u0168\u016A\u016C\u016E\u0170\u0172\u0423]/g, 'U');
            str = str.replace(/[\u0412]/g, 'V');
            str = str.replace(/[\u0174]/g, 'W');
            str = str.replace(/[\u0176\u042B]/g, 'Y');
            str = str.replace(/[\u0179\u017B\u017D\u0417]/g, 'Z');
            str = str.replace(/[\u00C4\u00C6]/g, 'AE');
            str = str.replace(/[\u0427]/g, 'CH');
            str = str.replace(/[\u0425]/g, 'KH');
            str = str.replace(/[\u0152\u00D6]/g, 'OE');
            str = str.replace(/[\u00DC]/g, 'UE');
            str = str.replace(/[\u0428]/g, 'SH');
            str = str.replace(/[\u0429]/g, 'SHH');
            str = str.replace(/[\u042F]/g, 'YA');
            str = str.replace(/[\u0404]/g, 'YE');
            str = str.replace(/[\u0407]/g, 'YI');
            str = str.replace(/[\u0401]/g, 'YO');
            str = str.replace(/[\u042E]/g, 'YU');
            str = str.replace(/[\u0416]/g, 'ZH');

            str = str.toLowerCase();

            str = str.replace(/[^a-z0-9\s\'\:\/\[\]-]/g,'');
        }
        str = str.replace(/[\u0028\u0029\u0021\u003F\u002E\u0026\u005E\u007E\u002B\u002A\u002F\u003A\u003B\u003C\u003D\u003E]/g, '');
        str = str.replace(/[\s\'\:\/\[\]-]+/g, ' ');

        // Add special char not used for url rewrite
        str = str.replace(/[ ]/g, '-');
        str = str.replace(/[\/\\"'|,;%]*/g, '');

        if (ucfirst == 1) {
            var first_char = str.charAt(0);
            str = first_char.toUpperCase()+str.slice(1);
        }

        return str;
    }
    var updateFriendlyUrl = function(elem) {
        var id_lang = elem.attr('name').match(/\d+/g)[1];
        $('#form_step5_link_rewrite_' + id_lang).val(str2url(elem.val(), 'UTF-8'));
    };
    jQuery(document).ready(function() {
        console.log('test='+$('#cke_editor1-en').length);
        FileUp.init('','ImageUpload','.add_error');
        MultiFileUp.init('','ImageUpload','.add_error');
        MailTemplateEditor.init();
        RevSliderEditor.init();
    });

    /*$('.lang-group-activator').click(function(){
        $('.lang-group-activator-container.active').removeClass('active');
        $('.lang-group.shown').removeClass('shown');
        $(this).parent().addClass('active');
        var iso = $(this).data('iso-code');
        $('.lang-group-'+iso).addClass('shown');
    });*/
    $('.lang-group-activator').click(function(){
        $('.lang-group-activator.active').removeClass('active');
        $('.lang-group.shown').removeClass('shown');
        $(this).addClass('active');
        var iso = $(this).data('iso-code');
        $('.lang-group-'+iso).addClass('shown');
    });

    function powerSet( list ){
        var set = [],
            listSize = list.length,
            combinationsCount = (1 << listSize),
            combination;

        for (var i = 1; i < combinationsCount ; i++ ){
            var combination = [];
            for (var j=0;j<listSize;j++){
                if ((i & (1 << j))){
                    combination.push(list[j]);
                }
            }
            set.push(combination);
        }
        return set;
    }
    function checkCombinations(){
        $('input[name="combination-ids"]').parent().css('background','green');
        $('input[name="combination-ids"]').attr('disabled',false);
        var checkedBoxes = $('input[name="combination-ids"]:checked');
        checkedBoxes.each(function( index1 ) {
            var checkbox = $(checkedBoxes[index1]);
            var query = checkbox.data('query');
            var splittedQuery = query.split(',');
            var combinations = powerSet(splittedQuery);
            var longestC = 0;
            $(combinations).each(function( index ) {
                var comb = combinations[index];
                var isLongest = false;
                if(comb.length>longestC){
                    longestC=comb.length;
                    isLongest=true;
                }
                var res = '';
                for(var i = 0;i<comb.length;i++){
                    res+=comb[i]+',';
                }
                if(res!=''){
                    res=res.substring(0,res.length-1);
                    var combEl = $('input[name="combination-ids"][data-query="'+res+'"]');
                    combEl.parent().css('background','red');
                    combEl.attr('disabled',true);
                    combEl.prop( "checked", false );
                    if(isLongest){
                        $('.longest-comb').prop('checked',false).removeClass('longest-comb').attr('disabled',true);
                        combEl.addClass('longest-comb');
                        combEl.prop( "checked", true );
                        combEl.attr('disabled',false);
                    }


                }
            });
            $('.longest-comb').removeClass('longest-comb');

        });
    }

    $('input[name="combination-ids"]').change(function() {
        checkCombinations();
    });
    jQuery(document).ready(function() {
        PriceTaxCalculator.init(settings.decimals);
    });





</script>