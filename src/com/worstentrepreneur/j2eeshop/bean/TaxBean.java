package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.Tax;
import com.worstentrepreneur.j2eeshop.dao.entity.TaxLang;
import com.worstentrepreneur.j2eeshop.dao.entity.Language;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;

public class TaxBean {
    public static MergeResult merge(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Tax entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            AdminSessionHolder sh = AdminSessionHolder.get(session);
            int entityID = TestReq.Int(request, "id");
            entity = sh.jpa.selectByID(Tax.class, entityID);
            if (entity == null) entity = new Tax();


            boolean is_active = TestReq.Bool(request, "is-active");//on
            String image_url = TestReq.Str(request, "image-url");//
            //int parent_id = TestReq.Int(request, "parent-id");//
            //Tax parent = sh.jpa.selectByID(Tax.class, parent_id);
            int position = TestReq.Int(request, "position");

            BigDecimal rate = TestReq.BigDec(request,"rate");

            entity.setActive(is_active);
            entity.setRate(rate);


            entity = (Tax) sh.jpa.merge(entity);
            Set<TaxLang> entityLangs = new HashSet<>();
            for (Language lang : sh.shopSettings.languages) {
                String name = TestReq.Str(request, "name-" + lang.getIsoCode());//

                TaxLang cLang = null;
                for (TaxLang entLang : entity.getLangs(sh.jpa)) {
                    if (entLang.getLang().getIsoCode().equals(lang.getIsoCode())) {
                        cLang = entLang;
                    }
                }
                if (cLang == null) cLang = new TaxLang();
                cLang.setTax(entity);
                cLang.setName(name);
                cLang.setLang(lang);
                cLang = (TaxLang) sh.jpa.merge(cLang);
                entityLangs.add(cLang);
            }
            entity.setLangs(entityLangs);


            entity = (Tax) sh.jpa.merge(entity);
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
