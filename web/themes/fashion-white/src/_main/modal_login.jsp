<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 12:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- LOGIN -->
<div class="modal fade focusmodal" id="modal-2" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-ba">
            <div class="modal-ba-header" style="padding-bottom:15px;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="clr-f-pink" style="text-align:center;">Přihlášení</h3>
            </div>
            <div class="modal-body">
                <div class="success-container" style="text-align:center;"></div>
                <div class="error-container" style="color: #E84555;text-align: center;"></div>
                <form id="id-soft-doom" class="login-form modal-form" autocomplete="off" method="post">
                    <input type="password" style="display:none">
                    <div class="form-group form-md-line-input">
                        <input name="email" type="email" class="form-control focusme" id="form_control_1">
                        <label for="form_control_1">Email</label><%--
                        <span class="help-block">Vložte validní email např. karel@seznam.cz</span>--%>
                    </div>
                    <div class="form-group form-md-line-input">
                        <input  name="password" type="password" class="form-control" id="form_control_3">
                        <label for="form_control_3">Heslo</label><%--
                        <span class="help-block">min. 5 znaků</span>--%>
                    </div>
                    <button type="submit" style="display:none;">Submit</button>
                </form>
            </div>
            <div class="modal-ba-footer-notop" >
                <div class="spacer-sm"></div>
                <button data-txt="Search" class="btn" data-dismiss="modal" style="margin:0 10px;">Zavřít</button>
                <button class="submit-login btn btn-black" style="margin:0 10px;">Přihlásit se</button>
                <a class="modal-below-btns" href="#" data-toggle="modal" data-target="#modal-1" data-dismiss="modal">Nemáte účet? Nevadí, zaregistrujte se.</a>
                <a class="modal-below-btns" href="#" data-toggle="modal" data-target="#modal-3" data-dismiss="modal">Ani zapomenuté heslo není problém, obnovte si jej kliknutím sem.</a>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
