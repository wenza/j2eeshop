package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;

import javax.persistence.*;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "_module_data_lang")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class ModuleDataLang extends AbstractIdentity {
    @ManyToOne
    Language language;
    @ManyToOne
    ModuleData moduleData;
    @Column(columnDefinition = "TEXT")
    private String column1;
    @Column(columnDefinition = "TEXT")
    private String column2;
    @Column(columnDefinition = "TEXT")
    private String column3;
    @Column(columnDefinition = "TEXT")
    private String column4;


    public String getColumn1() {
        return column1;
    }

    public void setColumn1(String column1) {
        this.column1 = column1;
    }

    public String getColumn2() {
        return column2;
    }

    public void setColumn2(String column2) {
        this.column2 = column2;
    }

    public String getColumn3() {
        return column3;
    }

    public void setColumn3(String column3) {
        this.column3 = column3;
    }

    public String getColumn4() {
        return column4;
    }

    public void setColumn4(String column4) {
        this.column4 = column4;
    }

    public Language getLanguage() {
        return language;
    }

    public ModuleDataLang(ModuleData moduleData, Language lang, String... columns) {
        int counter = 0;
        for(String s : columns){
            counter++;
            switch (counter){
                case 1:
                    this.column1 = s;
                    break;
                case 2:
                    this.column2 = s;
                    break;
                case 3:
                    this.column3 = s;
                    break;
                case 4:
                    this.column4 = s;
                    break;
            }
        }
        this.moduleData = moduleData;
        this.language=lang;
    }

    public ModuleDataLang() {
    }
}