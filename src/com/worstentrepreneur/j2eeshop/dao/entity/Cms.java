package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "cms")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Cms extends AbstractIdentity {
    @ManyToOne
    private CmsCategory category;
    @OneToMany(mappedBy = "cms")
    private Set<CmsLang> langs;
    private int type;
    @Column(name = "date_add")
    @JsonProperty(value = "date_add")
    private Timestamp dateAdd;
    @Column(name = "date_upd")
    @JsonProperty(value = "date_upd")
    private Timestamp dateUpd;

    private boolean active;
    @JsonProperty(value = "img_url")
    private String imageURL;
    int position;

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public Set<CmsLang> getLangs(JPAUtil jpa) {
        //TODO:
        List<CmsLang> list = jpa.selectEntityLang(this);
        langs = new HashSet<CmsLang>( list )  ;
        return langs;
    }

    public CmsLang getLang(Language reqLang, JPAUtil jpa){
        for(CmsLang lang : getLangs(jpa)){
            if(lang.getLang().getIsoCode().equals(reqLang.getIsoCode())){
                return lang;
            }
        }
        return null;
    }

    public void setLangs(Set<CmsLang> langs) {
        this.langs = langs;
    }

    public CmsCategory getCategory() {
        return category;
    }

    public void setCategory(CmsCategory category) {
        this.category = category;
    }


    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Timestamp getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(Timestamp dateAdd) {
        this.dateAdd = dateAdd;
    }

    public Timestamp getDateUpd() {
        return dateUpd;
    }

    public void setDateUpd(Timestamp dateUpd) {
        this.dateUpd = dateUpd;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
