package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "product")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Product extends AbstractIdentity {
    @ManyToOne
    private Manufacturer manufacturer;
    //TODO:ManyToMany
    @ManyToMany
    @JoinTable(
            name="product_to_category",
            joinColumns=@JoinColumn(name="product_id", referencedColumnName="id"),
            inverseJoinColumns=@JoinColumn(name="category_id", referencedColumnName="id"))
    private Set<Category> categories;
    @Column(name = "shop_product_code")
    @JsonProperty(value = "shop_product_code")
    private String shopProductCode;
    private String ean13;
    @Column(name = "manufacturer_product_code")
    @JsonProperty(value = "manufacturer_product_code")
    private String manufacturerProductCode;
    /*private BigDecimal ecotax;*/
    private int quantity;
    private BigDecimal price;
    /*private String unity;*/
    private BigDecimal width;
    private BigDecimal height;
    private BigDecimal depth;
    private BigDecimal weight;
    private boolean active;
    @OneToMany(mappedBy = "product")
    private Set<ProductLang> langs;
    @OneToMany(mappedBy = "product")
    private Set<ProductImage> images;
    @OneToMany(mappedBy = "product")
    private Set<ProductAttrCombination> attributeValueCombinations;
    /*@ManyToOne
    Currency currency;*/
    @Column(name="supplier_price")
    private BigDecimal supplierPrice;
    /*@ManyToOne
    Currency supplierCurrency;*/


    //====================================ADDITIONAL DESC=============================/
    @Column(name = "date_add")
    @JsonProperty(value = "date_add")
    private Date dateAdd;
    @Column(name = "date_upd")
    @JsonProperty(value = "date_upd")
    private Date dateUpd;
    /*@Column(name = "out_of_stock")
    @JsonProperty(value = "out_of_stock")
    private int outOfStock;*/
    @ManyToOne
    private Tax tax;
    @ManyToOne
    private Tax supplierTax;

    /*
    @Column(name = "on_sale")
    @JsonProperty(value = "on_sale")
    private boolean onSale;

    @Column(name = "minimal_quantity")
    @JsonProperty(value = "minimal_quantity")
    private int minimalQuantity;


    @Column(name = "wholesale_price")
    @JsonProperty(value = "wholesale_price")
    private BigDecimal wholesalePrice;
    */
    //===========================================TBD==================================/

    //TODO:private Integer idSupplier;
    //private int idShopDefault;
    //TODO:private boolean onlineOnly;
    //TODO:private BigDecimal unitPriceRatio;
    //TODO:private BigDecimal additionalShippingCost;
    //TODO:private String reference;
    //TODO:private String supplierReference;
    //private String location;
    //TODO:private boolean quantityDiscount;
    //TODO:private boolean customizable;
    //TODO:private boolean uploadableFiles;
    //TODO:private boolean textFields;
    //TODO:private Serializable redirectType;
    //TODO:private int idProductRedirected;
    //TODO:private boolean availableForOrder;
    //TODO:private Date availableDate;
    //TODO:private Serializable condition;
    //TODO:private boolean showPrice;
    //TODO:private boolean indexed;
    //TODO:private Serializable visibility;
    //TODO:private boolean advancedStockManagement;
    //TODO:private int packStockType;
    //???private boolean cacheIsPack;
    //???private boolean cacheHasAttachments;
    //private boolean isVirtual;
    //private Integer cacheDefaultAttribute;


    public Manufacturer getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(Manufacturer manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getShopProductCode() {
        return shopProductCode;
    }

    public void setShopProductCode(String shopProductCode) {
        this.shopProductCode = shopProductCode;
    }

    public String getEan13() {
        return ean13;
    }

    public void setEan13(String ean13) {
        this.ean13 = ean13;
    }

    public String getManufacturerProductCode() {
        return manufacturerProductCode;
    }

    public void setManufacturerProductCode(String manufacturerProductCode) {
        this.manufacturerProductCode = manufacturerProductCode;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getWidth() {
        return width;
    }

    public void setWidth(BigDecimal width) {
        this.width = width;
    }

    public BigDecimal getHeight() {
        return height;
    }

    public void setHeight(BigDecimal height) {
        this.height = height;
    }

    public BigDecimal getDepth() {
        return depth;
    }

    public void setDepth(BigDecimal depth) {
        this.depth = depth;
    }

    public BigDecimal getWeight() {
        return weight;
    }

    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Set<ProductLang> getLangs(JPAUtil jpa) {
        //TODO:
        List<ProductLang> list = jpa.selectEntityLang(this);
        langs = new HashSet<ProductLang>( list )  ;
        return langs;
    }

    public ProductLang getLang(Language reqLang, JPAUtil jpa){
        for(ProductLang lang : getLangs(jpa)){
            if(lang.getLang().getIsoCode().equals(reqLang.getIsoCode())){
                return lang;
            }
        }
        return null;
    }

    /*public Currency getCurrency() {
        return currency;
    }*/

    /*public void setCurrency(Currency currency) {
        this.currency = currency;
    }*/

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

    public Tax getTax() {
        return tax;
    }

    public void setTax(Tax tax) {
        this.tax = tax;
    }

    public Set<Category> getCategories() {
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }

    public Set<ProductImage> getImages() {
        return images;
    }

    public void setImages(Set<ProductImage> images) {
        this.images = images;
    }

    public BigDecimal getSupplierPrice() {
        return supplierPrice;
    }

    public void setSupplierPrice(BigDecimal supplierPrice) {
        this.supplierPrice = supplierPrice;
    }

    /*public Currency getSupplierCurrency() {
        return supplierCurrency;
    }

    public void setSupplierCurrency(Currency supplierCurrency) {
        this.supplierCurrency = supplierCurrency;
    }*/

    public void setLangs(Set<ProductLang> langs) {
        this.langs = langs;
    }

    public void setAttributeValueCombinations(Set<ProductAttrCombination> attributeValueCombinations) {
        this.attributeValueCombinations = attributeValueCombinations;
    }

    public void setSupplierTax(Tax supplierTax) {
        this.supplierTax = supplierTax;
    }

    public Tax getSupplierTax() {
        return supplierTax;
    }
}
