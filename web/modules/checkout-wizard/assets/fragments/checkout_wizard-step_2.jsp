<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/23/17
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
<div class="col-md-6">
    <div class="form-group form-md-line-input sm">
        <input type="text" class="form-control ta-l" name="" placeholder="JMÉNO*">
        <span class="help-block ta-l">JMÉNO*</span>
    </div>
    <label class="col-md-6">Email*</label>
    <div class="col-md-6">
        <input type="email" class="form-control" name="username"/>
        &lt;%&ndash;<span class="help-block"> Provide your username </span>&ndash;%&gt;
    </div>

    <label class="col-md-6">Heslo*</label>
    <div class="col-md-6">
        <input type="password" class="form-control" name="password"/>
    </div>
</div>
<div>
</div>--%>
<div class="col-md-6">
    <h1>Přejete si přihlásit se</h1>
    <p>A pokračovat v objednávce jako registrovaný uživatel a využívat výhod jako je rychlá objednávka za použití předvyplněné adresy po prvním nákupu a dalších výhod?</p>
    <a data-toggle="modal" data-target="#modal-2" href="#" class="btn btn-black">Přihlásit se</a>
</div>
<div class="col-md-6">
    <h1>Anebo pokračovat bez registrace</h1>
    <p>Neregistrovaný zákazník pro nás není sprosté slovo a tak Vám umožňujeme provést nákup i bez registrace ačkoliv k dokončení objednávky je třeba vyplnit vaši emailovou adresu k adrese.</p>
    <a href="?page=checkout&step=3" class="btn">Pokračovat bez registrace</a>
</div>