package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "language")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Language  extends AbstractIdentity {
    private String name;
    private boolean active;


    //====================================ADDITIONAL DESC=============================/
    @Column(name = "iso_code")
    @JsonProperty(value = "iso_code")
    private String isoCode;
    @Column(name = "language_code")
    @JsonProperty(value = "language_code")
    private String languageCode;
    @Column(name = "date_format_lite")
    @JsonProperty(value = "date_format_lite")
    private String dateFormatLite;
    @Column(name = "date_format_full")
    @JsonProperty(value = "date_format_full")
    private String dateFormatFull;

    //===========================================TBD==================================/


}
