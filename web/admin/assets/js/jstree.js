var UITree = function () {

    var handleSample2 = function () {
        var treeview = $('#categories-tree');
        treeview.jstree({
            //'plugins': ["wholerow", "checkbox", "types"],
            'core': {
                "themes" : {
                    "responsive": false
                },
                "multiple" : false,
                'data': categoriesTableData
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder icon-state-warning icon-lg"
                },
                "file" : {
                    "icon" : "fa fa-file icon-state-warning icon-lg"
                }
            }
        }).bind(
            "select_node.jstree", function(evt, data){
                //selected node object: data.inst.get_json()[0];
                //selected node text: data.inst.get_json()[0].data
                var db_id = data.node.original.db_id;
                console.log($('input[name="parent-id"]'));
                console.log(db_id);
                $('input[name="parent-id"]').val(db_id);
            }
        ).bind("loaded.jstree", function (event, data) {
            // you get two params - event & data - check the core docs for a detailed description
            $(this).jstree("open_all");
        });
    }
    var handleSample3 = function () {
        var treeview = $('#categories-checkbox-tree');
        treeview.jstree({
            'plugins': ["checkbox"],
            checkbox: {
                three_state: false
            },
            'core': {
                "themes" : {
                    "responsive": false
                },
                "multiple" : true,
                'data': categoriesTableData
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder icon-state-warning icon-lg"
                },
                "file" : {
                    "icon" : "fa fa-file icon-state-warning icon-lg"
                }
            }
        }).bind(
            "select_node.jstree", function(evt, data){
                var result = '';
                $.each($("#categories-checkbox-tree").jstree("get_checked",true),function(){
                    result+=this.original.db_id+',';
                });
                if(result!=''){
                    result=result.substr(0,result.length-1);
                    console.log(result);
                }
                $('input[name="categories"]').val(result);
            }
        ).bind(
            "deselect_node.jstree", function(evt, data){
                var result = '';
                $.each($("#categories-checkbox-tree").jstree("get_checked",true),function(){
                    result+=this.original.db_id+',';
                });
                if(result!=''){
                    result=result.substr(0,result.length-1);
                    console.log(result);
                }
                $('input[name="categories"]').val(result);
            }
        ).bind("loaded.jstree", function (event, data) {
            // you get two params - event & data - check the core docs for a detailed description
            $(this).jstree("open_all");
        });
    }
    var initCountriesTreeview = function(treeview,emptyJTreeData){
        console.log('initing - '+treeview);
        treeview.jstree({
            'plugins': ["checkbox"],
            checkbox: {
                //three_state: false
            },
            'core': {
                "themes" : {
                    "responsive": false
                },
                "multiple" : true,
                'data': emptyJTreeData==null?multipleJTreeData[parseInt(treeview.data('counter'))]:emptyJTreeData
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder icon-state-warning icon-lg"
                },
                "file" : {
                    "icon" : "fa fa-file icon-state-warning icon-lg"
                }
            }
        }).bind(
            "select_node.jstree", function(evt, data){
                var result = '';
                var myInput = $($(this).parent().find('input.jcvd'));



                $.each($(this).jstree("get_checked",true),function(){
                    result+=this.original.db_id+',';
                });
                if(result!=''){
                    result=result.substr(0,result.length-1);
                    console.log(result);
                }
                myInput.val(result);
                console.log(myInput.val());
            }
        ).bind(
            "deselect_node.jstree", function(evt, data){
                var result = '';
                var myInput = $($(this).parent().find('input.jcvd'));

                $.each($(this).jstree("get_checked",true),function(){
                    result+=this.original.db_id+',';
                });
                if(result!=''){
                    result=result.substr(0,result.length-1);
                    console.log(result);
                }
                myInput.val(result);
                console.log(myInput.val());
            }
        ).bind("loaded.jstree", function (event, data) {
            // you get two params - event & data - check the core docs for a detailed description
            //$(this).jstree("open_all");
            var result = '';
            var myInput = $($(this).parent().find('input.jcvd'));

            $.each($(this).jstree("get_checked",true),function(){
                result+=this.original.db_id+',';
            });
            if(result!=''){
                result=result.substr(0,result.length-1);
            }
            myInput.val(result);

            initAnchorsInsideNode();
        }).bind("open_node.jstree",function (e, data){
            initAnchorsInsideNode();
        });
    }
    var handleSample4 = function () {
        var treeviews = $('.countries-checkbox-tree');
        treeviews.each(function( index ) {
            var treeview = $(treeviews[index]);
            initCountriesTreeview(treeview,null)
        });

    }
    var initAnchorsInsideNode = function(){
        var anchorsOuter = $('.jstree-anchor');

        anchorsOuter.each(function(index){
            var anchorOuter = $(anchorsOuter[index]);
            var parent = anchorOuter.parent();
            var actions = $(anchorOuter.find('span.actions'));
            actions.each(function(index2){
                console.log('tadaa'+index2);
                var action = $(actions[index2]);
                //parent.append(anchorInner);
                action.insertAfter(anchorOuter);
            });
        });
    }



    return {
        //main function to initiate the module
        init: function () {

            handleSample2();
            handleSample3();
            handleSample4();

        },
        initCountriesTreeviewo : function(treeview,emptyJTreeData){
            initCountriesTreeview(treeview,emptyJTreeData);
        },
        initAnchors: function () {

            initAnchorsInsideNode();

        }

    };

}();

if (App.isAngularJsApp() === false) {
    jQuery(document).ready(function() {
        UITree.init();
    });
}