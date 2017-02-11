package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.*;
import com.worstentrepreneur.j2eeshop.dao.entity.Currency;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

public class CountryBean {
    public static MergeResult merge(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Country entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            AdminSessionHolder sh = AdminSessionHolder.get(session);
            int entityID = TestReq.Int(request, "id");
            entity = sh.jpa.selectByID(Country.class, entityID);
            if (entity == null) entity = new Country();


            boolean is_active = TestReq.Bool(request, "is-active");//on
            boolean contains_states = TestReq.Bool(request, "contains-states");//on
            String iso_code = TestReq.Str(request,"iso-code");
            int call_prefix = TestReq.Int(request,"call-prefix");
            String zip_code_format = TestReq.Str(request,"zip-code-format");

            int currencyID = TestReq.Int(request,"currency-id");
            Currency currency = sh.jpa.selectByID(Currency.class,currencyID);
            

            entity.setActive(is_active);
            entity.setCallPrefix(call_prefix);
            entity.setContainsStates(contains_states);
            entity.setCurrency(currency);
            entity.setIsoCode(iso_code);
            entity.setZipCodeFormat(zip_code_format);


            entity = (Country) sh.jpa.merge(entity);
            Set<CountryLang> entityLangs = new HashSet<>();
            for (Language lang : sh.shopSettings.languages) {
                String name = TestReq.Str(request, "name-" + lang.getIsoCode());//

                CountryLang cLang = null;
                for (CountryLang entLang : entity.getLangs(sh.jpa)) {
                    if (entLang.getLang().getIsoCode().equals(lang.getIsoCode())) {
                        cLang = entLang;
                    }
                }
                if (cLang == null) cLang = new CountryLang();
                cLang.setCountry(entity);
                cLang.setName(name);
                cLang.setLang(lang);
                cLang = (CountryLang) sh.jpa.merge(cLang);
                entityLangs.add(cLang);
            }
            entity.setLangs(entityLangs);


            entity = (Country) sh.jpa.merge(entity);
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
