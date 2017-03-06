<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.MergeResult" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 3/1/17
  Time: 3:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String head = "";
    String head2 = "";
    String head2Desc = "";
    String body = "";
    String btnNextNew = null;
    String btnBack = null;
    //String btnToList = null;
    String btnContinue = null;
    AdminSessionHolder sh = (AdminSessionHolder) session.getAttribute("shX");
    String pageX = TestReq.Str(request,"page");
    int idX = TestReq.Int(request,"id");
    MergeResult mr = (MergeResult) request.getAttribute("merge-result");
    if(mr!=null){
        if(mr.getErrors().isEmpty()){
            if(idX==0){
                head="<span  class=\"font-green-jungle\">Vytvoření proběhlo vpořádku</span>";
                btnNextNew=sh.nextBtn;
                btnContinue=sh.contBtn;
            }else{
                head="<span class=\"font-green-jungle\">Upravení ("+idX+") proběhlo vpořádku</span>";
                btnBack=sh.backBtn;
                btnContinue=sh.contBtn;
            }
        }else{

            if(idX==0){
                head="<span class=\"font-red-thunderbird\">Nastala chyba při vytváření</span>";
            }else{
                head="<span class=\"font-red-thunderbird\">Nastala chyba při úpravě("+idX+")</span>";
            }
            btnBack = "javascript:history.go(-1)";
            btnContinue=sh.contBtn;
            for(String error : mr.getErrors()){
                body+="<h2 class=\"font-red-thunderbird\">"+error+"</h2>";
            }
        }
        %>
        <!-- BEGIN CONTENT -->
        <div class="page-content-wrapper">
            <!-- BEGIN CONTENT BODY -->
            <div class="page-content">
                <div class="row">
                    <div class="col-md-6 ta-l">
                        <div class="col-md-12 form-group" >
                            <h1><%=head2%></h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12" style="text-align:center;">
                        <div class="portlet light">
                            <div class="portlet-title">
                                <div class="caption" style="width:100%;">
                                    <span class="caption-subject bold uppercase" style="font-size:30px;"> <%=head%></span>
                                    <span class="caption-helper"><%=head2Desc%></span>

                                </div>
                            </div>
                            <div class="portlet-body">
                                <div style="padding: 50px 0;margin-bottom: 20px;border-bottom: 1px solid #eeeeee;">
                                <%if(btnBack!=null){%><a href="<%=btnBack%>" class="btn btn-lg purple">Zpět</a><%}%>
                                <%if(btnNextNew!=null){%><a href="<%=btnNextNew%>" class="btn btn-lg blue">Nový</a><%}%>
                                <%if(btnContinue!=null){%><a href="<%=btnContinue%>" class="btn btn-lg green">Do seznamu</a><%}%>
                                </div>
                                <%=body%><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%


    }
%>