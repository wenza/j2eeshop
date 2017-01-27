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
@Table(name = "category_lang")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class CategoryLang extends AbstractIdentity {
    @ManyToOne
    private Category category;
    //private int idShop;
    @ManyToOne
    private Language lang;
    private String name;
    private String description;

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
    //TODO:private String linkRewrite;


}
