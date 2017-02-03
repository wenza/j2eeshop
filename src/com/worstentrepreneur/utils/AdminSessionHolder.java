package com.worstentrepreneur.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.worstentrepreneur.j2eeshop.ShopSettingsSngl;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;
import com.worstentrepreneur.j2eeshop.dao.entity.Language;

import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import java.util.Date;

public class AdminSessionHolder {
    //public User user = new User();
    //public Login login;
    public Date fromTime;
    public Date toTime;
    public static JPAUtil jpa = null;
    public static Language userLang = null;
    public static ShopSettingsSngl shopSettings = ShopSettingsSngl.getInstance();
    public static ObjectMapper objectMapper = new ObjectMapper();
    public static JPAUtil getJPA(){
        if(jpa==null) {
            try {
                jpa = (JPAUtil) new InitialContext().lookup("java:module/JPAUtil");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return jpa;
    }
    public static Language getLang(){
        if(userLang==null) {
            userLang = jpa.selectByID(Language.class, 1);
        }
        return userLang;
    }
    public static ShopSettingsSngl getSettings(){
        shopSettings=ShopSettingsSngl.getInstance();
        return shopSettings;
    }
    public AdminSessionHolder() {
        getSettings();
        getJPA();
        getLang();
    }
    public static AdminSessionHolder get(HttpSession session){
        return (AdminSessionHolder) session.getAttribute("shX");
    }

    /*public ShopSettingsSngl getShopSettings() {
        return shopSettings;
    }

    public static Language getUserLang() {
        return userLang;
    }*/
}
