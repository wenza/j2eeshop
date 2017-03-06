<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.OrderState" %>
<%@ page import="com.worstentrepreneur.utils.MailContent" %>
<%@ page import="com.worstentrepreneur.utils.SendMailTLS" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.OrderStateLang" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Order" %>
<%@ page import="com.worstentrepreneur.j2eeshop.bean.OrderBean" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.MergeResult" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/23/17
  Time: 11:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
    if(TestReq.Bool(request,"order-submit")){
        MergeResult result = OrderBean.completeOrder(request,session);
        if(result.getEntity()!=null){
            Order o = (Order) result.getEntity();


            %>
            <div class="dynamic-height dynamic-center">
                <div class="dynamic-center-content">

                    <div class="container">
                        <div class="ta-c">
                            <div class="container-fluid row ta-c ccc-c-pink" >
                                <h1>Objednávka byla úspěšně provedena!</h1>
                            </div>
                            <div class="container">
                                <p>O stavu vaší objednávky číslo <h2>"<%=o.getId()%>"</h2> budete informování e-mailem a v případě komplikací telefonicky.</p>
                                <p>Děkujeme za vaši objednávku,</p>
                                <h2>Tým <span class="ccc-c-pink"><%=sh.shopSettings.getShopTeamName()%></span></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>loadDynamicHeight();</script>

            <%
        }
    }
%>