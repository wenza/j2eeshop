<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/23/17
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);

    TestReq.printParams(request);
    TestReq.printProcessJSPHeader(request);
    int currentStep = TestReq.Int(request,"step");
    if(currentStep==0 || currentStep==1){
        /*if(sh.customer!=null){
            currentStep=2;
        }else {
            currentStep = 1;
        }*/
        currentStep = 1;
    }
    if(currentStep>=1 && currentStep<=5){
        request.setAttribute("step", currentStep);
%>
<jsp:include page="assets/fragments/numbering_and_progress.jsp"/>
<div class="dynamic-height dynamic-center">
    <div class="dynamic-center-content">

        <div class="container">
            <form method="post" action="?page=checkout&step=<%=currentStep+1%>">
                <div class="col-md-12">
                    <%
                        System.out.println("============================++C================"+currentStep);
                        if(sh.customer==null?currentStep==1:currentStep==1){
                            %><jsp:include page="assets/fragments/checkout_wizard-step_1.jsp"/><%
                        }else if(sh.customer==null?currentStep==2:false){
                            %><jsp:include page="assets/fragments/checkout_wizard-step_2.jsp"/><%
                        }else if(sh.customer==null?currentStep==3:currentStep==2){
                            %><jsp:include page="assets/fragments/checkout_wizard-step_3.jsp"/><%
                        }else if(sh.customer==null?currentStep==4:currentStep==3){
                            %><jsp:include page="assets/fragments/checkout_wizard-step_4.jsp"/><%
                        }else{
                            %><jsp:include page="assets/fragments/checkout_wizard-step_5.jsp"/><%
                        }
                    %>
                    <%--TODO:<jsp:include page="assets/fragments/checkout_wizard-step_${param.step}.jsp" flush="true"/>--%>

                    <jsp:include page="assets/fragments/action_buttons.jsp"/>
                </div>
            </form>
            <div class="spacer-sm"></div>
        </div>
    </div>
</div>
<script>loadDynamicHeight();</script>
<%
    /*sh = CustomerSessionHolder.get(session);
    if(sh.order!=null && currentStep!=-1){
        if(sh.order.getProducts().size()==0){//basket is empty
            <script>window.location.replace("?page=checkout&step=-1");</script>
        }
    }
    if(currentStep==1) {//choose login or not

    }else if(currentStep==2){//insert addresses, have to have customer and order
        if(sh.customer==null || sh.order==null){
            <script>window.location.replace("?page=checkout&step=1");</script>
        }
    }else if(currentStep==3){

    }*/
}


%>