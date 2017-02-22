package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.*;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class PaymentBean {
    public static MergeResult merge(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Payment entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            AdminSessionHolder sh = AdminSessionHolder.get(session);
            int entityID = TestReq.Int(request, "id");
            entity = sh.jpa.selectByID(Payment.class, entityID);
            if (entity == null) entity = new Payment();

            Shipping shipping = sh.jpa.selectByID(Shipping.class,TestReq.Int(request,"shipping-id"));

            if(shipping!=null) {
                boolean is_active = TestReq.Bool(request, "is-active");//on
                BigDecimal price = TestReq.BigDec(request, "price");


                entity.setActive(is_active);
                entity.setPrice(price);
                entity.setShipping(shipping);


                entity = (Payment) sh.jpa.merge(entity);
                Set<PaymentLang> entityLangs = new HashSet<>();
                for (Language lang : sh.shopSettings.languages) {
                    String name = TestReq.Str(request, "name-" + lang.getIsoCode());//

                    PaymentLang cLang = null;
                    for (PaymentLang entLang : entity.getLangs(sh.jpa)) {
                        if (entLang.getLang().getIsoCode().equals(lang.getIsoCode())) {
                            cLang = entLang;
                        }
                    }
                    if (cLang == null) cLang = new PaymentLang();
                    cLang.setPayment(entity);
                    cLang.setName(name);
                    cLang.setLang(lang);
                    cLang = (PaymentLang) sh.jpa.merge(cLang);
                    entityLangs.add(cLang);
                }
                entity.setLangs(entityLangs);

                String countriesS = TestReq.Str(request,"countries");
                Set<Country> countries = new HashSet<>();
                for(String priceCountryIDS : countriesS.split(",")){
                    Country c = sh.jpa.selectByID(Country.class,TestReq.Int(priceCountryIDS));
                    if(c!=null)countries.add(c);
                }
                entity.setPaymentToCountries(countries);
                sh.jpa.merge(entity);


            }else{
                errors.add("Shipping price limit cannot be added without assigned shipping!");
            }
            //entity = (Payment) sh.jpa.merge(entity);
        }catch (Exception e){
            e.printStackTrace();
            errors.add("Shipping price limit must have range! : "+e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
