package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "category")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Category extends AbstractIdentity {
    @ManyToOne
    private Category parent;
    //private int idShopDefault;
    @Column(name = "level_depth")
    @JsonProperty(value = "level_depth")
    private int levelDepth;
    private int nleft;
    private int nright;
    private boolean active;
    @Column(name = "date_add")
    @JsonProperty(value = "date_add")
    private Timestamp dateAdd;

    @Column(name = "date_upd")
    @JsonProperty(value = "date_upd")
    private Timestamp dateUpd;
    private int position;
    @Column(name = "is_root_category")
    @JsonProperty(value = "is_root_category")
    private boolean isRootCategory;
    @OneToMany(mappedBy = "category")
    private Set<CategoryLang> lang;


    //====================================ADDITIONAL DESC=============================/

    //===========================================TBD==================================/


}
