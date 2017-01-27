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
@Table(name = "product_lang")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class ProductLang extends AbstractIdentity {
    @ManyToOne
    private Product product;
    @ManyToOne
    private Language lang;
    private String description;
    @Column(name = "description_short")
    @JsonProperty(value = "description_short")
    private String descriptionShort;
    //TODO:private String linkRewrite;
    @Column(name = "meta_description")
    @JsonProperty(value = "meta_description")
    private String metaDescription;
    @Column(name = "meta_keywords")
    @JsonProperty(value = "meta_keywords")
    private String metaKeywords;
    @Column(name = "meta_title")
    @JsonProperty(value = "meta_title")
    private String metaTitle;
    private String name;
    //TODO:private String availableNow;
    //TODO:private String availableLater;


    //====================================ADDITIONAL DESC=============================/

    //===========================================TBD==================================/


}
