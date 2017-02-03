package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.Category;
import com.worstentrepreneur.j2eeshop.dao.entity.CategoryLang;
import com.worstentrepreneur.j2eeshop.dao.entity.Language;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

public class CategoryBean {
    public static MergeResult merge(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Category entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            AdminSessionHolder sh = AdminSessionHolder.get(session);
            int entityID = TestReq.Int(request, "id");
            entity = sh.jpa.selectByID(Category.class, entityID);
            if (entity == null) entity = new Category();


            boolean is_active = TestReq.Bool(request, "is-active");//on
            String image_url = TestReq.Str(request, "image-url");//
            int parent_id = TestReq.Int(request, "parent-id");//
            Category parent = sh.jpa.selectByID(Category.class, parent_id);
            int position = TestReq.Int(request, "position");
            int levelDepth = 0;
            int nLeft = 0;
            boolean isRootCategory = true;

            if (parent != null) {
                levelDepth = parent.getLevelDepth() + 1;
                nLeft = parent.getNleft()+1;
            } else {

                System.out.println("ARG");
                Category rootCategory = sh.jpa.selectRootCategory();
                if(rootCategory!=null) {
                    if (rootCategory.getId() != entityID) {
                        errors.add("Category must have parent");
                    }
                }
                System.out.println("ZARG");
            }
            if (errors.size() == 0) {
                //System.out.println("Settings-"+parent.getId());
                entity.setParent(parent);
                entity.setActive(is_active);
                entity.setDateAdd(new Date());
                entity.setDateUpd(new Date());
                entity.setImageURL(image_url);
                entity.setLevelDepth(levelDepth);
                entity.setNleft(nLeft);
                entity.setPosition(position);
                entity.setRootCategory(isRootCategory);


                entity = (Category) sh.jpa.merge(entity);
                Set<CategoryLang> entityLangs = new HashSet<>();
                for (Language lang : sh.shopSettings.languages) {
                    String name = TestReq.Str(request, "name-" + lang.getIsoCode());//
                    String meta_keywords = TestReq.Str(request, "meta-keywords-" + lang.getIsoCode());//
                    String meta_description = TestReq.Str(request, "meta-description-" + lang.getIsoCode());//
                    String description = TestReq.Str(request, "description-" + lang.getIsoCode());//
                    String meta_title = TestReq.Str(request, "meta-title-" + lang.getIsoCode());//

                    CategoryLang cLang = null;
                    for (CategoryLang entLang : entity.getLangs(sh.jpa)) {
                        if (entLang.getLang().getIsoCode().equals(lang.getIsoCode())) {
                            cLang = entLang;
                        }
                    }
                    if (cLang == null) cLang = new CategoryLang();
                    cLang.setCategory(entity);
                    cLang.setName(name);
                    cLang.setDescription(description);
                    cLang.setMetaDescription(meta_description);
                    cLang.setMetaKeywords(meta_keywords);
                    cLang.setMetaTitle(meta_title);
                    cLang.setLang(lang);
                    cLang = (CategoryLang) sh.jpa.merge(cLang);
                    entityLangs.add(cLang);
                }
                entity.setLangs(entityLangs);
                entity = (Category) sh.jpa.merge(entity);
            }
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
