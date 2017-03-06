<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 2/19/17
  Time: 9:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="add-layer-selector-container">
    <a id="focus-add-layer-button-x" class="btn green focus-at" data-toggle="collapse" data-target="#add-new-layer-container-wrapper">
        <span class="icon-layers"></span> Přidat vrstvu
    </a>
    <div id="add-new-layer-container-wrapper" class="collapse">
        <div id="add-new-layer-container">
            <a class="add-layer-button" type="text"><i class="rs-icon-layerfont_n"></i><span class="add-layer-txt">Text/Html</span></a>
            <%--<a class="add-layer-button" type="image"><i class="rs-icon-layerimage_n"></i><span class="add-layer-txt">Image</span></a>--%>
            <a class="add-layer-button" type="button"><i class="rs-icon-layerbutton_n"></i><span class="add-layer-txt">Tlačítko</span></a>
        </div>
    </div>
</div>