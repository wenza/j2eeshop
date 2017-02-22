package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "shipping_price_limit")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class ShippingPriceLimit extends AbstractIdentity {
    @ManyToOne
    private Shipping shipping;
    private BigDecimal fromWeight;
    private BigDecimal toWeight;
    private boolean active;

    @OneToMany(mappedBy = "shippingPriceLimit")
    private Set<ShippingPriceLimitCountries> countries;

    public Shipping getShipping() {
        return shipping;
    }

    public void setShipping(Shipping shipping) {
        this.shipping = shipping;
    }

    public BigDecimal getFromWeight() {
        return fromWeight;
    }

    public void setFromWeight(BigDecimal fromWeight) {
        this.fromWeight = fromWeight;
    }

    public BigDecimal getToWeight() {
        return toWeight;
    }

    public void setToWeight(BigDecimal toWeight) {
        this.toWeight = toWeight;
    }

    public Set<ShippingPriceLimitCountries> getCountries() {
        return countries;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public void setCountries(Set<ShippingPriceLimitCountries> countries) {
        this.countries = countries;
    }
}
