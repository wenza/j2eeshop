package com.worstentrepreneur.utils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

public class TestReq {
    public static boolean Bool(HttpServletRequest request,String s){
        String str = Str(request,s);
        return Bool(str);
    }
    public static boolean Bool(String str){
        try {
            if (str.equals("on")) {
                return true;
            } else if (str.equals("1")) {
                return true;
            } else if (str.equals("true")) {
                return true;
            } else {
                return false;
            }
        }catch (Exception e){
            System.out.println("Unknown boolean for :"+str+" returning: false");
            return false;
        }

    }
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
    public static int Int(String s){
        int i = 0;
        if(s!=null){
            try{
                i= Integer.parseInt(s);
            }catch (Exception e){}
        }
        return i;
    }
    /*public static String getParamsStr(HttpServletRequest){

    }*/
    public static String[] StrArr(HttpServletRequest request,String name){
        String[] attributeValuesS = request.getParameterValues(name);
        if(attributeValuesS==null)return new String[]{};
        return attributeValuesS;
    }
    public static Date Date(String longString){
        Date date = new Date();
        if(longString!=null){
            try{
                date= new Date( Long(longString) );
            }catch (Exception e){}
        }
        return date;
    }
    public static long Long(HttpServletRequest request,String s){
        try {
            return s != null ? Long.parseLong(request.getParameter(s)) : 0;
        }catch (Exception e){
            return 0;
        }
    }
    public static long Long(String s){
        try {
            return s != null ? Long.parseLong(s) : 0;
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
    public static String Str(String s){
        if(s==null){
            s="";
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
    public static void printParams(HttpServletRequest request){
        System.out.println("=========REQUEST PARAMETERS===========");
        Map<String, String[]> parameters = request.getParameterMap();
        for(String parameter : parameters.keySet()) {
            String[] values = parameters.get(parameter);
            for(String value : values) {
                System.out.println(parameter + "=" + value);
            }
        }
    }
    public static void printProcessJSPHeader(HttpServletRequest request){
        Map<String, String[]> parameters = request.getParameterMap();
        String entityType = TestReq.Str(request,"entity");
        if(!"".equals(entityType)) {
            entityType = entityType.substring(0, 1).toUpperCase() + entityType.substring(1);
        }
        String jspBeginning = "/*===========PRECONSTRUCTED VARIABLES============*/\n"+
                "AdminSessionHolder sh = AdminSessionHolder.get(session);\n" +
                "int entityID = TestReq.Int(request,\"id\");\n" +
                ""+entityType+" entity = sh.getJPA().selectByID("+entityType+".class,entityID);\n" +
                "if(entity==null)entity = new "+entityType+"();\n\n";
        for(String parameter : parameters.keySet()) {
            if(!parameter.equals("min-width") && !parameter.equals("min-height") && !parameter.equals("page") && !parameter.equals("entity")) {
                String[] values = parameters.get(parameter);
                if(values!=null) {
                    for (String value : values) {
                        jspBeginning += "String " + parameter.replaceAll("-","_") + " = TestReq.Str(request,\"" + parameter + "\");//" + value + "\n";
                    }
                }else{
                    jspBeginning += "String " + parameter.replaceAll("-","_") + " = TestReq.Str(request,\"" + parameter + "\");\n";

                }
            }
        }
        System.out.println(jspBeginning);
        try{
            File f = new File("/home/wenza/projects/lovelili/web/tests/generator.txt");
            if(!f.exists())f.createNewFile();
            PrintWriter writer = new PrintWriter(f.getAbsolutePath(), "UTF-8");
            writer.println(jspBeginning);
            writer.close();
        } catch (IOException e) {
            // do something
            e.printStackTrace();
        }
    }
}
