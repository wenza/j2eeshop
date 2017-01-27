package com.worstentrepreneur.j2eeshop.dao;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;


/**
 * Abstract parent of all entities.<br/>
 * Maintains database id and both equals and hashCode methods to ensure consistency when handling in sets.
 */
@MappedSuperclass
public abstract class AbstractIdentity implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    @JsonProperty
    private Integer id;

    protected AbstractIdentity() {
    }

    public Integer getId() {
        return id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o.getClass().isAssignableFrom(this.getClass()))) {
            return false;
        }

        return getId() != null && Objects.equals(getId(), ((AbstractIdentity) o).getId());
    }

    @Override
    public int hashCode() {
        return 31;
    }
}