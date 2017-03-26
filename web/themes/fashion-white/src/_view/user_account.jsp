<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.Format" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/22/17
  Time: 2:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
    Customer c = null;
    if(sh.customer!=null)c=sh.jpa.selectByID(Customer.class,sh.customer.getId());
%>

<div class="container-fluid row page-headline">
    <h1>Můj účet</h1>
    <p>Vítejte ve vašem účtu. Zde můžete spravovat všechny vaše informace a objednávky.</p>
</div>
<div class="container">
    <div class="row page-content">
        <div class="col-md-4">
            <h2>Moje objednávky</h2>
            <%--<p class="sm">Kliknutím na jednu z posledních 10 objednávek si můžete zobrazit její detail</p>--%>
            <ul class="lg">
                <%
                for(Order o : sh.jpa.selectCustomerOrders(c)){
                    OrderState state = o.getCurrentState();
                    OrderStateLang stateLang = state.getLang(sh.getLang(),sh.jpa);
                    String inflection = "ek";
                    int productCount = 0;
                    for(OrderToProduct o2p : o.getProducts(sh.jpa)){
                        productCount+=o2p.getQuantity();
                    }
                    if(productCount==1)inflection="ka";
                    if(productCount>=2 && productCount<=4)inflection="ky";
                %>
                    <li><a><span class="tag tag-pink" style="background:<%=state.getColor()%>"><%=stateLang.getName()%></span>
                        <%=Format.date(o.getDateAdd())%> |
                        <%=productCount%> Polož<%=inflection%> |
                        <%=Format.number(o.getOrderTaxIncl())%>
                        <%=o.getCurrency().getSign()%>
                    </a></li>
                <%--<li><a><span class="tag tag-orange">Zpracovává se</span> 12.2.2017 | 3 Položky | 2 032,- </a></li>
                <li><a><span class="tag tag-red">Zrušeno</span> 11.2.2017 | 3 Položky | 2 000,- </a></li>
                <li><a><span class="tag tag-green">Odesláno</span> 10.2.2017 | 7 Položek | 18 322,- </a></li>--%>
                <%
                }
                %>
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Moje adresy</h2>
            <%--<p class="sm">Kliknutím na adresu můžete danou adresu upravit, anebo vložit novou na konci seznamu vašich adres.</p>--%>
            <ul class="lg">
                <%

                for(Order o : sh.jpa.selectCustomerOrders(c)){
                    Address a1 = o.getAddressDelivery();
                    Address a2 = o.getAddressInvoice();
                    if(a1!=null){
                        %>
                        <li><a><%=a1.getAddress1()%>, <%=a1.getPostcode()%>, <%=a1.getCountry().getLang(sh.getLang(),sh.jpa).getName()%></a></li>
                        <%
                    }
                    if(a2!=null){
                        %><li><a><%=a2.getAddress1()%>, <%=a2.getPostcode()%>, <%=a2.getCountry().getLang(sh.getLang(),sh.jpa).getName()%></a></li><%
                    }
                }
                %>
            </ul>
        </div>
        <%--<div class="col-md-4">
            <h2>Nastavení</h2>
            <a class="btn">Změna přístupových údajů</a>
        </div>--%>
    </div>

</div>
<hr>
<jsp:include page="../_main/newsletter.jsp"/>