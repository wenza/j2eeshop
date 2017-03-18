<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 2/19/17
  Time: 9:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="quick-layer-selector-container">
    <%--<div class="current-active-main-toolbar">
    </div>--%>
    <div class="current-active-main-toolbar">
        <div id="layer-short-toolbar" class="layer-toolbar-li">
            <span id="button_show_all_layer" class="layer-short-tool revdarkgray">
                <i class="focus-at layers-menu-button glyphicon glyphicon-align-justify" data-toggle="collapse" data-target="#quick-layers-wrapper"></i>
                <input class="nolayerselectednow" type="text" id="the_current-editing-layer-title" disabled="disabled" name="the_current-editing-layer-title" value="">
            </span>
            <%--<span id="button_delete_layer" class="ho_column_ layer-short-tool revred button-now-disabled"><i class="rs-lighttrash"></i></span>--%>

            <%--<span style="display:none;" id="button_change_video_settings" class="layer-short-tool revblue"><i class="eg-icon-pencil"></i></span>
            <span id="layer-short-tool-placeholder-a" class="layer-short-tool revdarkgray"></span>
            <span id="layer-short-tool-placeholder-b" class="layer-short-tool revdarkgray"></span>
            <span style="display:none" id="button_edit_layer" class="layer-short-tool revblue"><i class="eg-icon-pencil"></i></span>

            <span style="display:none;" id="button_change_image_source" class="layer-short-tool revblue"><i class="eg-icon-pencil"></i></span>

            <span style="display:none" id="button_reset_size" class="layer-short-tool revblue"><i class="eg-icon-resize-normal"></i></span>
            <span id="button_delete_layer" class="ho_column_ layer-short-tool revred button-now-disabled"><i class="rs-lighttrash"></i></span>
            <span id="button_duplicate_layer" class="ho_column_ layer-short-tool revyellow button-now-disabled" data-isstatic="false"><i class="rs-lightcopy"></i></span>
            <span style="display:none;" id="tp-addiconbutton" class="layer-short-tool revblue"><i class="eg-icon-th"></i></span>
            <span style="display:none" id="hide_layer_content_editor" class="layer-short-tool revgreen"><i class="eg-icon-check"></i></span>
            <span class="quick-layer-view layer-short-tool revdarkgray"><i class="eg-icon-eye"></i></span>
            <span class="quick-layer-lock layer-short-tool revdarkgray"><i class="eg-icon-lock-open"></i></span>
            <div style="clear:both;display:block"></div>--%>
        </div>
    </div>
    <jsp:include page="_top_toolbar_quick_layer_opened.jsp"/>
    <jsp:include page="_top_toolbar_quick_layer_edit.jsp"/>
</div>