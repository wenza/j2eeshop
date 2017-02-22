package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.Country;
import com.worstentrepreneur.j2eeshop.dao.entity.Shipping;
import com.worstentrepreneur.j2eeshop.dao.entity.ShippingPriceLimit;
import com.worstentrepreneur.j2eeshop.dao.entity.ShippingPriceLimitCountries;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ShippingPriceLimitBean {
    public static MergeResult merge(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        ShippingPriceLimit entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            AdminSessionHolder sh = AdminSessionHolder.get(session);
            int entityID = TestReq.Int(request, "id");
            entity = sh.jpa.selectByID(ShippingPriceLimit.class, entityID);
            if (entity == null) entity = new ShippingPriceLimit();

            Shipping shipping = sh.jpa.selectByID(Shipping.class,TestReq.Int(request,"shipping-id"));

            if(shipping!=null) {
                boolean is_active = TestReq.Bool(request, "is-active");//on
                BigDecimal from_weight = TestReq.BigDec(request, "from-weight");
                BigDecimal to_weight = TestReq.BigDec(request, "to-weight");


                entity.setActive(is_active);
                entity.setFromWeight(from_weight);
                entity.setToWeight(to_weight);
                entity.setShipping(shipping);


                entity = (ShippingPriceLimit) sh.jpa.merge(entity);
                //Set<ShippingPriceLimitCountries> shippingPriceLimitCountries = new HashSet<>();
                for (ShippingPriceLimitCountries splc : sh.jpa.selectShippingPriceLimitCountries(entity)) {
                    sh.jpa.remove(splc);
                }
                for(String fieldVal : TestReq.StrArr(request,"shipping-price-limit-countries-field")){
                    BigDecimal price = TestReq.BigDec(request,fieldVal+"-price");
                    String countriesS = TestReq.Str(request,fieldVal);
                    ShippingPriceLimitCountries spl = new ShippingPriceLimitCountries();
                    spl.setPrice(price);
                    spl.setShippingPriceLimit(entity);
                    Set<Country> countries = new HashSet<>();
                    System.out.println("Splitted JCVD:"+countriesS);
                    for(String priceCountryIDS : countriesS.split(",")){
                        System.out.println("Country");
                        Country c = sh.jpa.selectByID(Country.class,TestReq.Int(priceCountryIDS));
                        if(c!=null)countries.add(c);
                    }
                    spl.setCountries(countries);
                    sh.jpa.merge(spl);
                }

            }else{
                errors.add("Shipping price limit cannot be added without assigned shipping!");
            }
            //entity = (ShippingPriceLimit) sh.jpa.merge(entity);
        }catch (Exception e){
            e.printStackTrace();
            errors.add("Shipping price limit must have range! : "+e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
