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
        <div class="col-md-12 newsletter-block content" style="text-align:center;">
                <div class="wapper" style="display: inline-block;">
                    <div class="description">
                        <span class="title">Odběr novinek</span>
                        <br>
                        <p style="margin:0;">Zaregistrujte se k odběru novinek</p>
                    </div>
                    <form class="newsletter-form">
                        <div class="">
                            <div class="input-group" style="margin-top:5px;max-width:620px;">
                                <input type="text" class="form-control mail" placeholder="Vložte email" size="18">
                                <span class="input-group-btn">
                                    <button class="btn" type="submit"> Potvrdit </button>
                                </span>
                            </div>
                        </div>
                        <input type="submit" name="action" value="0" style="display:none;">
                    </form>

                </div>
            <div class="error-container"></div>
            <div class="success-container"></div>
        </div>
    </div>
</section>