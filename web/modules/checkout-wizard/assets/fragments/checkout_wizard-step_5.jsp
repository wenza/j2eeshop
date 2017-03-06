<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.utils.Format" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/23/17
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
//    Set<OrderToProduct> orderToProducts = sh.order.getProducts(sh.jpa);
    Order o = sh.order.recalculate(sh);
    sh.update(session);

    ShippingLang shippingLang = o.getShipping().getLang(sh.getLang(),sh.jpa);
    PaymentLang paymentLang = o.getPayment().getLang(sh.getLang(),sh.jpa);

    System.out.println("Order o");


%>
<div>
    <div class="col-md-12 ">
        <div>
            <h2 style="display:inline-block;">Rekapitulace objednávky</h2>
            <span>
                Tlačítkem "Potvrdit objednávku" závazně potvrzujete objednávku a souhlasíte s Reklamačním řádem a Smluvními podmínkamy tohoto e-shopu
            </span>
        </div>
    </div>
    <div class="spacer-sm"></div>
    <div class="col-md-12">
        <table class="table no-first-border">
            <%--<tr>
                <th colspan="2"> Produkt </th><th></th><th>Množství</th><th>Cena</th>
            </tr>--%>
                <%
                for(OrderToProduct o2p : o.getProducts()){
                    ProductLang lang = o2p.getProduct().getLang(sh.userLang,sh.jpa);
                    String coverImg = "";
                    List<ProductImage> productImages = sh.jpa.selectProductImages(o2p.getProduct());
                    for(ProductImage pi : productImages){
                        if(pi.isCover())coverImg=pi.getImageURL();
                    }
                    %>
                    <tr>
                        <td width="50px">
                            <img src="<%=coverImg%>" width="50px"/>
                        </td>
                        <td>
                            <div><%=lang.getName()%></div>
                            <div>Kód: <%=o2p.getProduct().getShopProductCode()%></div>

                        </td>
                        <td width="100px"></td>
                        <td width="80px">
                            <%=o2p.getQuantity()%>ks
                        </td>
                        <td width="80px"><%=Format.number(o2p.getPriceTaxIncl())%><%=sh.userCurrency.getSign()%></td>
                    </tr>
                    <%
                }

            %>
            <tr>
                <td colspan="2" class="border-top"><%=shippingLang.getName()%></td>
                <td colspan="2" class="border-top" style="text-align:left;">Poštovné (vč. DPH):</td>
                <td  class="border-top"><%=Format.number(o.getShippingTaxIncl())%><%=sh.userCurrency.getSign()%></td>
            </tr>
            <tr>
                <td colspan="2" class="no-border"><%=paymentLang.getName()%></td>
                <td colspan="2" class="border-top" style="text-align:left;">Platební metoda (vč. DPH):</td>
                <td  class="border-top"><%=Format.number(o.getPaymentTaxIncl())%><%=sh.userCurrency.getSign()%></td>
            </tr>
            <tr>
                <td colspan="2" class="no-border"></td>
                <td colspan="2" class="border-top" style="text-align:left;">Mezisoučet (vč. DPH):</td>
                <td  class="border-top"><strong><%=Format.number(o.getOrderTaxIncl())%><%=sh.userCurrency.getSign()%></strong></td>
            </tr>

        </table>
    </div>
</div>