package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.*;
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
    private Set<CountryLang> lang;


    //====================================ADDITIONAL DESC=============================/
    @Column(name = "iso_code")
    @JsonProperty(value = "iso_code")
    private String isoCode;
    @Column(name = "call_prefix")
    @JsonProperty(value = "call_prefix")
    private int callPrefix;
    @Column(name = "contain_states")
    @JsonProperty(value = "contain_states")
    private boolean containsStates;
    @Column(name = "need_identification_number")
    @JsonProperty(value = "need_identification_number")
    private boolean needIdentificationNumber;
    @Column(name = "need_zip_code")
    @JsonProperty(value = "need_zip_code")
    private boolean needZipCode;
    @Column(name = "zip_code_format")
    @JsonProperty(value = "zip_code_format")
    private String zipCodeFormat;
    @Column(name = "display_tax_label")
    @JsonProperty(value = "display_tax_label")
    private boolean displayTaxLabel;

    //===========================================TBD==================================/
    //TODO:private int idZone;


}
