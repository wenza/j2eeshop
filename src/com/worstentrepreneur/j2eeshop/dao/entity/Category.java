package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;
import com.worstentrepreneur.utils.AdminSessionHolder;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
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
    private boolean active;
    @Column(name = "date_add")
    @JsonProperty(value = "date_add")
    private Date dateAdd;

    @Column(name = "date_upd")
    @JsonProperty(value = "date_upd")
    private Date dateUpd;
    private int position;
    @Column(name = "is_root_category")
    @JsonProperty(value = "is_root_category")
    private boolean isRootCategory;
    @OneToMany(mappedBy = "category")
    private Set<CategoryLang> langs = null;
    private String imageURL;
    @ManyToMany
    @JoinTable(
            name="category_to_attr_val_combination",
            joinColumns=@JoinColumn(name="category_id", referencedColumnName="id"),
            inverseJoinColumns=@JoinColumn(name="attribute_value_combination_id", referencedColumnName="id"))
    private Set<AttributeValueCombination> attributeValueCombinations;


    //====================================ADDITIONAL DESC=============================/

    //===========================================TBD==================================/


    public Category getParent() {
        return parent;
    }

    public void setParent(Category parent) {
        this.parent = parent;
    }

    public int getLevelDepth() {
        return levelDepth;
    }

    public void setLevelDepth(int levelDepth) {
        this.levelDepth = levelDepth;
    }

    public int getNleft() {
        return nleft;
    }

    public void setNleft(int nleft) {
        this.nleft = nleft;
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


    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public boolean isRootCategory() {
        return isRootCategory;
    }

    public void setRootCategory(boolean rootCategory) {
        isRootCategory = rootCategory;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    /*public CategoryLang getLang(AdminSessionHolder sh) {
        return sh.getJPA().selectLang(CategoryLang.class,this,sh.userLang);
    }*/

    public Set<CategoryLang> getLangs(JPAUtil jpa) {
        //TODO:
        langs=new HashSet<>(jpa.selectCategoryLangs(this));
        //}
        return langs;
    }

    public CategoryLang getLang(Language reqLang, JPAUtil jpa){
        for(CategoryLang lang : jpa.selectCategoryLangs(this)){
            if(lang.getLang().getIsoCode().equals(reqLang.getIsoCode())){
                return lang;
            }
        }
        return null;
    }
    public void setLangs(Set<CategoryLang> langs) {
        this.langs = langs;
    }

    public Set<AttributeValueCombination> getAttributeValueCombinations(JPAUtil jpa) {
        attributeValueCombinations = new HashSet<>(jpa.selectCategoryAtributeValueCombinations(this));
        return attributeValueCombinations;
    }

    public void setAttributeValueCombinations(Set<AttributeValueCombination> attributeValueCombinations) {
        this.attributeValueCombinations = attributeValueCombinations;
    }
}
