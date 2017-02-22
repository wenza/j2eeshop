package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.Shipping;
import com.worstentrepreneur.j2eeshop.dao.entity.ShippingLang;
import com.worstentrepreneur.j2eeshop.dao.entity.Currency;
import com.worstentrepreneur.j2eeshop.dao.entity.Language;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ShippingBean {
    public static MergeResult merge(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Shipping entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            AdminSessionHolder sh = AdminSessionHolder.get(session);
            int entityID = TestReq.Int(request, "id");
            entity = sh.jpa.selectByID(Shipping.class, entityID);
            if (entity == null) entity = new Shipping();


            boolean is_active = TestReq.Bool(request, "is-active");//on
            boolean contains_states = TestReq.Bool(request, "contains-states");//on
            String iso_code = TestReq.Str(request,"iso-code");
            int call_prefix = TestReq.Int(request,"call-prefix");
            String zip_code_format = TestReq.Str(request,"zip-code-format");

            int currencyID = TestReq.Int(request,"currency-id");
            Currency currency = sh.jpa.selectByID(Currency.class,currencyID);
            

            entity.setActive(is_active);


            entity = (Shipping) sh.jpa.merge(entity);
            Set<ShippingLang> entityLangs = new HashSet<>();
            for (Language lang : sh.shopSettings.languages) {
                String name = TestReq.Str(request, "name-" + lang.getIsoCode());//

                ShippingLang cLang = null;
                for (ShippingLang entLang : entity.getLangs(sh.jpa)) {
                    if (entLang.getLang().getIsoCode().equals(lang.getIsoCode())) {
                        cLang = entLang;
                    }
                }
                if (cLang == null) cLang = new ShippingLang();
                cLang.setShipping(entity);
                cLang.setName(name);
                cLang.setLang(lang);
                cLang = (ShippingLang) sh.jpa.merge(cLang);
                entityLangs.add(cLang);
            }
            entity.setLangs(entityLangs);


            entity = (Shipping) sh.jpa.merge(entity);
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
