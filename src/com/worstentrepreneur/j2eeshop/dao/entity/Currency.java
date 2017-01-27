package com.worstentrepreneur.j2eeshop.dao.entity;


import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "currency")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Currency extends AbstractIdentity {
    private String name;
    private String sign;
    private boolean blank;
    private boolean format;
    private boolean decimals;
    private boolean deleted;
    private boolean active;


    //====================================ADDITIONAL DESC=============================/
    @Column(name = "iso_code")
    @JsonProperty(value = "iso_code")
    private String isoCode;
    @Column(name = "iso_code_num")
    @JsonProperty(value = "iso_code_num")
    private String isoCodeNum;
    @Column(name = "conversion_rate")
    @JsonProperty(value = "conversion_rate")
    private BigDecimal conversionRate;

    //===========================================TBD==================================/


}
