package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "attribute")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Attribute extends AbstractIdentity {
    /*
    attribute
    |ID|NAME     |
    |1 | Color   |
    |2 | Material|


    attributeValue
    |ID|Attr_id|Value     |
    |1 | 1     | RED      |
    |2 | 1     | BLUE     |
    |3 | 2     |LEATHER   |
    |4 |  2    |TEXTILE   |

    //KOMBINACE
    //RED WORKS WITH LEATHER AND TEXTILE
    //BLUE DOESNT WORK WITH TEXTILE
    //COLOR:RED,MATERIAL:LEATHER
    //COLOR:BLUE,MATERIAL:LEATHER
    //COLOR:BLUE,MATERIAL:TEXTILE
    //1,3
    //2,3
    //2,4

    AttributeValueCombination
    |ID| combination |     product_id     |
    | 1|      1,3    |        1           |
    | 2|      2,3    |        1           |
    | 3|      2,4    |        1           |

    ProductToAttrCombination
    |ID| product_id | combination_id|
    | 1|      1     |      1        |
    | 2|      1     |      2        |
    | 3|      1     |      3        |


    ProductToAttrCombinationImage
    |ID| product_combination_id| img_url                                    |
    |1 |             1         | path/color_RED_material_LEATHER_shirt.png  |
    |1 |             2         | path/color_RED_material_TEXTILE_shirt.png  |
    |1 |             3         | path/color_BLUE_material_LEATHER_shirt.png |
     */
    String name;

}
