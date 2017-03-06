<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 2/19/17
  Time: 9:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="edit-element-container" class="quick-layers-container collapse">
    <div id="quick-layers">
        <div class="tp-clearfix"></div>
        <ul class="quick-layers-list ps-container">
            <li class="nolayersavailable">

                <div class="edit-element-li edit-el-type-text" style="display:none;">
                    <textarea id="textcontentckedit" name="text-content" class="ckeditor-init form-control"></textarea>
                </div>
                <div class="edit-element-li edit-el-type-button" style="display:none;">
                    <div style="color:#565656;">Odkaz:</div>
                    <input class="nolayerselectednow" name="link" type="text" style="width:100%;background:#313131;color:white;"/>
                    <div style="color:#565656;">Text:</div>
                    <textarea id="textcontentckeditnumbertwo" name="content" class="ckeditor-init form-control"></textarea>
                    <%--<input class="nolayerselectednow" name="content" type="text" style="width:100%;background:#313131;color:white;"/>--%>

                </div>
            </li>
        </ul>
    </div>
</div>
