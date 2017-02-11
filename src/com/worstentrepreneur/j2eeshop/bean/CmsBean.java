package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.Cms;
import com.worstentrepreneur.j2eeshop.dao.entity.CmsCategory;
import com.worstentrepreneur.j2eeshop.dao.entity.CmsLang;
import com.worstentrepreneur.j2eeshop.dao.entity.Language;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

public class CmsBean {
    public static MergeResult merge(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Cms entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            AdminSessionHolder sh = AdminSessionHolder.get(session);


            int categoryID = TestReq.Int(request,"cms-category-id");
            CmsCategory cmsCategory = sh.jpa.selectByID(CmsCategory.class,categoryID);

            if(cmsCategory!=null) {

                int entityID = TestReq.Int(request, "id");
                entity = sh.jpa.selectByID(Cms.class, entityID);
                if (entity == null) entity = new Cms();


                boolean is_active = TestReq.Bool(request, "is-active");//on
                String image_url = TestReq.Str(request, "image-url");//
                //int parent_id = TestReq.Int(request, "parent-id");//
                //Cms parent = sh.jpa.selectByID(Cms.class, parent_id);
                int position = TestReq.Int(request, "position");


                entity.setActive(is_active);
                entity.setDateAdd(new Date());
                entity.setDateUpd(new Date());
                entity.setImageURL(image_url);
                entity.setPosition(position);
                entity.setCategory(cmsCategory);


                entity = (Cms) sh.jpa.merge(entity);
                Set<CmsLang> entityLangs = new HashSet<>();
                for (Language lang : sh.shopSettings.languages) {
                    String name = TestReq.Str(request, "name-" + lang.getIsoCode());//
                    String meta_keywords = TestReq.Str(request, "meta-keywords-" + lang.getIsoCode());//
                    String meta_description = TestReq.Str(request, "meta-description-" + lang.getIsoCode());//
                    String description = TestReq.Str(request, "description-" + lang.getIsoCode());//
                    String content = TestReq.Str(request, "content-" + lang.getIsoCode());//
                    String meta_title = TestReq.Str(request, "meta-title-" + lang.getIsoCode());//

                    CmsLang cLang = null;
                    for (CmsLang entLang : entity.getLangs(sh.jpa)) {
                        if (entLang.getLang().getIsoCode().equals(lang.getIsoCode())) {
                            cLang = entLang;
                        }
                    }
                    if (cLang == null) cLang = new CmsLang();
                    cLang.setCms(entity);
                    cLang.setName(name);
                    cLang.setMetaDescription(meta_description);
                    cLang.setMetaKeywords(meta_keywords);
                    cLang.setMetaTitle(meta_title);
                    cLang.setLang(lang);
                    cLang.setDescription(description);
                    cLang.setContent(content);
                    cLang = (CmsLang) sh.jpa.merge(cLang);
                    entityLangs.add(cLang);
                }
                entity.setLangs(entityLangs);


                entity = (Cms) sh.jpa.merge(entity);
            }else{
                errors.add("CMS Category cannot be empty");
            }
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
