package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
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
    private Manufacturer manufacturer;
    private Category category;
    private String ean13;
    private String upc;
    private BigDecimal ecotax;
    private int quantity;
    private BigDecimal price;
    private String unity;
    private BigDecimal width;
    private BigDecimal height;
    private BigDecimal depth;
    private BigDecimal weight;
    private boolean active;
    @OneToMany(mappedBy = "product")
    private Set<ProductLang> lang;


    //====================================ADDITIONAL DESC=============================/
    @Column(name = "date_add")
    @JsonProperty(value = "date_add")
    private Timestamp dateAdd;
    @Column(name = "date_upd")
    @JsonProperty(value = "date_upd")
    private Timestamp dateUpd;
    @Column(name = "out_of_stock")
    @JsonProperty(value = "out_of_stock")
    private int outOfStock;
    @Column(name = "tax_rules")
    @JsonProperty(value = "tax_rules")
    private TaxRules taxRules;
    @Column(name = "on_sale")
    @JsonProperty(value = "on_sale")
    private boolean onSale;
    @Column(name = "minimal_quantity")
    @JsonProperty(value = "minimal_quantity")
    private int minimalQuantity;
    @Column(name = "wholesale_price")
    @JsonProperty(value = "wholesale_price")
    private BigDecimal wholesalePrice;

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

}
