package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Timestamp;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "customer_order_to_product")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class OrderToProduct extends AbstractIdentity {
    @ManyToOne
    private Order order;
    @ManyToOne
    @JsonProperty
    private Product product;

    @JsonProperty
    private int quantity;
    @Column(name = "price_tax_excl")
    @JsonProperty
    private BigDecimal priceTaxExcl;
    @Column(name = "price_tax_incl")
    @JsonProperty
    private BigDecimal priceTaxIncl;
    /*@Column(name="tax_rate")
    private BigDecimal taxRate;
    private String name;
    @Column(name="tax_rate")
    private BigDecimal taxRate;
    @Column(name="add_data")
    private String addData*/;

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        this.recalculate();
    }

    public BigDecimal getPriceTaxExcl() {
        return priceTaxExcl;
    }

    public void setPriceTaxExcl(BigDecimal priceTaxExcl) {
        this.priceTaxExcl = priceTaxExcl;
    }

    public BigDecimal getPriceTaxIncl() {
        return priceTaxIncl;
    }

    public void setPriceTaxIncl(BigDecimal priceTaxIncl) {
        this.priceTaxIncl = priceTaxIncl;
    }

    public void recalculate(){
        //Product product = sh.jpa.selectByID(Product.class,productID);//1.21
        BigDecimal taxRate100 = product.getTax().getRate().divide(new BigDecimal(100), 6, RoundingMode.HALF_UP);
        BigDecimal divider = new BigDecimal(1).add(taxRate100);
        priceTaxExcl = (product.getPrice().divide(divider, 6, RoundingMode.HALF_UP)).multiply(new BigDecimal(quantity));
        priceTaxIncl = product.getPrice().multiply(new BigDecimal(quantity));
    }
}
