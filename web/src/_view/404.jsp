<%@ page import="com.worstentrepreneur.utils.TestReq" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_main/head_seo.jsp"/>

    <jsp:include page="../_main/head_includes.jsp"/>
</head>
<jsp:include page="../_main/navbar.jsp"/>

<div style="width:100%;height:100px;"><!--SPACER FOR FULLWIDTH--></div>


<div class="dynamic-height dynamic-center">
    <div class="dynamic-center-content">

        <div class="container">
            <div class="col-md-12">

                <h2 style="display:inline-block;">STRÁNKA NENÍ DOSTUPNÁ</h2>
                <span>
                    OMLOUVÁME SE, ALE POŽADOVANÁ STRÁNKA NENÍ DOSTUPNÁ.
                </span>
            </div>
            <hr>
            <div class="col-md-12">
                <a href="?" class="btn btn-black">< Hlavní strana</a>
            </div>
        </div>
    </div>
</div>
<script>loadDynamicHeight();</script>


<jsp:include page="../_main/footer.jsp"/>

<!-- MODALS -->
<jsp:include page="../_main/modal_register.jsp"/>
<jsp:include page="../_main/modal_login.jsp"/>
<script>
    $('.focusmodal').on('shown.bs.modal', function () {
        $(this).find('.focusme').focus();
    });
    //for each element that is classed as 'pull-down', set its margin-top to the difference between its own height and the height of its parent
    $('.pull-down').each(function() {
        var $this = $(this);
        $this.css('margin-top', $this.parent().height() - $this.height())
    });
</script>


<script src="assets/js/_navbar.js"></script>
</html>
