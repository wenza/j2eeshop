<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="com.worstentrepreneur.j2eeshop.bean.AddressBean" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.utils.Format" %>
<%@ page import="java.math.BigDecimal" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/23/17
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
%>
<div>
    <div class="col-md-12 ">
        <div>
            <h2 style="display:inline-block;">Způsob dopravy</h2>
        </div>
    </div>
    <div class="col-md-12">
        <%
            Set<OrderToProduct> o2ps = sh.order.getProducts(sh.jpa);//sh.jpa.selectOrderProducts(sh.order);
            Shipping selShipping = null;
            for(Shipping shipping : sh.jpa.selectAllByID(Shipping.class)){
                ShippingPriceLimitCountries splc = sh.jpa.selectOrderShippingPriceLimitCountries(o2ps,shipping,sh.order.getAddressDelivery().getCountry());
                if(splc!=null){
                    ShippingLang lang = shipping.getLang(sh.getLang(),sh.jpa);
                    %>
                    <div class="md-radio circle" style="margin-top:18px;">
                        <input type="radio" id="shipping<%=shipping.getId()%>" name="shipping" value="<%=shipping.getId()%>" class="md-radio" <%=selShipping==null?"checked":""%>/>
                        <label for="shipping<%=shipping.getId()%>">
                            <span class="inc"></span>
                            <span class="check"></span>
                            <span class="box"></span> <%=lang.getName()%> <strong><%=Format.number(splc.getPrice())%><%=sh.userCurrency.getSign()%></strong>
                        </label>
                    </div>
                    <%
                    selShipping=shipping;
                }
            }
            if(selShipping==null){
                BigDecimal weight = BigDecimal.ZERO;
                for(OrderToProduct o2p : o2ps) {
                    weight = weight.add(o2p.getProduct().getWeight().multiply(new BigDecimal(o2p.getQuantity())));
                }
                %>
        <h3 style="display:inline-block;">Země "<%=sh.order.getAddressDelivery().getCountry().getLang(sh.getLang(),sh.jpa).getName()%>"  nemá ani jednu možnost dopravy pro balík o celkové váze <%=weight%>Kg
            , kontaktujte provozovatele eshopu o doplnění dopravce pro tento stát a váhovou kategorii.
        </h3>
        <%
            }
            %>
    </div>

    <div class="col-md-12 ">
        <div>
            <h2 style="display:inline-block;">Způsob platby</h2>
        </div>
    </div>
    <%
        for(Payment payment : sh.jpa.selectAllByID(Payment.class)){
            PaymentLang lang = payment.getLang(sh.getLang(),sh.jpa);
            boolean show = false;
            for(Country country : sh.jpa.selectPaymentCountries(payment)){
                if(country.getId()==sh.order.getAddressDelivery().getCountry().getId())show=true;
            }
            if(show){
                %>
                <div class="col-md-12 payments" id="payments-for-shipping<%=payment.getShipping().getId()%>" style="display:none;">
                    <div class="md-radio circle" style="margin-top:18px;">
                        <input type="radio" id="payment<%=payment.getId()%>" name="payment" value="<%=payment.getId()%>" class="md-radio default-payment" />
                        <label for="payment<%=payment.getId()%>">
                            <span class="inc"></span>
                            <span class="check"></span>
                            <span class="box"></span> <%=lang.getName()%> <strong><%=Format.number(payment.getPrice())%><%=sh.userCurrency.getSign()%></strong>
                        </label>
                    </div>
                </div>
                <%
            }else{
                %>
                <div class="col-md-12 payments" id="payments-for-shipping<%=payment.getShipping().getId()%>" style="display:none;">
                    <h3 style="display:inline-block;">Země "<%=sh.order.getAddressDelivery().getCountry().getLang(sh.getLang(),sh.jpa).getName()%>" nemá ani jednu možnost platby pro vybraný způsob dopravy
                        , kontaktujte provozovatele eshopu o doplnění tohoto státu do plateb pro tento způsob dopravy .
                    </h3>
                </div>
                <%
            }
        }
    %>
</div>

<script>
    var shipmentAndPaymentHref = null;
    function validateShippingAndPayment(){
        var nextBtn = $('.checkout-next');
        if(shipmentAndPaymentHref==null){
            shipmentAndPaymentHref=nextBtn.attr('href');
        }
        nextBtn.attr('disabled','');
        nextBtn.removeAttr('href');
        var selectedShipping = $("input[name='shipping']:checked");
        var pmtsID = '#payments-for-'+selectedShipping.attr('id');
        var pmts = $(pmtsID);
        var selectedPayment = pmts.find('input[name="payment"].default-payment:checked');
        if(selectedShipping.attr('name')===undefined || selectedPayment.attr('name')===undefined){
            console.log('shipping or payment is not chosen, please check for them');
        }else{
            nextBtn.removeAttr('disabled');
            nextBtn.attr('href',shipmentAndPaymentHref);
        }
    }
    function initShippingAndPayment(){
        $("input[name='payment']:checked").prop('checked',false);
        var selectedShipping = $("input[name='shipping']:checked");
        var pmtsID = '#payments-for-'+selectedShipping.attr('id');
        var pmts = $(pmtsID);
        $('.payments').hide();
        pmts.show();
        pmts.find('input[name="payment"].default-payment').prop('checked',true);//.attr('checked','');
        //console.log('found default pmt = '+pmts.find('input[name="payment"].default-payment').attr('id'));
        validateShippingAndPayment();
    }
    $("input[name='shipping']").change(function() {
        initShippingAndPayment();
    });
    $("input[name='payment']").change(function() {
        validateShippingAndPayment();
    });
    initShippingAndPayment();
</script>