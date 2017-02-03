package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.*;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "cms_lang")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class CmsLang extends AbstractIdentity {
    @ManyToOne
    private Cms cms;
    @ManyToOne
    private Language lang;
    private String name;
    @Column(columnDefinition="TEXT")
    private String content;



    //====================================ADDITIONAL DESC=============================/
    @Column(name = "meta_title")
    @JsonProperty(value = "meta_title")
    private String metaTitle;
    @Column(name = "meta_keywords")
    @JsonProperty(value = "meta_keywords")
    private String metaKeywords;
    @Column(name = "meta_description")
    @JsonProperty(value = "meta_description")
    private String metaDescription;

    //===========================================TBD==================================/


    public Cms getCms() {
        return cms;
    }

    public void setCms(Cms cms) {
        this.cms = cms;
    }

    public Language getLang() {
        return lang;
    }

    public void setLang(Language lang) {
        this.lang = lang;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
