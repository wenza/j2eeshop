<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/23/17
  Time: 11:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    CustomerSessionHolder sh = (CustomerSessionHolder)session.getAttribute("shC");
    int currentStep = TestReq.Int(request,"step");
    if(currentStep==0)currentStep=1;
    int stepsCount = sh.customer==null?5:4;
    double stepPercentage = 100/stepsCount;
    double currentPercentage = stepPercentage*currentStep;
%>
<div class="spacer-big"></div>
<div class="">
    <%
    if(sh.customer==null?currentStep>2:currentStep>1){
        %>
        <a href="?page=checkout&step=<%=currentStep-1%>" class="btn pull-left" ><i class="fa fa-angle-left"></i> ZPĚT </a>
        <%
    }
    if(currentStep==stepsCount){//show as last step
        %>
        <%--<a class="btn btn-black pull-right">POTVRDIT OBJEDNÁVKU</a>--%>
        <input name="order-submit" value="true" style="display:none;"/>
        <button type="submit" class="btn btn-black pull-right checkout-next">POTVRDIT OBJEDNÁVKU</button>
        <%
    }else{//doesnt show for step 1
        if(sh.customer==null?(currentStep>=3):true){
            %>
            <button type="submit" class="btn btn-black pull-right checkout-next">POKRAČOVAT</button>
            <%
        }
        if(sh.customer==null && currentStep==1){
            %><a href="?page=checkout&step=<%=currentStep+1%>" class="btn btn-black pull-right checkout-next">POKRAČOVAT</a><%
        }

    }
    %>
</div>

<script>
    <%
    for(int i = 1;i<=currentStep;i++){
      %>$('.step-<%=i%>').addClass('active');<%
    }
    %>
    $('.checkout-progress-bar').css('width',(<%=currentPercentage%>)+'%');
</script>