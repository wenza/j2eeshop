package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "tax")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Tax extends AbstractIdentity {
    private BigDecimal rate;
    private boolean active;
    private boolean deleted;
    @OneToMany(mappedBy = "tax")
    private Set<TaxLang> langs;
    public Set<TaxLang> getLangs(JPAUtil jpa) {
        //TODO:
        langs=new HashSet<>(jpa.selectTaxLangs(this));
        //}
        return langs;
    }

    public TaxLang getLang(Language reqLang, JPAUtil jpa){
        for(TaxLang lang : getLangs(jpa)){
            if(lang.getLang().getIsoCode().equals(reqLang.getIsoCode())){
                return lang;
            }
        }
        return null;
    }


    //====================================ADDITIONAL DESC=============================/

    //===========================================TBD==================================/


    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
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

    public Set<TaxLang> getLangs() {
        return langs;
    }

    public void setLangs(Set<TaxLang> langs) {
        this.langs = langs;
    }
}
