package com.worstentrepreneur.j2eeshop.utils;

import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class NaviCheck {
    //USED ON FORM PAGES
    public static void nextBack(HttpServletRequest request){
        int id = TestReq.Int(request,"id");
        if(id==0){
            next(request);
        }else{
            back(request);
        }
    }
    //NOT USED
    public static void next(HttpServletRequest request){
        //in every form - when id == 0; - shouldnt be needed
        AdminSessionHolder sh = AdminSessionHolder.get(request.getSession());
        String url = request.getRequestURL().toString().replaceAll("index\\.jsp","")+"?"+request.getQueryString();
        int id = TestReq.Int(request,"id");
        if(id==0){
            //User was adding new item
            sh.nextBtn=url;
        }
        sh.update(request.getSession());
    }
    //NOT USED
    public static void back(HttpServletRequest request){
        //in every form - when id != 0;
        AdminSessionHolder sh = AdminSessionHolder.get(request.getSession());
        String url = request.getRequestURL().toString().replaceAll("index\\.jsp","")+"?"+request.getQueryString();
        int id = TestReq.Int(request,"id");
        if(id!=0){
            //User was adding new item
            sh.backBtn=url;
        }
        sh.update(request.getSession());
    }
    //USED ON LIST PAGES
    public static void contin(HttpServletRequest request){
        //in every list? and different at modules (delivery / payment)

        AdminSessionHolder sh = AdminSessionHolder.get(request.getSession());
        String url = request.getRequestURL().toString().replaceAll("index\\.jsp","")+"?"+request.getQueryString();
        sh.contBtn=url;
        sh.update(request.getSession());
    }
}
