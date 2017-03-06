<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 12:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- LOGIN -->
<div class="modal fade focusmodal" id="modal-3" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-ba">
            <div class="modal-ba-header" style="padding-bottom:15px;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="clr-f-pink" style="text-align:center;">Obnova hesla</h3>
                <p>Obnovte si snadno účet zadáním Vaší emailové adresy na kterou vám přijde odkaz přes který si můžete změnit heslo k danému účtu.</p>
            </div>
            <div class="modal-body">
                <div class="reg-success" style="text-align:center;"></div>
                <div class="reg-error" style="color: #E84555;text-align: center;"></div>
                <form  action="destination.html" class="reg-form modal-form" autocomplete="off" method="post">
                    <input type="password" style="display:none">
                    <div class="form-group form-md-line-input">
                        <input name="email" type="email" class="form-control focusme" id="form_control_1">
                        <label for="form_control_1">Email</label>
                        <span class="help-block">Vložte validní email např. karel@seznam.cz</span>
                    </div>
                    <button type="submit" style="display:none;">Submit</button>
                </form>
            </div>
            <div class="spacer-sm"></div>
            <div class="modal-ba-footer-notop" >
                <button data-txt="Search" class="btn" data-dismiss="modal" style="margin:0 10px;">Zavřít</button>
                <button class="submit-registration btn btn-black" style="margin:0 10px;">Zaslat odkaz ke změně hesla</button>
                <a class="modal-below-btns" href="#" data-toggle="modal" data-target="#modal-2" data-dismiss="modal">Máte již účet? Přihlaste se</a>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>