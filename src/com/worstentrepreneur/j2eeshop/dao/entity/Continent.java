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
@Table(name = "continent")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Continent extends AbstractIdentity {
    private boolean active;
    @OneToMany(mappedBy = "continent")
    private Set<ContinentLang> langs;
    @OneToMany(mappedBy = "continent")
    private Set<Country> countries;


    //====================================ADDITIONAL DESC=============================/

    //===========================================TBD==================================/
    //TODO:private int idZone;


    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }


    public Set<ContinentLang> getLangs(JPAUtil jpa) {
        //TODO:
        List<ContinentLang> list = jpa.selectEntityLang(this);
        langs = new HashSet<>( list )  ;
        return langs;
    }

    public ContinentLang getLang(Language reqLang, JPAUtil jpa){
        for(ContinentLang lang : getLangs(jpa)){
            if(lang.getLang().getIsoCode().equals(reqLang.getIsoCode())){
                return lang;
            }
        }
        return null;
    }

    public void setLangs(Set<ContinentLang> langs) {
        this.langs = langs;
    }

    public Set<Country> getCountries() {
        return countries;
    }

    public void setCountries(Set<Country> countries) {
        this.countries = countries;
    }
}
