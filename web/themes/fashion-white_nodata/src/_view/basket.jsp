<%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 2:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid row page-headline no-border">
    <h1>Obsah nákupního košíku</h1>
    <p>Váš nákupní košík obsahuje: 1 ks</p>
    <div class="container">
        <a href="?page=checkout&step=1" class="btn btn-pink pull-right">Přejít k objednávce</a>
    </div>
</div>
<div class="container">
    <div class="row page-content">
        <table class="table basket-table">
            <tr>
                <th colspan="2"> Produkt </th><th>Množství</th><th>Dostupnost</th><th>Cena</th><th></th>
            </tr>
        <%
            for(int i = 0;i<5;i++){
        %>
            <tr>
                <td width="150px">
                    <img src="http://www.lovelili.cz/img/x/661/0-crazy-race.jpg" width="150px"/>
                </td>
                <td>
                    <div>CRAZY RACE</div>
                    <div>Kód: 3220</div>

                </td>
                <td width="80px">
                    <input type="number" class="form-control" value="1"/>
                </td>
                <td width="120px">
                    <span class="tag tag-green">Skladem</span>

                </td>
                <td width="150px">3 900,-</td>
                <td width="32px">
                    <a><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
                </td>
            </tr>
        <%
            }
        %>
            <tr>
                <th colspan="3" > </th>
                <th >Celkem (vč. DPH):</th>
                <th >12 322,-</th>
                <th ></th>
            </tr>
        </table>
        <div class="col-md-12">
            <a href="?page=checkout&step=1" class="btn btn-black pull-right">Přejít k objednávce</a>
        </div>
    </div>
</div>
<hr>
<jsp:include page="../_main/newsletter.jsp"/>