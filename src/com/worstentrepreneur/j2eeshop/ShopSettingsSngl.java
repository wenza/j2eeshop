package com.worstentrepreneur.j2eeshop;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;
import com.worstentrepreneur.j2eeshop.dao.entity.Currency;
import com.worstentrepreneur.j2eeshop.dao.entity.Language;
import com.worstentrepreneur.j2eeshop.dao.entity.Tax;
import com.worstentrepreneur.tests.Updater;
import com.worstentrepreneur.utils.PropertyHandler;
import com.worstentrepreneur.utils.TestReq;

import javax.naming.InitialContext;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Set;

public class ShopSettingsSngl {
    @JsonIgnore
    public String shopName = null;
    @JsonIgnore
    public String companyName = null;
    @JsonIgnore
    public String shopTeamName = null;

    private boolean updating = false;
    public String mailTo = null;
    public String facebookLink = null;
    public String instagramLink = null;
    public String pinterestLink = null;
    public String contactPhone = null;
    public String contactEmail = null;
    public String shopUrl = null;
    public String twitterLink = null;
    public String youtubeLink = null;
    public List<String> updateStatus = new ArrayList<>();
    //public static String logoURL = "nejaky URL";
    @JsonProperty(value = "default_language")
    public Language defaultLanguage = null;//cs
    @JsonProperty(value = "default_currency")
    public Currency defaultCurrency = null;//"CZK";
    @JsonProperty(value = "default_tax")
    public Tax defaultTax = null;
    public List<Language> languages = new ArrayList<>();//{"cs","en"};
    @JsonIgnore
    public Properties confProps = null;
    @JsonIgnore
    private static String warPath = new File(ShopSettingsSngl.class.getProtectionDomain().getCodeSource().getLocation().getPath()).getParentFile().getParent();

    @JsonIgnore
    private static String mailFrom = null;
    @JsonIgnore
    private static String mailUsername = null;
    @JsonIgnore
    private static String mailPassword = null;
    @JsonIgnore
    private static boolean mailSmtpAuth;
    @JsonIgnore
    private static String mailSmtpType;
    @JsonIgnore
    private static String mailSmtpHost;
    @JsonIgnore
    private static int mailSmtpPort;
    @JsonIgnore
    private static String mailDefaultHeaderImageURL;
    @JsonIgnore
    public static String seoDefaultTitle;
    @JsonIgnore
    public static String seoDefaultDescription;
    @JsonIgnore
    public static String seoDefaultKeywords;
    @JsonIgnore
    public static String seoSiteName;
    @JsonIgnore
    public static String seoSiteImageUrl;


    @JsonIgnore
    public static String getAbsolutePathOfWar(){
        return warPath;
    }

    private static ShopSettingsSngl ourInstance = new ShopSettingsSngl();

    public static ShopSettingsSngl getInstance() {

        return ourInstance;
    }

    private ShopSettingsSngl() {

        init();
    }
    @JsonIgnore
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
        this.defaultTax = jpa.selectByID(Tax.class, TestReq.Int(confProps.getProperty("default_tax_id")));
        this.shopUrl = confProps.getProperty("shop_url");
        this.mailFrom  = confProps.getProperty("mail_from");
        this.mailUsername = confProps.getProperty("mail_username");
        this.mailPassword = confProps.getProperty("mail_password");
        this.mailTo = confProps.getProperty("mail_mailto");
        this.mailSmtpAuth = TestReq.Bool(confProps.getProperty("mail_smtp_auth"));
        this.mailSmtpType = TestReq.Str(confProps.getProperty("mail_smtp_type"));
        this.mailSmtpHost = confProps.getProperty("mail_smtp_host");
        this.mailSmtpPort= TestReq.Int(confProps.getProperty("mail_smtp_port"));
        this.mailDefaultHeaderImageURL = confProps.getProperty("mail_default_header_image_url");

        this.instagramLink = confProps.getProperty("instagram_link");
        this.pinterestLink = confProps.getProperty("pinterest_link");
        this.youtubeLink = confProps.getProperty("youtube_link");
        this.contactPhone = confProps.getProperty("contact_phone");
        this.contactEmail = confProps.getProperty("contact_email");

        this.twitterLink = confProps.getProperty("twitter_link");
        this.facebookLink = confProps.getProperty("facebook_link");


        this.seoDefaultTitle = confProps.getProperty("seo_default_title");
        this.seoDefaultDescription = confProps.getProperty("seo_default_description");
        this.seoDefaultKeywords = confProps.getProperty("seo_default_keywords");
        this.seoSiteName = confProps.getProperty("seo_site_name");
        this.seoSiteImageUrl = confProps.getProperty("seo_default_image_url");

        String[] languageISOs = confProps.getProperty("language_isos").split(",");
        for(String s : languageISOs){
            System.out.println(s);
            this.languages.add(jpa.selectLanguageByISO(s));
        }
    }

    public static void update(){
        Updater.updateInThread();
    }

    public boolean isUpdating() {
        return updating;
    }

    public void setUpdating(boolean updating) {
        this.updating = updating;
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

    public List<String> getUpdateStatus() {
        return updateStatus;
    }
    public void updateStatus(String s) {
        updateStatus.add(s);
    }



    public Properties getConfProps() {
        return confProps;
    }

    public static ShopSettingsSngl getOurInstance() {
        return ourInstance;
    }

    public Tax getDefaultTax() {
        return defaultTax;
    }

    public String getMailTo() {
        return mailTo;
    }

    public String getInstagramLink() {
        return instagramLink;
    }

    public String getPinterestLink() {
        return pinterestLink;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public String getFacebookLink() {
        return facebookLink;
    }

    public String getShopUrl() {
        return shopUrl;
    }

    public String getYoutubeLink() {
        return youtubeLink;
    }

    public String getTwitterLink() {
        return twitterLink;
    }

    public static String getWarPath() {
        return warPath;
    }

    public static String getMailFrom() {
        return mailFrom;
    }

    public static String getMailDefaultHeaderImageURL() {
        return mailDefaultHeaderImageURL;
    }

    public static String getMailUsername() {
        return mailUsername;
    }

    public static String getMailPassword() {
        return mailPassword;
    }

    public static boolean isMailSmtpAuth() {
        return mailSmtpAuth;
    }

    public static String getMailSmtpType() {
        return mailSmtpType;
    }

    public static String getMailSmtpHost() {
        return mailSmtpHost;
    }

    public static int getMailSmtpPort() {
        return mailSmtpPort;
    }
}
