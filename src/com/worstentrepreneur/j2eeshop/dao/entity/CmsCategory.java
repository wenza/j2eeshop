package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "cms_category")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class CmsCategory extends AbstractIdentity {
    @OneToMany(mappedBy = "cmsCategory")
    private Set<CmsCategoryLang> langs;
    @OneToMany(mappedBy = "category")
    private Set<Cms> cms;
    private String module;
    @Column(name = "date_add")
    @JsonProperty(value = "date_add")
    private Date dateAdd;
    @Column(name = "date_upd")
    @JsonProperty(value = "date_upd")
    private Date dateUpd;
    @JsonProperty(value = "img_url")
    private String imageURL;
    boolean active;
    int position;

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public Set<CmsCategoryLang> getLangs(JPAUtil jpa) {
        //TODO:
        List<CmsCategoryLang> list = jpa.selectEntityLang(this);
        langs = new HashSet<>(list);
        return langs;
    }

    public Set<Cms> getCms(JPAUtil jpa) {
        List<Cms> list = jpa.selectCmsCategoryCmss(this);
        cms=new HashSet<>(list);
        return cms;
    }



    public CmsCategoryLang getLang(Language reqLang, JPAUtil jpa){
        for(CmsCategoryLang lang : getLangs(jpa)){
            if(lang.getLang().getIsoCode().equals(reqLang.getIsoCode())){
                return lang;
            }
        }
        return null;
    }

    public void setLangs(Set<CmsCategoryLang> langs) {
        this.langs = langs;
    }

    public void setCms(Set<Cms> cms) {
        this.cms = cms;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }


    public Date getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(Date dateAdd) {
        this.dateAdd = dateAdd;
    }

    public Date getDateUpd() {
        return dateUpd;
    }

    public void setDateUpd(Date dateUpd) {
        this.dateUpd = dateUpd;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
