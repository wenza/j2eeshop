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

            Manufacturer manufacturer = sh.jpa.selectByID (Manufacturer.class,TestReq.Int(request,"manufacturer-id"));//1
            Tax priceTax = sh.jpa.selectByID (Tax.class,TestReq.Int(request,"price-tax-id"));//1
            Tax supplierPriceTax = sh.jpa.selectByID (Tax.class,TestReq.Int(request,"supplier-price-tax-id"));//1


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

            entity.setManufacturer(manufacturer);
            entity.setTax(priceTax);
            entity.setSupplierTax(supplierPriceTax);

            //INITIAL MERGE!
            entity = (Product) sh.jpa.merge(entity);


            Set<Category> categories = new HashSet<>();
            String categoryIDs = TestReq.Str(request,"categories");//7,12
            System.out.println("CATEGORIESIDS="+categoryIDs);
            for(String catIDS : categoryIDs.split(",")){
                Category c = sh.jpa.selectByID(Category.class,TestReq.Int(catIDS));
                System.out.println("Found category="+c);
                if(c!=null)categories.add(c);
            }
            entity.setCategories(categories);

            //Set<ProductImage> productImages = new HashSet<>();
            String cover = TestReq.Str(request,"img-url-1-cover");
            //DELETE ALL IMAGES WHICH HAS THIS PRODUCT BEFORE
            if(entity!=null){
                for(ProductImage pi : sh.jpa.selectProductImages(entity)){
                    sh.jpa.remove(pi);
                }
                ProductImage productImage = new ProductImage();
                productImage.setImageURL(cover);
                productImage.setProduct(entity);
                productImage.setCover(true);
                productImage = (ProductImage) sh.jpa.merge(productImage);
                System.out.println("Adding Cover product image "+productImage.getId());
                //productImages.add(productImage);
            }
            for(String imagePath : request.getParameterValues("img-url-1")){
                boolean isCover = false;
                //if(imagePath.equals(cover))isCover=true;
                ProductImage productImage = new ProductImage();
                productImage.setImageURL(imagePath);
                productImage.setProduct(entity);
                productImage.setCover(isCover);
                productImage = (ProductImage) sh.jpa.merge(productImage);
                System.out.println("Adding product image "+productImage.getId());
                //productImages.add(productImage);
            }
            //entity.setImages(productImages);

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


            //Set<ProductAttrCombination> attrCombinations = new HashSet<>();
            Set<AttributeValueCombination> combinations = AttributesCombinationHelper.requestAttrVal2AVC(request,sh);
            //DELETE ALL COMBINATIONS WHICH HAS THIS PRODUCT BEFORE
            if(entity!=null){
                for(ProductAttrCombination pac : sh.jpa.selectProductCombinationsEntity(entity)){
                    for(ProductAttrCombinationImage pacImg : sh.jpa.selectProductCombinationImages(pac)){
                        sh.jpa.remove(pacImg);
                    }
                    sh.jpa.remove(pac);
                }
            }
            for(AttributeValueCombination avc : combinations){
                ProductAttrCombination pac = new ProductAttrCombination();
                pac.setProduct(entity);
                pac.setCombination(avc);
                pac = (ProductAttrCombination) sh.jpa.merge(pac);
                System.out.println("Adding combination "+avc.getId());
                //attrCombinations.add(pac);
            }
            //entity.setAttributeValueCombinations(combinations);


            entity = (Product) sh.jpa.merge(entity);
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
