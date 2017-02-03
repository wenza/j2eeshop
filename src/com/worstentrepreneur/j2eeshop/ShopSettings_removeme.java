package com.worstentrepreneur.j2eeshop;

import com.worstentrepreneur.j2eeshop.dao.entity.Currency;
import com.worstentrepreneur.j2eeshop.dao.entity.Language;

import java.util.Set;

public class ShopSettings_removeme {
    String shopName = "LOVELILI.cz";
    String companyName = "LOVELILI";
    String shopTeamName = "LOVELILI";
    //public static String logoURL = "nejaky URL";
    Language defaultLanguage = null;//cs
    Currency defaultCurrency = null;//"CZK";
    Set<Language> languages = null;//{"cs","en"};
    //public static Set<Language>
    //public static String DEFAULT_BACKEND_LANG = "cs";


    public ShopSettings_removeme(String shopName, String companyName, String shopTeamName, Language defaultLanguage, Currency defaultCurrency, Set<Language> languages) {
        this.shopName = shopName;
        this.companyName = companyName;
        this.shopTeamName = shopTeamName;
        this.defaultLanguage = defaultLanguage;
        this.defaultCurrency = defaultCurrency;
        this.languages = languages;
    }
}
