package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.Currency;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CurrencyBean {
    public static MergeResult merge(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Currency entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            AdminSessionHolder sh = AdminSessionHolder.get(session);



            int entityID = TestReq.Int(request, "id");
            entity = sh.jpa.selectByID(Currency.class, entityID);
            if (entity == null) entity = new Currency();


            boolean is_active = TestReq.Bool(request, "is-active");//on
            boolean sign_prefix = TestReq.Bool(request,"sign-prefix");//on
            String iso_code_num = TestReq.Str(request,"iso-code-num");//111
            BigDecimal conversion_rate = TestReq.BigDec(request,"conversion-rate");//1
            System.out.println("CAME OUT = "+conversion_rate);
            if(!conversion_rate.equals(BigDecimal.ZERO)){
                conversion_rate= (new BigDecimal(1)).divide(conversion_rate,6,BigDecimal.ROUND_UP);
            }
            System.out.println("CAME OUT2 = "+conversion_rate);
            boolean decimals = TestReq.Bool(request,"decimals");//on
            String name = TestReq.Str(request,"name");//name
            String sign = TestReq.Str(request,"sign");//$ign
            String iso_code = TestReq.Str(request,"iso-code");//iso-code

            entity.setActive(is_active);
            entity.setSignPrefix(sign_prefix);
            entity.setIsoCodeNum(iso_code_num);
            entity.setConversionRate(conversion_rate);
            entity.setDecimals(decimals);
            entity.setSign(sign);
            entity.setIsoCode(iso_code);
            entity.setName(name);


            entity = (Currency) sh.jpa.merge(entity);
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
