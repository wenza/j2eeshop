var double_menu_datasetCounter = 9999;
$('.add-double-menu-link').click(function(){
    var table = $('.double-menu-table');
    var defaultLang = SHOP_SETTINGS.default_language;
    //SHOP_SETTINGS.languages.each(function( index ) {
        //var lang = SHOP_SETTINGS.languages[index];
        var html = '<tr class="odd gradeX">'+
            '<td>'+
                ''+0+''+
            '</td>'+
            '<td class="center">'+
                '<input name="data-set" value="'+double_menu_datasetCounter+'" style="display:none;"/>'+
                '<input name="column1-'+double_menu_datasetCounter+'" value="'+defaultLang.iso_code+'"  style="display:none;"/>'+
                '<input name="column2-'+double_menu_datasetCounter+'" value="999" class="form-control"/>'+
            '</td>'+
            '<td><input name="column3-'+double_menu_datasetCounter+'" value="http://" class="form-control"/></td>'+
            '<td>';
            $(SHOP_SETTINGS.languages).each(function( index ) {
                var lang = SHOP_SETTINGS.languages[index];
                var iso = lang.iso_code;
                html += ''+
                    '<div class="lang-group-'+iso+' lang-group '+(iso==defaultLang.iso_code ?"shown":"")+' ">' +
                        '<div class="input-group">' +
                            '<input class="form-control" type="text" name="column4-'+double_menu_datasetCounter+'-'+iso+'" value="">' +
                            '<span class="input-group-addon">' + iso + '</span>' +
                        '</div>' +
                    '</div>';
            });
            html+='</td>'+
            '<td>'+
                '<a href="javascript:;" class="btn btn-sm red btn-outline grey-salsa"><i class="fa fa-times"></i> Deaktivovat</a>'+
            '</td>'+
        '</tr>';
            table.append(html);

    //});
    double_menu_datasetCounter--;
});