package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.ShopSettingsSngl;
import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.*;
import com.worstentrepreneur.j2eeshop.dao.entity.Currency;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.PropertyHandler;
import com.worstentrepreneur.utils.TestReq;
import com.worstentrepreneur.utils.Validator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

public class ShopSettingsBean {
    public static MergeResult merge(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        ShopSettingsSngl settings = ShopSettingsSngl.getInstance();
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            AdminSessionHolder sh = AdminSessionHolder.get(session);

            if(!sh.jpa.hasUser()){
                String userEmail = TestReq.Str("admin-email");
                String userPwd = TestReq.Str("admin-password");
                String userPwd2 = TestReq.Str("admin-password2");
                if(Validator.mailValidate(userEmail)) {
                    if (userPwd2.equals(userPwd)) {
                        User u = new User();
                        u.setEmail(userEmail);
                        u.setPasswd(userPwd);
                        u.setDateAdd(new Date());
                        u.setDateUpd(new Date());
                        u = (User)sh.jpa.merge(u);
                    }else{
                        errors.add("Přihlašovací hesla se neshodují");
                    }
                }else{
                    errors.add("Email není validní");
                }
            }
            if(errors.size()==0) {
                String configFilePath = settings.getAbsolutePathOfWar() + "/admin/config.properties";

                Properties props = PropertyHandler.read(configFilePath);

                props.setProperty("shop_url", TestReq.Str(request, "shop_url"));
                props.setProperty("shop_name", TestReq.Str(request, "shop_name"));
                props.setProperty("company_name", TestReq.Str(request, "company_name"));
                props.setProperty("team_name", TestReq.Str(request, "team_name"));
                String defaultLangStr = TestReq.Str(request, "default_language_iso");
                Language langX = sh.jpa.selectLanguageByISO(defaultLangStr);
                if(langX!=null) {
                    props.setProperty("default_language_iso", defaultLangStr);//cannot be empty
                }else{
                    errors.add("Výchozí jazyk nesmí být prázdný");
                }
                String defaultCurrStr = TestReq.Str(request, "default_currency_iso");
                Currency currX = sh.jpa.selectCurrencyByISO(defaultCurrStr);
                if(currX!=null) {
                    props.setProperty("default_currency_iso", defaultCurrStr);//cannot be empty
                }else{
                    errors.add("Výchozí měna nesmí být prázdná");
                }

                int defaultTaxStr = TestReq.Int(request, "default_tax_id");
                Tax taxX = sh.jpa.selectByID(Tax.class,defaultTaxStr);
                if(taxX!=null) {
                    props.setProperty("default_tax_id", defaultTaxStr + "");//cannot be empty
                }else{
                    errors.add("Výchozí daň nesmí být prázdná");
                }
                String langIsosStr = TestReq.Str(request, "language_isos");
                String[] languageISOs = langIsosStr.split(",");
                String newLangIsosStr = "";
                boolean defaultAdded = false;
                for(String s : languageISOs){
                    if(s.equals(defaultLangStr))defaultAdded=true;
                    newLangIsosStr+=s+",";
                }
                if(!defaultAdded){
                    newLangIsosStr+=defaultLangStr+",";
                }
                try{
                    newLangIsosStr=newLangIsosStr.substring(0,newLangIsosStr.length()-1);
                }catch (Exception e){
                    errors.add("Formátování jazyků se nezdařilo");
                }
                props.setProperty("language_isos", newLangIsosStr);
                props.setProperty("contact_phone", TestReq.Str(request, "contact_phone"));
                props.setProperty("contact_email", TestReq.Str(request, "contact_email"));
                props.setProperty("facebook_link", TestReq.Str(request, "facebook_link"));
                props.setProperty("twitter_link", TestReq.Str(request, "twitter_link"));
                props.setProperty("pinterest_link", TestReq.Str(request, "pinterest_link"));
                props.setProperty("instagram_link", TestReq.Str(request, "instagram_link"));
                props.setProperty("youtube_link", TestReq.Str(request, "youtube_link"));
                props.setProperty("mail_username", TestReq.Str(request, "mail_username"));
                props.setProperty("mail_password", TestReq.Str(request, "mail_password"));
                props.setProperty("mail_from", TestReq.Str(request, "mail_from"));
                props.setProperty("logo_url", TestReq.Str(request, "logo_url"));
                props.setProperty("mail_smtp_auth", TestReq.Str(request, "mail_smtp_auth"));
                props.setProperty("mail_smtp_type", TestReq.Str(request, "mail_smtp_type"));
                props.setProperty("mail_smtp_host", TestReq.Str(request, "mail_smtp_host"));
                props.setProperty("mail_smtp_port", TestReq.Str(request, "mail_smtp_port"));
                props.setProperty("mail_default_header_image_url", TestReq.Str(request, "mail_default_header_image_url"));
                props.setProperty("seo_default_title", TestReq.Str(request, "seo_default_title"));
                props.setProperty("seo_default_description", TestReq.Str(request, "seo_default_description"));
                props.setProperty("seo_default_keywords", TestReq.Str(request, "seo_default_keywords"));
                props.setProperty("seo_default_image_url", TestReq.Str(request, "seo_default_image_url"));
                props.setProperty("seo_site_name", TestReq.Str(request, "seo_site_name"));

                PropertyHandler.store(props, configFilePath);
                settings.reinit();
                if (settings.isMissingData()) {
                    errors.addAll(settings.getMissingData());
                }
            }

        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(settings, errors);
    }
}
