package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.*;
import com.worstentrepreneur.j2eeshop.utils.AttributesCombinationHelper;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;

public class ProductBean {
    public static MergeResult merge(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Product entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            AdminSessionHolder sh = AdminSessionHolder.get(session);
            int entityID = TestReq.Int(request, "id");
            entity = sh.jpa.selectByID(Product.class, entityID);
            if (entity == null) entity = new Product();


            boolean is_active = TestReq.Bool(request, "is-active");//on
            BigDecimal weight = TestReq.BigDec(request,"weight");//40
            BigDecimal depth = TestReq.BigDec(request,"depth");//30
            BigDecimal width = TestReq.BigDec(request,"width");//10
            BigDecimal height = TestReq.BigDec(request,"height");//20
            String shop_product_code = TestReq.Str(request,"shop-product-code");//shop123
            String manufacturer_product_code = TestReq.Str(request,"manufacturer-product-code");//man123
            BigDecimal price = TestReq.BigDec(request,"price");//50
            BigDecimal supplier_price = TestReq.BigDec(request,"supplier-price");//60
            String ean_13 = TestReq.Str(request,"ean-13");//EAN123
            //TODO:int position = TestReq.Int(request, "position");


            entity.setActive(is_active);
            entity.setDateAdd(new Date());
            entity.setDateUpd(new Date());
            entity.setWeight(weight);
            entity.setDepth(depth);
            entity.setWidth(width);
            entity.setHeight(height);
            entity.setShopProductCode(shop_product_code);
            entity.setManufacturerProductCode(manufacturer_product_code);
            entity.setPrice(price);
            entity.setSupplierPrice(supplier_price);
            entity.setEan13(ean_13);


            entity = (Product) sh.jpa.merge(entity);
            Set<ProductLang> entityLangs = new HashSet<>();
            for (Language lang : sh.shopSettings.languages) {
                String name = TestReq.Str(request, "name-" + lang.getIsoCode());//
                String meta_keywords = TestReq.Str(request, "meta-keywords-" + lang.getIsoCode());//
                String meta_description = TestReq.Str(request, "meta-description-" + lang.getIsoCode());//
                String description = TestReq.Str(request, "description-" + lang.getIsoCode());//
                String meta_title = TestReq.Str(request, "meta-title-" + lang.getIsoCode());//

                ProductLang cLang = null;
                for (ProductLang entLang : entity.getLangs(sh.jpa)) {
                    if (entLang.getLang().getIsoCode().equals(lang.getIsoCode())) {
                        cLang = entLang;
                    }
                }
                if (cLang == null) cLang = new ProductLang();
                cLang.setProduct(entity);
                cLang.setName(name);
                cLang.setDescription(description);
                cLang.setMetaDescription(meta_description);
                cLang.setMetaKeywords(meta_keywords);
                cLang.setMetaTitle(meta_title);
                cLang.setLang(lang);
                cLang = (ProductLang) sh.jpa.merge(cLang);
                entityLangs.add(cLang);
            }
            entity.setLangs(entityLangs);


            Set<AttributeValueCombination> combinations = AttributesCombinationHelper.requestAttrVal2AVC(request,sh);
            //TODO:entity.setAttributeValueCombinations(combinations);


            entity = (Product) sh.jpa.merge(entity);
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
