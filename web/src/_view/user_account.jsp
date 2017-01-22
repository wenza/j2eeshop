<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 2:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid row page-headline">
    <h1>Můj účet</h1>
    <p>Vítejte ve vašem účtu. Zde můžete spravovat všechny vaše informace a objednávky.</p>
</div>
<div class="container">
    <div class="row page-content">
        <div class="col-md-4">
            <h2>Moje objednávky</h2>
            <p class="sm">Kliknutím na jednu z posledních 10 objednávek si můžete zobrazit její detail</p>
            <ul class="lg">
                <li><a><span class="tag tag-pink">Očekává platbu</span> 15.2.2017 | 1 Položka | 1 002,- </a></li>
                <li><a><span class="tag tag-orange">Zpracovává se</span> 12.2.2017 | 3 Položky | 2 032,- </a></li>
                <li><a><span class="tag tag-red">Zrušeno</span> 11.2.2017 | 3 Položky | 2 000,- </a></li>
                <li><a><span class="tag tag-green">Odesláno</span> 10.2.2017 | 7 Položek | 18 322,- </a></li>
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Moje adresy</h2>
            <p class="sm">Kliknutím na adresu můžete danou adresu upravit, anebo vložit novou na konci seznamu vašich adres.</p>
            <ul class="lg">
                <li><a>Na Maninách 7, 170 00, Česká Republika</a></li>
                <li><a>Tusarova 1285/3, 170 00, Česká Republika</a></li>
                <li><a class="btn">Vložit novou</a></li>
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Nastavení</h2>
            <a class="btn">Změna přístupových údajů</a>
        </div>
    </div>

</div>

<jsp:include page="../_main/newsletter.jsp"/>