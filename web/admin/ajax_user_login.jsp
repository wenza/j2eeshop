<%@ page import="com.worstentrepreneur.utils.TestReq" %><%@ page import="com.worstentrepreneur.utils.StringEncoder" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %><%@ page import="com.worstentrepreneur.j2eeshop.dao.MergeResult" %><%@ page import="java.util.ArrayList" %><%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%
    AdminSessionHolder sh = AdminSessionHolder.get(session);
    List<String> errors = new ArrayList<>();
    
    String email = TestReq.Str(request,"email");
    String pwd = TestReq.Str(request,"password");
    pwd= StringEncoder.main(pwd);
    User user = sh.jpa.selectAUserByLogin(email,pwd);
    System.out.println("Looking");
    if(user !=null){
        sh.setUser(user);
        sh.update(session);
    }else{
        errors.add("Přihlašovací údaje nejsou správné, opakujte přihlášení.");
    }


    MergeResult result = new MergeResult(user,errors);

    BrowserInfo browser = new BrowserInfo(request);
    browser = (BrowserInfo)sh.jpa.merge(browser);

    if(result.getErrors().isEmpty()){
        UserLogin login = new UserLogin(user, browser,"<span class=\"ccc-color-green\">Vpořádku</span>");
        sh.jpa.merge(login);
    }else{
        String html = "";
        html+="<div class=\"ulog-error ccc-color-red\">Email: <span class=\"ulog-email\">"+ email +"</span><br>" +
                "PassHash: <span class=\"ulog-pwd\">"+pwd+"</span><br>"+
                "<ul class=\"ulog-errors\">";
            for(String err: errors){
                html+="<li>"+err+"</li>";
            }
            html+="</ul></div>";
        UserLogin login = new UserLogin(null, browser,html);
        sh.jpa.merge(login);
    }
    System.out.println("A");
    try{
        System.out.println(sh.objectMapper.writeValueAsString(result));
    }catch(Exception e ){
        e.printStackTrace();
    }
    System.out.println("B");
%><%=sh.objectMapper.writeValueAsString(result) %>