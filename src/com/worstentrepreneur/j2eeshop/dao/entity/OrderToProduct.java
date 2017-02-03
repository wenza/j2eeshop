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
    private Product product;
    private int quantity;
    @Column(name = "price_tax_excl")
    private BigDecimal priceTaxExcl;
    @Column(name = "price_tax_incl")
    private BigDecimal priceTaxIncl;
    /*@Column(name="tax_rate")
    private BigDecimal taxRate;
    private String name;
    @Column(name="tax_rate")
    private BigDecimal taxRate;
    @Column(name="add_data")
    private String addData*/;
}
