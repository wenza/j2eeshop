package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.Manufacturer;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

public class ManufacturerBean {
    public static MergeResult merge(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Manufacturer entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            AdminSessionHolder sh = AdminSessionHolder.get(session);



            int entityID = TestReq.Int(request, "id");
            entity = sh.jpa.selectByID(Manufacturer.class, entityID);
            if (entity == null) entity = new Manufacturer();


            boolean is_active = TestReq.Bool(request, "is-active");//on
            String name = TestReq.Str(request, "name");

            entity.setActive(is_active);
            entity.setDateAdd(new Date());
            entity.setDateUpd(new Date());
            entity.setName(name);


            entity = (Manufacturer) sh.jpa.merge(entity);
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
