package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "shipping_price_limit_countries")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class ShippingPriceLimitCountries extends AbstractIdentity {
    @ManyToOne
    private ShippingPriceLimit shippingPriceLimit;
    private BigDecimal price;
    @ManyToMany
    @JoinTable(
            name="shipping_price_limit_countries_to_country",
            joinColumns=@JoinColumn(name="price_limit_id", referencedColumnName="id"),
            inverseJoinColumns=@JoinColumn(name="country_id", referencedColumnName="id"))
    private Set<Country> countries;

    public ShippingPriceLimit getShippingPriceLimit() {
        return shippingPriceLimit;
    }

    public void setShippingPriceLimit(ShippingPriceLimit shippingPriceLimit) {
        this.shippingPriceLimit = shippingPriceLimit;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Set<Country> getCountries() {
        return countries;
    }

    public void setCountries(Set<Country> countries) {
        this.countries = countries;
    }
}
