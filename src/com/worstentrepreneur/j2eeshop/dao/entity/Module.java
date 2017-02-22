package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "_module")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Module extends AbstractIdentity {
    private String name;
    @Column(name="short_data")
    private String shortData;
    /*@OneToMany
    Set<ModuleData> data;*/

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /*public Set<ModuleData> getData() {
        return data;
    }

    public void setData(Set<ModuleData> data) {
        this.data = data;
    }*/

    public String getShortData() {
        return shortData;
    }

    public void setShortData(String shortData) {
        this.shortData = shortData;
    }
}
