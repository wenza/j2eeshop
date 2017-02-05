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



    return {
        //main function to initiate the module
        init: function () {

            handleSample2();
            handleSample3();

        }

    };

}();

if (App.isAngularJsApp() === false) {
    jQuery(document).ready(function() {
        UITree.init();
    });
}