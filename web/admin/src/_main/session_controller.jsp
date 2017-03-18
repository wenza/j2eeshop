<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/28/17
  Time: 9:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = (AdminSessionHolder)session.getAttribute("shX");
    if(request.getParameter("logout")!=null){
        /*if(sh.getLogin()!=null){
            sh.getLogin().setTo(new Date());
            daom.merge(sh.getLogin());
        }*/
        sh = new AdminSessionHolder();
    }
    if(sh==null){
        sh = new AdminSessionHolder();
    }
    if(request.getParameter("a")!=null){
        //sh.setArcade(daom.selectArcById(TestReq.Long(request.getParameter("a"))));
    }
    if(request.getParameter("u")!=null){
        /*String username = request.getParameter("u");
        String passwordHash = SHAHashString.main(request.getParameter("p"));
        User u = daom.findUserByLogin(username, passwordHash);
        if(u!=null){
            if(u.isAdmin() || u.isBarman() || u.is11()){
                Login l = new Login();
                l.setFrom(new Date());
                l.setUser(u);
                l.setArcade(sh.getArcade());
                l.setTo(null);
                Login loginOldTest = daom.selectByU(u,sh.getArcade());
                //Login lastArcadeLoginTest = daom.selectByU(u,sh.getArcade());

                if(loginOldTest!=null){
                    l=loginOldTest;
                }else{
                    daom.createLoginHistory(l);
                }
                sh.setUser(u);
                sh.setLogin(l);
            }
        }*/
    }
    session.setAttribute("shX",sh);
    if(request.getParameter("login")!=null){
        %><jsp:include page="../../ajax_user_login.jsp"/><%
    }
%>