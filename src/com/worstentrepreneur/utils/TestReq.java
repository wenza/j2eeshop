package com.worstentrepreneur.utils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Map;

public class TestReq {
    public static boolean Bool(HttpServletRequest request,String s){
        String str = Str(request,s);
        if(str.equals("on")){
            return true;
        }else if(str.equals("1")){
            return true;
        }else if(str.equals("true")){
            return true;
        }else{
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
        entityType=entityType.substring(0,1).toUpperCase()+entityType.substring(1);
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
