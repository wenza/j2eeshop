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
        languagesISO:['cs','en']
    }
</script>
<!--[if lt IE 9]>
<script src="modules/metronic-4.7.1/assets/global/plugins/respond.min.js"></script>
<script src="modules/metronic-4.7.1/assets/global/plugins/excanvas.min.js"></script>
<script src="modules/metronic-4.7.1/assets/global/plugins/ie8.fix.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script src="modules/metronic-4.7.1/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<%--<script src="modules/lang-load/assets/js/lang-load.js" type="text/javascript"></script>
<script>
    LangLoad.initAfterJQuery(settings);
</script>--%>
<script src="modules/metronic-4.7.1/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="modules/metronic-4.7.1/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="modules/metronic-4.7.1/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="modules/metronic-4.7.1/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="modules/metronic-4.7.1/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->


<script src="modules/metronic-4.7.1/assets/global/scripts/datatable.js" type="text/javascript"></script>
<script src="modules/metronic-4.7.1/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="modules/metronic-4.7.1/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<script src="modules/metronic-4.7.1/assets/global/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<script src="modules/metronic-4.7.1/assets/global/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js" type="text/javascript"></script>
<script src="modules/metronic-4.7.1/assets/global/plugins/typeahead/handlebars.min.js" type="text/javascript"></script>
<script src="modules/metronic-4.7.1/assets/global/plugins/typeahead/typeahead.bundle.min.js" type="text/javascript"></script>
<script src="assets/plugins/ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="assets/plugins/ckeditor/adapters/jquery.js" type="text/javascript"></script>
<script src="modules/file-up/assets/js/jquery.ajaxfileupload.js" type="text/javascript"></script>
<script src="modules/file-up/assets/js/file-up.js" type="text/javascript"></script>

<script src="modules/metronic-4.7.1/assets/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>

<script src="modules/metronic-4.7.1/assets/global/plugins/bootstrap-tabdrop/js/bootstrap-tabdrop.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="modules/metronic-4.7.1/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->

<script src="assets/js/tables.js" type="text/javascript"></script>
<script src="assets/js/ckeditor.js" type="text/javascript"></script>
<script src="assets/js/jstree.js" type="text/javascript"></script>
<script src="assets/js/inputs.js" type="text/javascript"></script>

<script></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="modules/metronic-4.7.1/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
<script src="modules/metronic-4.7.1/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="modules/metronic-4.7.1/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<script src="modules/metronic-4.7.1/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>
<!-- END THEME LAYOUT SCRIPTS -->
<script>
    jQuery(document).ready(function() {
        console.log('test='+$('#cke_editor1-en').length);
        FileUp.init('http://localhost:8080','ImageUpload','.add_error');
    });

    $('.lang-group-activator').click(function(){
        $('.lang-group-activator-container.active').removeClass('active');
        $('.lang-group.shown').removeClass('shown');
        $(this).parent().addClass('active');
        var iso = $(this).data('iso-code');
        $('.lang-group-'+iso).addClass('shown');
    });



</script>