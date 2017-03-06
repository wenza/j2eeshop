<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="themes_shared/_main/session_controller.jsp"/>
<%
    if(request.getAttribute("redirect")!=null){
        response.sendRedirect(request.getAttribute("redirect")+"");
    }else{
        %>
        <jsp:include page="themes/fashion-white/index.jsp"/>
        <%
    }
%>