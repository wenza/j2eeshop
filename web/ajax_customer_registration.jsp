<%@ page import="java.util.List" %><%@ page import="java.util.ArrayList" %><%@ page import="com.worstentrepreneur.utils.*" %><%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Customer" %><%@ page import="com.worstentrepreneur.j2eeshop.dao.MergeResult" %><%@ page contentType="text/html;charset=UTF-8" language="java" %><%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
    List<String> errors = new ArrayList<>();

    Customer customer = null;
    //if(dao.checkUsername(username))error+="<li>Username is already taken.</li>";
    //if(username.length()<5)error+="<li>Username must be at least 5 chars.</li>";
    String email = TestReq.Str(request,"email");
    String pwd = TestReq.Str(request,"password");
    if(pwd.length()<5)errors.add("Heslo musí mít minimálně 5 znaků.");
    if(!Validator.mailValidate(email))errors.add("Email nemá správný formát.");
    if(sh.jpa.checkEmail(email))errors.add("Emailová adresa je již registrována.");

    if(errors.size()==0){
        try {
            customer = new Customer();
            customer.setPasswd(StringEncoder.main(pwd));
            customer.setEmail(email);
            customer.setActive(true);
            customer.setGuest(false);
            customer = (Customer) sh.jpa.merge(customer);
            sh.customer=customer;
            sh.update(session);
        }catch (Exception e){
            errors.add("Neznámá chyba při vkládání klienta do databáze");
        }
    }
    MergeResult result = new MergeResult(customer,errors);
%><%=sh.objectMapper.writeValueAsString(result)%>