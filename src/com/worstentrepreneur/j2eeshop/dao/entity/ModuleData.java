package com.worstentrepreneur.j2eeshop.dao.entity;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.worstentrepreneur.j2eeshop.dao.AbstractIdentity;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by wenza on 12/10/16.
 */
@Entity
@Cacheable
@Table(name = "_module_data")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE
)
@JsonIgnoreProperties(ignoreUnknown = true)
public class ModuleData extends AbstractIdentity {
    public static int TYPE_PAGE = 1;
    public static int TYPE_PAGE_ITEM = 5;

    @Column(columnDefinition = "TEXT")
    private String column1;
    @Column(columnDefinition = "TEXT")
    private String column2;
    @Column(columnDefinition = "TEXT")
    private String column3;
    @Column(columnDefinition = "TEXT")
    private String column4;
    @Column(columnDefinition = "TEXT")
    private String column5;
    /*@Column(columnDefinition = "TEXT")
    private String column6;*/

    @OneToMany(mappedBy = "moduleData")
    private Set<ModuleDataLang> langs;

    @ManyToOne
    Module module;
    /*
    private String column5;
    private String column6;
    private String column7;
    private String column8;
    private String column9;*/

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

    public String getColumn5() {
        return column5;
    }

    public void setColumn5(String column5) {
        this.column5 = column5;
    }

    public String getColumn4() {
        return column4;
    }

    public void setColumn4(String column4) {
        this.column4 = column4;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    /*public String getColumn6() {
        return column6;
    }

    public void setColumn6(String column6) {
        this.column6 = column6;
    }*/

    public ModuleData() {
    }

    public ModuleData(Module module, String... columns) {
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
                case 5:
                    this.column5 = s;
                    break;
                /*case 6:
                    this.column6 = s;
                    break;*/
            }
        }
        this.module = module;
    }

    public Set<ModuleDataLang> getLangs(JPAUtil jpa) {
        //TODO:
        List<ModuleDataLang> list = jpa.selectModuleDataLang(this);
        langs = new HashSet<ModuleDataLang>( list )  ;
        return langs;
    }

    public ModuleDataLang getLang(Language reqLang, JPAUtil jpa){
        for(ModuleDataLang lang : getLangs(jpa)){
            if(lang.getLanguage().getIsoCode().equals(reqLang.getIsoCode())){
                return lang;
            }
        }
        return null;
    }
}