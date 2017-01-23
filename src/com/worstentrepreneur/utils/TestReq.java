package com.worstentrepreneur.utils;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;

public class TestReq {
	public static int Int(HttpServletRequest request,String s){
		int i = 0;
		if(s!=null){
            try{
                i= Integer.parseInt(request.getParameter(s));
            }catch (Exception e){

            }
        }
		return i;
	}
    public static long Long(HttpServletRequest request,String s){
        try {
            return s != null ? Long.parseLong(request.getParameter(s)) : 0;
        }catch (Exception e){
            return 0;
        }
    }
    public static String Str(HttpServletRequest request,String s){
        if(request.getParameter(s)==null){
            s="";
        }else{
            s=request.getParameter(s);
        }
        return s;
    }
    public static BigDecimal BigDec(HttpServletRequest request,String s){
        BigDecimal result = BigDecimal.ZERO;
        try{
            result = new BigDecimal(request.getParameter(s).replace(",",".").replace(" ",""));
        }catch(NumberFormatException e){}
        return result;
    }
    public static double Double(HttpServletRequest request,String s){
        double i = 0;
        try{
            i= Double.parseDouble(request.getParameter(s));
        }catch (Exception e){}
        return i;
    }
}
