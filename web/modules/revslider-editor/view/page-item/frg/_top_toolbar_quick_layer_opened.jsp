<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 2/19/17
  Time: 9:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="quick-layers-wrapper" class="quick-layers-container collapse">
    <div id="quick-layers">
        <div class="tp-clearfix"></div>
        <ul id="quick-layers-all-layers" class="quick-layers-list ps-container">
            <li class="nolayersavailable" style="display: block;">
                <div class="add-layer-button">
                    Slide contains no layers
                </div>
            </li>
            <li class="quicksortlayer ui-state-default layer-toolbar-li" data-serial="0" id="layer_quicksort_0">
                <span class="layer-short-tool revdarkgray layer-title-with-icon">
                    <i class="rs-icon-layerimage_n"></i>
                    <input class="layer-title-in-list" type="text" value="image 1">
                </span>
                <span class="quick-edit-toolbar-in-list">
                    <span class="button_change_image_source layer-short-tool revblue" id="button_change_image_source_0">
                        <i class="white-icon glyphicon glyphicon-pencil"></i>
                    </span>
                    <span class="button_reset_size layer-short-tool revblue" id="button_reset_size_0">
                        <i class="eg-icon-resize-normal"></i>
                    </span>
                    <span class="button_delete_layer layer-short-tool revred" id="button_delete_layer_0">
                        <i class="rs-lighttrash"></i>
                    </span>
                    <span class="button_duplicate_layer layer-short-tool revyellow" data-isstatic="" id="button_duplicate_layer_0">
                        <i class="rs-lightcopy"></i>
                    </span>
                    <span style="display:block;float:none;clear:both"></span>
                </span>
                <span class="quick-layer-view layer-short-tool revdarkgray in-on">
                    <i class="eg-icon-eye"></i>
                </span>
                <span class="quick-layer-lock layer-short-tool revdarkgray">
                    <i class="eg-icon-lock-open"></i>
                </span>
                <div style="clear:both;display:block"></div>
            </li>
        </ul>
    </div>
</div>
