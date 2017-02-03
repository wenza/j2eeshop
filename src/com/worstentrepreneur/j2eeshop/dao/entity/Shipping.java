package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "shipping")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Shipping extends AbstractIdentity {
    private BigDecimal price;
    private boolean active;
    private boolean deleted;
    @OneToMany(mappedBy = "shipping")
    private Set<ShippingLang> langs;
    @Column(name="free_from_price_with_tax")
    private BigDecimal freeFromPriceWithTAX;
    @OneToMany(mappedBy = "shipping")
    private Set<Payment> payments;
    @ManyToOne
    private Currency currency;
    /*@OneToMany
    @JoinColumn(name="shipping_country_id")*/
    @ManyToMany
    @JoinTable(
            name="shipping_to_country",
            joinColumns=@JoinColumn(name="shipping_id", referencedColumnName="id"),
            inverseJoinColumns=@JoinColumn(name="country_id", referencedColumnName="id"))
    private Set<Country> shippingToCountries;



    //====================================ADDITIONAL DESC=============================/

    //===========================================TBD==================================/


    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public Set<ShippingLang> getLangs(JPAUtil jpa) {
        //TODO:
        List<ShippingLang> list = jpa.selectEntityLang(this);
        langs = new HashSet<ShippingLang>( list )  ;
        return langs;
    }

    public ShippingLang getLang(Language reqLang, JPAUtil jpa){
        for(ShippingLang lang : getLangs(jpa)){
            if(lang.getLang().getIsoCode().equals(reqLang.getIsoCode())){
                return lang;
            }
        }
        return null;
    }

    public void setLangs(Set<ShippingLang> langs) {
        this.langs = langs;
    }

    public BigDecimal getFreeFromPriceWithTAX() {
        return freeFromPriceWithTAX;
    }

    public void setFreeFromPriceWithTAX(BigDecimal freeFromPriceWithTAX) {
        this.freeFromPriceWithTAX = freeFromPriceWithTAX;
    }

    public Set<Country> getShippingToCountries(JPAUtil jpa) {
        shippingToCountries = new HashSet<Country>( jpa.selectShippingCountries(this) );
        return shippingToCountries;
    }

    public void setShippingToCountries(Set<Country> shippingToCountries) {
        this.shippingToCountries = shippingToCountries;
    }

    public Set<Payment> getPayments(JPAUtil jpa) {
        payments = new HashSet<Payment>( jpa.selectShippingPayments(this) );
        return payments;
    }

    public Currency getCurrency() {
        return currency;
    }

    public void setCurrency(Currency currency) {
        this.currency = currency;
    }
}
