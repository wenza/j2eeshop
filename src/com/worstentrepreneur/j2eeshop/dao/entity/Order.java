package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "customer_order")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Order extends AbstractIdentity {
    private String reference;
    @OneToMany(mappedBy = "order")
    private Set<OrderToProduct> products;
    //private Set<OrderTaxNamePriceTuple> productsPriceWithTax;
    @ManyToOne
    private Customer customer;
    @ManyToOne
    private Currency currency;
    @ManyToOne
    private Shipping shipping;
    @ManyToOne
    private Payment payment;

    //@Column(name = "address_delivery")
    @JsonProperty(value = "address_delivery")
    @ManyToOne
    private Address addressDelivery;
    //@Column(name = "address_invoice")
    @JsonProperty(value = "address_invoice")
    @ManyToOne
    private Address addressInvoice;
    //@Column(name = "current_state")
    @JsonProperty(value = "current_state")
    @ManyToOne
    private OrderState currentState;


    /*********** TAX INCLUDED ***********/
    @Column(name = "shipping_tax_excl")
    @JsonProperty(value = "shipping_tax_excl")
    private BigDecimal shippingTaxExcl;

    @Column(name = "payment_tax_excl")
    @JsonProperty(value = "payment_tax_excl")
    private BigDecimal paymentTaxExcl;

    @Column(name = "order_tax_excl")
    @JsonProperty(value = "order_tax_excl")
    private BigDecimal orderTaxExcl;

    /*********** TAX EXCLUDED ***********/
    @Column(name = "shipping_tax_incl")
    @JsonProperty(value = "shipping_tax_incl")
    private BigDecimal shippingTaxIncl;

    @Column(name = "payment_tax_incl")
    @JsonProperty(value = "payment_tax_incl")
    private BigDecimal paymentTaxIncl;

    @Column(name = "order_tax_incl")
    @JsonProperty(value = "order_tax_incl")
    private BigDecimal orderTaxIncl;

    //====================================ADDITIONAL DESC=============================/


    @Column(name = "tracking_code")
    @JsonProperty(value = "tracking_code")
    private String trackingCode;

    @Column(name = "invoice_number")
    @JsonProperty(value = "invoice_number")
    private int invoiceNumber;

    @Column(name = "delivery_number")
    @JsonProperty(value = "delivery_number")
    private int deliveryNumber;//delivery document number

    @Column(name = "date_add")
    @JsonProperty(value = "date_add")
    private Timestamp dateAdd;
    @Column(name = "date_upd")
    @JsonProperty(value = "date_upd")
    private Timestamp dateUpd;

    //===========================================TBD==================================/

    /*

    @Column(name = "conversion_rate")
    @JsonProperty(value = "conversion_rate")
    private BigDecimal conversionRate;

    @Column(name = "total_discounts")
    @JsonProperty(value = "total_discounts")
    private BigDecimal totalDiscounts;
    @Column(name = "total_discounts_tax_incl")
    @JsonProperty(value = "total_discounts_tax_incl")
    private BigDecimal totalDiscountsTaxIncl;
    @Column(name = "total_discounts_tax_excl")
    @JsonProperty(value = "total_discounts_tax_excl")
    private BigDecimal totalDiscountsTaxExcl;
    @Column(name = "total_paid")
    @JsonProperty(value = "total_paid")
    private BigDecimal totalPaid;
    @Column(name = "total_paid_tax_incl")
    @JsonProperty(value = "total_paid_tax_incl")
    private BigDecimal totalPaidTaxIncl;
    @Column(name = "total_paid_tax_excl")
    @JsonProperty(value = "total_paid_tax_excl")
    private BigDecimal totalPaidTaxExcl;
    @Column(name = "total_paid_real")
    @JsonProperty(value = "total_paid_real")
    private BigDecimal totalPaidReal;
    @Column(name = "total_products")
    @JsonProperty(value = "total_products")

    private BigDecimal totalProductsPrice;
    @Column(name = "total_shipping")
    @JsonProperty(value = "total_shipping")
    private BigDecimal totalShipping;
    @Column(name = "total_shipping_tax_incl")
    @JsonProperty(value = "total_shipping_tax_incl")
    private BigDecimal totalShippingTaxIncl;
    @Column(name = "total_shipping_tax_excl")
    @JsonProperty(value = "total_shipping_tax_excl")
    private BigDecimal totalShippingTaxExcl;
    @Column(name = "carrier_tax_rate")
    @JsonProperty(value = "carrier_tax_rate")
    private BigDecimal carrierTaxRate;
    @Column(name = "total_wrapping")
    @JsonProperty(value = "total_wrapping")
    private BigDecimal totalWrapping;
    @Column(name = "total_wrapping_tax_incl")
    @JsonProperty(value = "total_wrapping_tax_incl")
    private BigDecimal totalWrappingTaxIncl;
    @Column(name = "total_wrapping_tax_excl")
    @JsonProperty(value = "total_wrapping_tax_excl")
    private BigDecimal totalWrappingTaxExcl;

    @Column(name = "invoice_date")
    @JsonProperty(value = "invoice_date")
    private Timestamp invoiceDate;
    @Column(name = "delivery_date")
    @JsonProperty(value = "delivery_date")
    private Timestamp deliveryDate;
    private int valid;*/

    //private int idShopGroup;
    //private int idShop;
    //TODO:private int idCarrier;
    //private int idCart;
    //private String secureKey;
    //private String module;
    //private String giftMessage;
    //TODO:private BigDecimal totalProductsWt;


    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public Set<OrderToProduct> getProducts(JPAUtil jpa) {
        products= new HashSet<>(jpa.selectOrderProducts(this));
        return products;
    }

    public void setProducts(Set<OrderToProduct> products) {
        this.products = products;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Currency getCurrency() {
        return currency;
    }

    public void setCurrency(Currency currency) {
        this.currency = currency;
    }

    public Shipping getShipping() {
        return shipping;
    }

    public void setShipping(Shipping shipping) {
        this.shipping = shipping;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public Address getAddressDelivery() {
        return addressDelivery;
    }

    public void setAddressDelivery(Address addressDelivery) {
        this.addressDelivery = addressDelivery;
    }

    public Address getAddressInvoice() {
        return addressInvoice;
    }

    public void setAddressInvoice(Address addressInvoice) {
        this.addressInvoice = addressInvoice;
    }

    public OrderState getCurrentState() {
        return currentState;
    }

    public void setCurrentState(OrderState currentState) {
        this.currentState = currentState;
    }

    public BigDecimal getShippingTaxExcl() {
        return shippingTaxExcl;
    }

    public void setShippingTaxExcl(BigDecimal shippingTaxExcl) {
        this.shippingTaxExcl = shippingTaxExcl;
    }

    public BigDecimal getPaymentTaxExcl() {
        return paymentTaxExcl;
    }

    public void setPaymentTaxExcl(BigDecimal paymentTaxExcl) {
        this.paymentTaxExcl = paymentTaxExcl;
    }

    public BigDecimal getOrderTaxExcl() {
        return orderTaxExcl;
    }

    public void setOrderTaxExcl(BigDecimal orderTaxExcl) {
        this.orderTaxExcl = orderTaxExcl;
    }

    public BigDecimal getShippingTaxIncl() {
        return shippingTaxIncl;
    }

    public void setShippingTaxIncl(BigDecimal shippingTaxIncl) {
        this.shippingTaxIncl = shippingTaxIncl;
    }

    public BigDecimal getPaymentTaxIncl() {
        return paymentTaxIncl;
    }

    public void setPaymentTaxIncl(BigDecimal paymentTaxIncl) {
        this.paymentTaxIncl = paymentTaxIncl;
    }

    public BigDecimal getOrderTaxIncl() {
        return orderTaxIncl;
    }

    public void setOrderTaxIncl(BigDecimal orderTaxIncl) {
        this.orderTaxIncl = orderTaxIncl;
    }

    public String getTrackingCode() {
        return trackingCode;
    }

    public void setTrackingCode(String trackingCode) {
        this.trackingCode = trackingCode;
    }

    public int getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(int invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    public int getDeliveryNumber() {
        return deliveryNumber;
    }

    public void setDeliveryNumber(int deliveryNumber) {
        this.deliveryNumber = deliveryNumber;
    }

    public Timestamp getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(Timestamp dateAdd) {
        this.dateAdd = dateAdd;
    }

    public Timestamp getDateUpd() {
        return dateUpd;
    }

    public void setDateUpd(Timestamp dateUpd) {
        this.dateUpd = dateUpd;
    }
}
