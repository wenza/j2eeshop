package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "order_state")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class OrderState extends AbstractIdentity {
    @Column(name = "send_email")
    @JsonProperty(value = "send_email")
    private boolean sendEmail;
    private String emailTemplate;
    @Column(name = "pdf_invoice")
    @JsonProperty(value = "pdf_invoice")
    private boolean containsInvoice;
    @Column(name = "pdf_delivery")
    @JsonProperty(value = "pdf_delivery")
    private boolean containsDelivery;//Delivery document
    //TODO:private String moduleName;
    private String color;
    @OneToMany(mappedBy = "state")
    private Set<OrderStateLang> langs;
    private boolean active;
    private boolean isAfterOrder;
    //private boolean unremovable;
    //private byte hidden;
    //private byte logable;
    //private boolean delivery;
    //private boolean shipped;
    //private boolean paid;
    //private boolean deleted;


    //====================================ADDITIONAL DESC=============================/

    //===========================================TBD==================================/


    public Set<OrderStateLang> getLangs() {
        return langs;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public boolean isSendEmail() {
        return sendEmail;
    }

    public void setSendEmail(boolean sendEmail) {
        this.sendEmail = sendEmail;
    }

    public String getEmailTemplate() {
        return emailTemplate;
    }

    public void setEmailTemplate(String emailTemplate) {
        this.emailTemplate = emailTemplate;
    }

    public boolean isContainsInvoice() {
        return containsInvoice;
    }

    public void setContainsInvoice(boolean containsInvoice) {
        this.containsInvoice = containsInvoice;
    }

    public boolean isContainsDelivery() {
        return containsDelivery;
    }

    public void setContainsDelivery(boolean containsDelivery) {
        this.containsDelivery = containsDelivery;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public boolean isAfterOrder() {
        return isAfterOrder;
    }

    public void setAfterOrder(boolean afterOrder) {
        isAfterOrder = afterOrder;
    }

    public OrderState(){}

    public OrderState(boolean sendEmail, String emailTemplate, boolean containsInvoice, boolean containsDelivery, String color, Set<OrderStateLang> langs, boolean active,boolean isAfterOrder) {
        this.sendEmail = sendEmail;
        this.emailTemplate = emailTemplate;
        this.containsInvoice = containsInvoice;
        this.containsDelivery = containsDelivery;
        this.color = color;
        this.langs = langs;
        this.active = active;
        this.isAfterOrder=isAfterOrder;
    }

    public Set<OrderStateLang> getLangs(JPAUtil jpa) {
        //TODO:
        List<OrderStateLang> list = jpa.selectOrderStateLangs(this);
        langs = new HashSet<OrderStateLang>( list )  ;
        return langs;
    }

    public OrderStateLang getLang(Language reqLang, JPAUtil jpa){
        for(OrderStateLang lang : getLangs(jpa)){
            if(lang.getLang().getIsoCode().equals(reqLang.getIsoCode())){
                return lang;
            }
        }
        return null;
    }

    public void setLangs(Set<OrderStateLang> langs) {
        this.langs = langs;
    }
}
