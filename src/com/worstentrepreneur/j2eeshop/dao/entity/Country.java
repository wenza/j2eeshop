package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "country")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Country extends AbstractIdentity {
    @ManyToOne
    private Currency currency;
    private boolean active;
    @OneToMany(mappedBy = "country")
    private Set<CountryLang> langs;


    //====================================ADDITIONAL DESC=============================/
    @Column(name = "iso_code")
    @JsonProperty(value = "iso_code")
    private String isoCode;
    @Column(name = "call_prefix")
    @JsonProperty(value = "call_prefix")
    private int callPrefix;
    @Column(name = "contains_states")
    @JsonProperty(value = "contains_states")
    private boolean containsStates;
    //@Column(name = "need_identification_number")
    //TODO:@JsonProperty(value = "need_identification_number")
    //private boolean needIdentificationNumber;
    //@Column(name = "need_zip_code")
    //@JsonProperty(value = "need_zip_code")
    //private boolean needZipCode;
    @Column(name = "zip_code_format")
    @JsonProperty(value = "zip_code_format")
    private String zipCodeFormat;
    //@Column(name = "display_tax_label")
    //@JsonProperty(value = "display_tax_label")
    //private boolean displayTaxLabel;

    //===========================================TBD==================================/
    //TODO:private int idZone;


    public Currency getCurrency() {
        return currency;
    }

    public void setCurrency(Currency currency) {
        this.currency = currency;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }


    public Set<CountryLang> getLangs(JPAUtil jpa) {
        //TODO:
        List<CountryLang> list = jpa.selectEntityLang(this);
        langs = new HashSet<>( list )  ;
        return langs;
    }

    public CountryLang getLang(Language reqLang, JPAUtil jpa){
        for(CountryLang lang : getLangs(jpa)){
            if(lang.getLang().getIsoCode().equals(reqLang.getIsoCode())){
                return lang;
            }
        }
        return null;
    }

    public void setLangs(Set<CountryLang> langs) {
        this.langs = langs;
    }

    public String getIsoCode() {
        return isoCode;
    }

    public void setIsoCode(String isoCode) {
        this.isoCode = isoCode;
    }

    public int getCallPrefix() {
        return callPrefix;
    }

    public void setCallPrefix(int callPrefix) {
        this.callPrefix = callPrefix;
    }

    public boolean isContainsStates() {
        return containsStates;
    }

    public void setContainsStates(boolean containsStates) {
        this.containsStates = containsStates;
    }

    public String getZipCodeFormat() {
        return zipCodeFormat;
    }

    public void setZipCodeFormat(String zipCodeFormat) {
        this.zipCodeFormat = zipCodeFormat;
    }
}
