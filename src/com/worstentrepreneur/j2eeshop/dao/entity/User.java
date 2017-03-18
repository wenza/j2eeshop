package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "user")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class User extends AbstractIdentity {
    /*@ManyToOne
    private Group group;
    @ManyToOne
    private Language language;*/
    private String email;
    @JsonIgnore
    private String passwd;

    //====================================ADDITIONAL DESC=============================/
    @JsonProperty(value = "date_add")
    private Date dateAdd;
    @Column(name = "date_upd")
    @JsonProperty(value = "date_upd")
    private Date dateUpd;

    public String getEmail() {
        return email;
    }

    public String getPasswd() {
        return passwd;
    }

    public Date getDateAdd() {
        return dateAdd;
    }

    public Date getDateUpd() {
        return dateUpd;
    }
}
