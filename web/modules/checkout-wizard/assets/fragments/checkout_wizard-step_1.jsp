<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.OrderToProduct" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ProductImage" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ProductLang" %>
<%@ page import="com.worstentrepreneur.utils.Format" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Product" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/23/17
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
    Set<OrderToProduct> orderToProducts = sh.order.getProducts(sh.jpa);
%>
<div>
    <div class="col-md-12 ">
        <div>
            <h2 style="display:inline-block;">Nákupní koš</h2>
            <span>
                Zde máte možnost měnit počty položek
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
            if(orderToProducts.size()==0){
                %><tr><th colspan="5">Váš košík je prázdný, pro pokračování je třeba aby obsahoval alespoň jednu položku.</th></tr><%
            }
            BigDecimal sum = BigDecimal.ZERO;
            for(OrderToProduct o2p : orderToProducts){
                ProductLang lang = o2p.getProduct().getLang(sh.userLang,sh.jpa);
                String coverImg = "";
                List<ProductImage> productImages = sh.jpa.selectProductImages(o2p.getProduct());
                for(ProductImage pi : productImages){
                    if(pi.isCover())coverImg=pi.getImageURL();
                }
                sum = sum.add( (new BigDecimal(o2p.getQuantity()).multiply(o2p.getProduct().getPrice())) );
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
            <%--<tr>
                <td colspan="2" class="border-top">Česká pošta</td>
                <td colspan="2" class="border-top" style="text-align:left;">Poštovné (vč. DPH):</td>
                <td  class="border-top">120,-</td>
            </tr>
            <tr>
                <td colspan="2" class="no-border">Dobírka</td>
                <td colspan="2" class="border-top" style="text-align:left;">Platební metoda (vč. DPH):</td>
                <td  class="border-top">0,-</td>
            </tr>--%>
            <%
            if(orderToProducts.size()>0){
                %>
                <tr>
                    <td colspan="2" class="no-border"></td>
                    <td colspan="2" class="border-top" style="text-align:left;">Mezisoučet (vč. DPH):</td>
                    <td  class="border-top"><strong><%=Format.number(sum)%><%=sh.getCurr().getSign()%></strong></td>
                </tr>
                <%
            }
            %>

        </table>
    </div>
</div>