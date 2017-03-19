var ComponentsDropdowns = function () {

    var handleMultiSelect = function () {
        $('.multi-select').multiSelect();
        $('.multi-select-grouped').multiSelect({
            selectableOptgroup: true
        });
    }

    return {
        //main function to initiate the module
        init: function () {
            handleMultiSelect();
        }
    };

}();

jQuery(document).ready(function() {
    ComponentsDropdowns.init();
});