package com.worstentrepreneur.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.worstentrepreneur.j2eeshop.ShopSettingsSngl;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;
import com.worstentrepreneur.j2eeshop.dao.entity.Language;
import com.worstentrepreneur.j2eeshop.dao.entity.ModuleData;

import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Properties;

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
    public static String mdv(ModuleData moduleData,String columnName){//module-data-value
        String moduleFolder = shopSettings.getWarPath()+"/admin/modules/"+moduleData.getModule().getName()+"";
        Properties props = PropertyHandler.read(moduleFolder+"/module.properties");
        try{
            int columnIndex = TestReq.Int(props.getProperty(columnName));
            switch(columnIndex){
                case 1:
                    return moduleData.getColumn1();
                case 2:
                    return moduleData.getColumn2();
                case 3:
                    return moduleData.getColumn3();
                case 4:
                    return moduleData.getColumn4();
                case 5:
                    return moduleData.getColumn5();
                default:
                    return null;
            }
        }catch (Exception e){
            return null;
        }
    }
    public static ModuleData smdv(ModuleData moduleData,String columnName,String columnValue){//module-data-value
        String moduleFolder = shopSettings.getWarPath()+"/admin/modules/"+moduleData.getModule().getName()+"";
        System.out.println("moduleFolder="+moduleFolder);
        Properties props = PropertyHandler.read(moduleFolder+"/module.properties");
        try{
            int columnIndex = TestReq.Int(props.getProperty(columnName));
            switch(columnIndex){
                case 1:
                    moduleData.setColumn1(columnValue);
                    return moduleData;
                case 2:
                    moduleData.setColumn2(columnValue);
                    return moduleData;
                case 3:
                    moduleData.setColumn3(columnValue);
                    return moduleData;
                case 4:
                    moduleData.setColumn4(columnValue);
                    return moduleData;
                case 5:
                    moduleData.setColumn5(columnValue);
                    return moduleData;
                default:
                    System.out.println("Column not found - setted default - null");
                    return null;
            }
        }catch (Exception e){
            System.out.println("Column not found");
            return null;
        }
    }
    /*public ShopSettingsSngl getShopSettings() {
        return shopSettings;
    }

    public static Language getUserLang() {
        return userLang;
    }*/
}
