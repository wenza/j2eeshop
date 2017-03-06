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
import java.math.RoundingMode;

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
    @JsonProperty
    private String sign;
    private boolean signPrefix;
    //private boolean format;
    private boolean decimals;
    //private boolean deleted;
    private boolean active;


    //====================================ADDITIONAL DESC=============================/
    @Column(name = "iso_code")
    @JsonProperty(value = "iso_code")
    private String isoCode;
    @Column(name = "iso_code_num")
    @JsonProperty(value = "iso_code_num")
    private String isoCodeNum;
    @Column(name = "conversion_rate",columnDefinition = "DECIMAL(13,6)")
    @JsonProperty(value = "conversion_rate")
    private BigDecimal conversionRate;

    //===========================================TBD==================================/


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public boolean isDecimals() {
        return decimals;
    }

    public void setDecimals(boolean decimals) {
        this.decimals = decimals;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getIsoCode() {
        return isoCode;
    }

    public void setIsoCode(String isoCode) {
        this.isoCode = isoCode;
    }

    public String getIsoCodeNum() {
        return isoCodeNum;
    }

    public void setIsoCodeNum(String isoCodeNum) {
        this.isoCodeNum = isoCodeNum;
    }

    public BigDecimal getConversionRate() {
        return conversionRate;
    }

    public void setConversionRate(BigDecimal conversionRate) {
        this.conversionRate = conversionRate;
    }

    public boolean isSignPrefix() {
        return signPrefix;
    }

    public void setSignPrefix(boolean signPrefix) {
        this.signPrefix = signPrefix;
    }

    public BigDecimal getDisplayUnits(){
        // isoCode = USD
        // sh.shopSettings.defaultCurrency.getIsoCode() = CZK
        // 1USD = 27CZK
        return new BigDecimal(1).divide(getConversionRate(), 2, RoundingMode.HALF_UP);
    }
}
