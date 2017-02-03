package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "client_order")
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


    @Column(name = "shipping_number")
    @JsonProperty(value = "shipping_number")
    private String shippingNumber;

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

}
