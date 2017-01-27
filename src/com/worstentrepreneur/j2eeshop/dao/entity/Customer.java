package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "customer")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Customer extends AbstractIdentity {
    @ManyToOne
    private Group group;
    @ManyToOne
    private Language language;
    private String company;
    private String firstname;
    private String lastname;
    private String email;
    private String passwd;
    private Date birthday;
    private boolean newsletter;
    private String note;
    private boolean active;
    @OneToMany(fetch=FetchType.LAZY)
    private Set<Address> addressList;

    //====================================ADDITIONAL DESC=============================/
    @Column(name = "is_guest")
    @JsonProperty(value = "is_guest")
    private boolean isGuest;
    private boolean deleted;
    @Column(name = "date_add")
    @JsonProperty(value = "date_add")
    private Timestamp dateAdd;
    @Column(name = "date_upd")
    @JsonProperty(value = "date_upd")
    private Timestamp dateUpd;

    //===========================================TBD==================================/
    //private int idShopGroup;
    //TODO:private int idGender;
    //private int idRisk;
    //private String siret;
    //TODO:private String age;
    //TODO:private Timestamp lastPasswdGen;
    //TODO:private String ipRegistrationNewsletter;
    //TODO:private Timestamp newsletterDateAdd;
    //TODO:private boolean optin;
    //TODO:private String website;
    //TODO:private BigDecimal outstandingAllowAmount;
    //private boolean showPublicPrices;
    //private int maxPaymentDays;
    //private String secureKey;


}
