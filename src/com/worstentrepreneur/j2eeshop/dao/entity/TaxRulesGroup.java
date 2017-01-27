package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.sql.Timestamp;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "tax_rules_group")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class TaxRulesGroup extends AbstractIdentity {
    private String name;
    private int active;
    private boolean deleted;


    //====================================ADDITIONAL DESC=============================/
    @Column(name = "date_add")
    @JsonProperty(value = "date_add")
    private Timestamp dateAdd;
    @Column(name = "date_upd")
    @JsonProperty(value = "date_upd")
    private Timestamp dateUpd;

    //===========================================TBD==================================/


}
