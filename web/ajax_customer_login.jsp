<%@ page import="com.worstentrepreneur.utils.TestReq" %><%@ page import="com.worstentrepreneur.utils.StringEncoder" %><%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CustomerLogin" %><%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.BrowserInfo" %><%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Customer" %><%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %><%@ page import="com.worstentrepreneur.j2eeshop.dao.MergeResult" %><%@ page import="java.util.ArrayList" %><%@ page import="java.util.List" %><%@ page contentType="text/html;charset=UTF-8" language="java" %><%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
    List<String> errors = new ArrayList<>();
    
    String email = TestReq.Str(request,"email");
    String pwd = TestReq.Str(request,"password");
    pwd= StringEncoder.main(pwd);
    Customer customer = sh.jpa.selectUserByLogin(email,pwd);
    if(customer !=null){
        sh.customer=customer;
        sh.update(session);
    }else{
        errors.add("Přihlašovací údaje nejsou správné, opakujte přihlášení.");
    }


    MergeResult result = new MergeResult(customer,errors);

    BrowserInfo browser = new BrowserInfo(request);
    browser = (BrowserInfo)sh.jpa.merge(browser);

    if(result.getErrors().isEmpty()){
        CustomerLogin login = new CustomerLogin(customer, browser,"<span class=\"ccc-color-green\">Vpořádku</span>");
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
        CustomerLogin login = new CustomerLogin(null, browser,html);
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