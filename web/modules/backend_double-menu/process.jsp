<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Module" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ModuleData" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Language" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = (AdminSessionHolder) session.getAttribute("shX");
    String className = "double-menu";
    Module module = sh.jpa.selectModuleByName(className);
    List<ModuleData> data = sh.jpa.selectModuleData(module);
    for(ModuleData md : data){
        sh.jpa.remove(md);
    }

    for(String dataset : TestReq.StrArr(request,"data-set")){
        //ModuleData md = new ModuleData();

        //String lang = TestReq.Str(dataset);
        String position = TestReq.Str(request,"column2-"+dataset);
        String link = TestReq.Str(request,"column3-"+dataset);

        //md.setColumn1(TestReq.Str(dataset));//lang
        //md.setColumn2();//position

        for(Language langX : sh.shopSettings.languages){
            String localizedLang = TestReq.Str(request,"column4-"+dataset+"-"+langX.getIsoCode());
            //System.out.println("LEL:"+"column4-"+dataset+"-"+langX.getIsoCode()+"          =        "+localizedLang);
            if("".equals(localizedLang)){
                String defaultLangS = TestReq.Str(request,"column4-"+dataset+"-"+sh.shopSettings.defaultLanguage.getIsoCode());
                localizedLang=defaultLangS;
            }
            ModuleData md = new ModuleData();
            md.setColumn1(langX.getIsoCode());
            md.setColumn2(position);
            md.setColumn3(link);
            md.setColumn4(localizedLang);
            md.setModule(module);

            sh.jpa.merge(md);
        }
    }

%>