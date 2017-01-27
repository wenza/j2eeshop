package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "address")
/*@NamedQueries({
        @NamedQuery(name = Address.QUERY_GET_BY_CITY,
                query = "select o from Address o where o.city = ?1",
                hints = @QueryHint(name = "org.hibernate.cacheable", value = "true")),
        @NamedQuery(name = Address.QUERY_GET_BY_POSTCODE,
                query = "select o from Address o where o.postcode=?1")// like concat(?1,'%')"),
})*/
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Address extends AbstractIdentity {
    /*public static final String QUERY_GET_BY_CITY = "Address.getByCity";
    public static final String QUERY_GET_BY_POSTCODE = "Address.getByPostcode";*/

    /*@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "country_id")
    private Country country;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "customer_id")
    private Customer customer;*/
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "customer_id")
    private Customer customer;
    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name = "manufacturer_id")
    private Manufacturer manufacturer;
    private String alias;
    private String company;
    private String lastname;
    private String firstname;
    private String address1;
    private String address2;
    private String postcode;
    private String city;
    private String other;
    private String phone;
    private String dni;
    private boolean active;
    private boolean deleted;

    //====================================ADDITIONAL DESC=============================/

    @Column(name = "phone_mobile")
    @JsonProperty(value = "phone_mobile")
    private String phoneMobile;
    @Column(name = "vat_number")
    @JsonProperty(value = "vat_number")
    private String vatNumber;
    @Column(name = "date_add")
    @JsonProperty(value = "date_add")
    private Date dateAdd;
    @Column(name = "date_upd")
    @JsonProperty(value = "date_upd")
    private Date dateUpd;

    //===========================================TBD==================================/


    //TODO:private Integer idState;
    //TODO:private Supplier supplier;
    //TODO:private int idWarehouse;


}
