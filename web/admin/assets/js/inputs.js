var ComponentsBootstrapSwitch = function () {

    var handleBootstrapSwitch = function() {

        $('.switch-radio1').on('switch-change', function () {
            $('.switch-radio1').bootstrapSwitch('toggleRadioState');
        });

        // or
        $('.switch-radio1').on('switch-change', function () {
            $('.switch-radio1').bootstrapSwitch('toggleRadioStateAllowUncheck');
        });

        // or
        $('.switch-radio1').on('switch-change', function () {
            $('.switch-radio1').bootstrapSwitch('toggleRadioStateAllowUncheck', false);
        });

    }

    return {
        //main function to initiate the module
        init: function () {
            handleBootstrapSwitch();
        }
    };

}();


var ComponentsBootstrapMaxlength = function () {

    var handleBootstrapMaxlength = function() {
        $('.maxlength_defaultconfig').maxlength({
            limitReachedClass: "label label-danger",
        });

        $('.maxlength_alloptions').maxlength({
            alwaysShow: true,
            warningClass: "label label-success",
            limitReachedClass: "label label-danger",
            separator: ' z ',
            preText: 'Napsal/a jste ',
            postText: ' znaků.',
            validate: true
        });

        $('#maxlength_textarea').maxlength({
            limitReachedClass: "label label-danger",
            alwaysShow: true
        });

        $('#maxlength_placement').maxlength({
            limitReachedClass: "label label-danger",
            alwaysShow: true,
            placement: App.isRTL() ? 'top-right' : 'top-left'
        });
    }

    return {
        //main function to initiate the module
        init: function () {
            handleBootstrapMaxlength();
        }
    };

}();

var ComponentsBootstrapTagsinput = function() {


    var handleDemo3 = function() {
        $('.tagsinput-def').tagsinput({
            delimiter:';'
        });
    }

    return {
        init: function() {
            handleDemo3();
        }
    };

}();


jQuery(document).ready(function() {
    ComponentsBootstrapMaxlength.init();

    ComponentsBootstrapSwitch.init();
    ComponentsBootstrapTagsinput.init();
});