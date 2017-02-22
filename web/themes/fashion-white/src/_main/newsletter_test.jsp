<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/17/17
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section class="full-width-content" style="padding:10px 0;">
    <div class="container-fluid">
        <div class="col-md-12" style="text-align:center;">
            <%--<form>
                <label style="width:400px;display:inline-block;margin-top:10px;font-weight:300;">Přihlaste se k odběru novinek a mějte vždy čerstvé informace</label>
                <div style="width:300px;vertical-align: bottom;display:inline-block">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Vložte email">
                        <span class="input-group-btn">
                        <button class="btn" type="button"> Potvrdit </button>
                    </span>
                    </div>
                </div>
            </form>--%>
                <div class="wapper" style="display: inline-block;">
                    <div class="description" style="float: left;
    color: #000;
    text-align: left;
    margin-right: 25px !important;
    line-height: 20px;">
                        <span class="title" style="float: left;color: #000;text-align: left;margin-right: 25px !important;line-height: 20px;font-size: 18px;font-weight: 100;text-transform: uppercase;
">Odběr novinek</span>
                        <br>
                        <p style="margin:0;">Zaregistrujte se k odběru novinek</p>
                    </div>
                    <div class="input-form" style="float: left;margin-right: 10px;max-width:420px;">
                        <div class="input-group" style="margin-top:5px;">
                            <input type="text" class="form-control" placeholder="Vložte email" size="18">
                            <span class="input-group-btn">
                                <button class="btn" type="button"> Potvrdit </button>
                            </span>
                        </div>
                    </div>
                    <input type="hidden" name="action" value="0">

                </div>
        </div>
    </div>
</section>