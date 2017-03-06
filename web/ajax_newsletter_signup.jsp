<%@ page import="com.worstentrepreneur.j2eeshop.dao.MergeResult" %><%@ page import="java.util.ArrayList" %><%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="com.worstentrepreneur.utils.*" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);

    List<String> errors = new ArrayList<>();
    
    String email = TestReq.Str(request,"mail");

    String className = "newsletter";
    Module module = sh.jpa.selectModuleByName(className);
    BrowserInfo bi = new BrowserInfo(request);
    bi = (BrowserInfo) sh.jpa.merge(bi);
    ModuleData md = null;
    if(Validator.mailValidate(email)) {
        if(sh.jpa.selectModuleDataWithColumn1(module, email).isEmpty()) {
            md = new ModuleData(module);
            System.out.println("mdvx-"+md.getModule());
            sh.smdv(md,"record.email",email);
            if(sh.customer!=null) {
                sh.smdv(md, "record.customer-id", sh.customer.getId()+"");
            }
            if(bi!=null) {
                sh.smdv(md, "record.browser-info-id", bi.getId() + "");
            }
            sh.smdv(md,"record.opted-date-long",new Date().getTime()+"");
            sh.smdv(md,"record.optout-date-long",null);

            md = (ModuleData)sh.jpa.merge(md);
        }else{
            errors.add("Email '"+email+"' je již přidaný do newsletteru.");
        }
    }else{
        errors.add("Email '"+email+"' nemá správný formát, např. martin@kyovsky.cz");
    }

    MergeResult result = new MergeResult(md,errors);

%><%=sh.objectMapper.writeValueAsString(result) %>