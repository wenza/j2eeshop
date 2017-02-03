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
@Table(name = "tax_rules_TODO")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class TaxRules_TODO extends AbstractIdentity {
    @ManyToOne
    private TaxRulesGroup_TODO taxRulesGroup;
    @ManyToOne
    private Country country;
    @ManyToOne
    private Tax tax;
    private int behavior;
    private String description;


    //====================================ADDITIONAL DESC=============================/
    @Column(name = "zipcode_from")
    @JsonProperty(value = "zipcode_from")
    private String zipcodeFrom;
    @Column(name = "zipcode_to")
    @JsonProperty(value = "zipcode_to")
    private String zipcodeTo;

    //===========================================TBD==================================/
    //TODO:private int idState;


}
