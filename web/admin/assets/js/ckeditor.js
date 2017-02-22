/*
 "dialogui,dialog,about,a11yhelp,dialogadvtab,basicstyles,bidi,blockquote,clipboard,button,
 panelbutton,panel,floatpanel,colorbutton,colordialog,templates,menu,contextmenu,copyformatting,div,
 resize,toolbar,elementspath,enterkey,entities,popup,filebrowser,find,fakeobjects,flash,
 floatingspace,listblock,richcombo,font,forms,format,horizontalrule,htmlwriter,iframe,wysiwygarea,
 image,indent,indentblock,indentlist,smiley,justify,menubutton,language,link,list,liststyle,magicline,maximize,
 newpage,pagebreak,pastetext,pastefromword,preview,print,removeformat,save,selectall,showblocks,showborders,
 sourcearea,specialchar,scayt,stylescombo,tab,table,tabletools,undo,wsc"
 */
$( '.ckeditor-sm-init' ).ckeditor(
    function() {
        /* callback code */
    }, {
        skin : 'office2013',
        toolbar : [
            { name: 'clipboard', items: ['Source', 'Scayt' , 'Bold', 'Italic', 'Underline'] },
        ],
        contentsCss : ['https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css', 'assets/css/app.css', 'assets/css/ckeditor_inner.css'],
        language : 'cs',
        height:'100px',
        enterMode : CKEDITOR.ENTER_BR,
        removePlugins : 'elementspath',
        resize_enabled: false,
        shiftEnterMode: CKEDITOR.ENTER_P
    }
);
$( '.ckeditor-init' ).ckeditor(
    function() {
        /* callback code */
    }, {
        skin : 'office2013',
        toolbar : [
            { name: 'clipboard', items: ['Source','Print', 'PasteFromWord', '-', 'Scayt' ,'Link', 'Unlink', 'Image',
                'Table', 'HorizontalRule', 'SpecialChar' , 'Maximize' , 'Bold', 'Italic', 'Strike', '-', 'RemoveFormat' ,
                'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent' ,'-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock',
                'Styles-REMOVE', 'Format','Font','FontSize','TextColor' ] },
        ],
        contentsCss : ['https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css', 'assets/css/app.css'],
        language : 'cs',
        enterMode : CKEDITOR.ENTER_BR,
        extraPlugins : 'justify',
        shiftEnterMode: CKEDITOR.ENTER_P
    }
);
for (var i in CKEDITOR.instances) {
    CKEDITOR.instances[i].on('change', function() {
        //console.log(CKEDITOR.instances[i].name);
        $('textarea[name="'+CKEDITOR.instances[i].name+'"]').change();
        $('#'+CKEDITOR.instances[i].name+'').change();
    });
}
/*
CKEDITOR.editorConfig = function( config ) {
    // Define changes to default configuration here. For example:
    config.language = 'cs';
    // config.uiColor = '#AADC6E';
    config.skin = 'office2013';
};
*/
