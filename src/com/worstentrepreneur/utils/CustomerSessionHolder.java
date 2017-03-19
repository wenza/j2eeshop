package com.worstentrepreneur.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.worstentrepreneur.j2eeshop.ShopSettingsSngl;
import com.worstentrepreneur.j2eeshop.dao.JPAUtil;
import com.worstentrepreneur.j2eeshop.dao.entity.*;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.Properties;

public class CustomerSessionHolder {
    //public User user = new User();
    //public Login login;
    public Date fromTime;
    public Date toTime;
    public Customer customer = null;// = new Customer();
    public static JPAUtil jpa = null;
    public static Language userLang = null;
    public static Currency userCurrency = null;
    public static Order order = null;
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
            userLang = shopSettings.defaultLanguage;
        }
        return userLang;
    }
    public static Currency getCurr(){
        if(userCurrency==null) {
            userCurrency = shopSettings.defaultCurrency;
        }
        return userCurrency;
    }
    public static ShopSettingsSngl getSettings(){
        shopSettings=ShopSettingsSngl.getInstance();
        return shopSettings;
    }
    public CustomerSessionHolder() {
        getSettings();
        getJPA();
        getLang();
        //getOrder();
    }

    public static Order getOrder() {
        /*if(order==null){
            order = new Order();
            order.setCurrency(userCurrency);
            order.setDeleted(true);
            //order.setCurrencyRate(userCurrency.getConversionRate());
            //order.set
            *//*
            order.setReference();
            order.setProducts();
            order.setCustomer();
            order.setCurrency();
            order.setShipping();
            order.setPayment();
            order.setAddressDelivery();
            order.setAddressInvoice();
            order.setCurrentState();
            order.setShippingTaxExcl();
            order.setPaymentTaxExcl();
            order.setOrderTaxExcl();
            order.setShippingTaxIncl();
            order.setPaymentTaxIncl();
            order.setOrderTaxIncl();
            order.setTrackingCode();
            order.setInvoiceNumber();
            order.setDeliveryNumber();
            order.setDateAdd();
            order.setDateUpd();
            //order.setId();
            *//*


        }*/
        return order;
    }

    public static CustomerSessionHolder get(HttpSession session){
        if(session.getAttribute("shC")==null){
            session.setAttribute("shC",new CustomerSessionHolder());
        }
        return (CustomerSessionHolder) session.getAttribute("shC");
    }
    public void update(HttpSession session){
        session.setAttribute("shC",this);
    }
    public static String mdv(ModuleData moduleData,String columnName){//module-data-value
        String moduleFolder = getModuleFolder(moduleData);
        System.out.println("Reading module settings from:\n"+moduleFolder+"/module.properties");
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
        String moduleFolder = getModuleFolder(moduleData);
        System.out.println("Reading module settings from:\n"+moduleFolder+"/module.properties");
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
    public static String getModuleFolder(ModuleData moduleData){
        String moduleFolder = shopSettings.getWarPath()+"/modules/"+moduleData.getModule().getName()+"";
        File moduleFolderF = new File(moduleFolder);
        if(!moduleFolderF.exists()){
            System.out.println("module - "+moduleData.getModule().getName()+" is not under /modules");
            moduleFolder = shopSettings.getWarPath()+"/modules/backend_"+moduleData.getModule().getName()+"";
            moduleFolderF = new File(moduleFolder);
            if(!moduleFolderF.exists()){
                System.out.println("module - "+moduleData.getModule().getName()+" is not under /modules/_backend");
                moduleFolder = shopSettings.getWarPath()+"/modules/backend_"+moduleData.getModule().getName()+"";
                moduleFolderF = new File(moduleFolder);
                if(!moduleFolderF.exists()){
                    System.out.println("module - "+moduleData.getModule().getName()+" is not under /modules/_frontend");
                    return null;
                }

            }
        }
        return moduleFolder;
    }
    public static String reqURI(HttpServletRequest request){
        return "?"+TestReq.Str(request.getQueryString());
    }
}
