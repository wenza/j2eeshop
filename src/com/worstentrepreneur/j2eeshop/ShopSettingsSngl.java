package com.worstentrepreneur.j2eeshop;

import com.worstentrepreneur.j2eeshop.dao.JPAUtil;
import com.worstentrepreneur.j2eeshop.dao.entity.Currency;
import com.worstentrepreneur.j2eeshop.dao.entity.Language;
import com.worstentrepreneur.utils.PropertyHandler;

import javax.naming.InitialContext;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Set;

public class ShopSettingsSngl {
    public String shopName = null;
    public String companyName = null;
    public String shopTeamName = null;
    //public static String logoURL = "nejaky URL";
    public Language defaultLanguage = null;//cs
    public Currency defaultCurrency = null;//"CZK";
    public List<Language> languages = new ArrayList<>();//{"cs","en"};
    public Properties confProps = null;

    public static String getAbsolutePathOfWar(){
        File f = new File(ShopSettingsSngl.class.getProtectionDomain().getCodeSource().getLocation().getPath());
        String shopPath = f.getParentFile().getParent();
        return shopPath;
    }

    private static ShopSettingsSngl ourInstance = new ShopSettingsSngl();

    public static ShopSettingsSngl getInstance() {

        return ourInstance;
    }

    private ShopSettingsSngl() {

        init();
    }
    private void init(){
        JPAUtil jpa = null;
        try{
            jpa = (JPAUtil) new InitialContext().lookup("java:module/JPAUtil");
        }catch (Exception e){
            e.printStackTrace();
        }

        String configFilePath = getAbsolutePathOfWar()+"/admin/config.properties";
        this.confProps = PropertyHandler.read(configFilePath);
        this.shopName = confProps.getProperty("shop_name");
        this.companyName = confProps.getProperty("company_name");
        this.shopTeamName = confProps.getProperty("team_name");
        this.defaultLanguage = jpa.selectLanguageByISO(confProps.getProperty("default_language_iso")) ;
        this.defaultCurrency = jpa.selectCurrencyByISO(confProps.getProperty("default_currency_iso")) ;
        String[] languageISOs = confProps.getProperty("language_isos").split(",");
        for(String s : languageISOs){
            System.out.println(s);
            this.languages.add(jpa.selectLanguageByISO(s));
        }
    }

    /** GETTERS **/
    public String getShopName() {
        return shopName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public String getShopTeamName() {
        return shopTeamName;
    }

    public Language getDefaultLanguage() {
        return defaultLanguage;
    }

    public Currency getDefaultCurrency() {
        return defaultCurrency;
    }

    public List<Language> getLanguages() {
        return languages;
    }

    public Properties getConfProps() {
        return confProps;
    }

    public static ShopSettingsSngl getOurInstance() {
        return ourInstance;
    }
}
