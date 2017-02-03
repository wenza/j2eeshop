package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "payment")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Payment extends AbstractIdentity {
    @ManyToOne
    private Shipping shipping;
    private BigDecimal price;
    private boolean active;
    private boolean deleted;
    @OneToMany(mappedBy = "payment")
    private Set<PaymentLang> langs;
    @Column(name="free_from_price_with_tax")
    private BigDecimal freeFromPriceWithTAX;
    /*@OneToMany
    @JoinColumn(name="shipping_country_id")*/
    /*@ManyToMany
    @JoinTable(
            name="payment_to_country",
            joinColumns=@JoinColumn(name="payment_id", referencedColumnName="id"),
            inverseJoinColumns=@JoinColumn(name="country_id", referencedColumnName="id"))
    private Set<Country> paymentToCountries;*/



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

    public Set<PaymentLang> getLangs(JPAUtil jpa) {
        //TODO:
        List<PaymentLang> list = jpa.selectEntityLang(this);
        langs = new HashSet<>( list )  ;
        return langs;
    }

    public PaymentLang getLang(Language reqLang, JPAUtil jpa){
        for(PaymentLang lang : getLangs(jpa)){
            if(lang.getLang().getIsoCode().equals(reqLang.getIsoCode())){
                return lang;
            }
        }
        return null;
    }

    public void setLangs(Set<PaymentLang> langs) {
        this.langs = langs;
    }

    public BigDecimal getFreeFromPriceWithTAX() {
        return freeFromPriceWithTAX;
    }

    public void setFreeFromPriceWithTAX(BigDecimal freeFromPriceWithTAX) {
        this.freeFromPriceWithTAX = freeFromPriceWithTAX;
    }

}
