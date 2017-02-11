package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "manufacturer",uniqueConstraints = {
        @UniqueConstraint(columnNames = {"name"})
})
@NamedQueries({
        @NamedQuery(name = Manufacturer.QUERY_GET_BY_NAME,
                query = "select o from Manufacturer o where o.name= ?1",
                hints = @QueryHint(name = "org.hibernate.cacheable", value = "true"))// like concat(?1,'%')"),
})
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Manufacturer extends AbstractIdentity {
    public static final String QUERY_GET_BY_NAME = "ManufacturerEntity.getByName";
    private String name;
    private boolean active;
    //@ManyToMany
    //TODO:private Address address;


    //====================================ADDITIONAL DESC=============================/
    @Column(name = "date_add")
    @JsonProperty(value = "date_add")
    private Date dateAdd;
    @Column(name = "date_upd")
    @JsonProperty(value = "date_upd")
    private Date dateUpd;

    //===========================================TBD==================================/


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Date getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(Date dateAdd) {
        this.dateAdd = dateAdd;
    }

    public Date getDateUpd() {
        return dateUpd;
    }

    public void setDateUpd(Date dateUpd) {
        this.dateUpd = dateUpd;
    }
}
