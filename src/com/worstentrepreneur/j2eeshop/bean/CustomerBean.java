package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.*;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.CustomerSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

public class CustomerBean {
    public static MergeResult createDefault(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Customer entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            /*===========PRECONSTRUCTED VARIABLES============*/
            CustomerSessionHolder sh = CustomerSessionHolder.get(session);
            int entityID = TestReq.Int(request, "id");
            entity = sh.jpa.selectByID(Customer.class, entityID);
            if (entity == null) entity = new Customer();

            entity= new Customer();
            entity.setActive(true);
            entity.setDeleted(false);
            entity.setGroup(null);
            entity.setLanguage(sh.userLang);
            entity.setCompany("");
            entity.setFirstname("");
            entity.setLastname("");
            entity.setEmail(null);
            entity.setPasswd(null);
            entity.setBirthday(null);
            entity.setNewsletter(false);
            entity.setNote("");
            //entity.setAddressList();
            entity.setGuest(true);
            entity.setDeleted(false);
            entity.setDateAdd(new Date());
            entity.setDateUpd(new Date());


            entity = (Customer) sh.jpa.merge(entity);
            sh.customer=entity;
            sh.update(session);
        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
