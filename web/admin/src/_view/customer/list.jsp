<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Customer" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%--
Created by IntelliJ IDEA.
User: wenza
Date: 6/3/14
Time: 10:30 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = (AdminSessionHolder) session.getAttribute("shX");
    Class className = Customer.class;
    List<Customer> list = sh.getJPA().selectAllByIDDesc(className);
    String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();

%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE TITLE-->
        <h1 class="page-title"> Daňové sazby
            <small></small>
            <a href="?page=entity-form&entity=<%=entityName%>" class="btn sbold green pull-right">
                <i class="fa fa-plus"></i> Přidat
            </a>
        </h1>
        <!-- END PAGE TITLE-->
        <!-- END PAGE HEADER-->
        <%--<div class="note note-info">
            <p> Here will be homepage dashboard </p>
        </div>--%>
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                <div ><%--class="portlet light bordered">--%>
                        <div ><%--class="portlet-body">--%>
                        <table class="table table-striped table-bordered table-hover order-column" id="sample_1_donotinit">
                            <thead>
                            <tr>
                                <th>
                                    #
                                </th>
                                <th> Jméno </th>
                                <th> Email </th>
                                <th> Skupina </th>
                                <th> Poznámka </th>
                                <th> Adresy </th>
                                <th> Aktivní </th>
                                <th> Akce </th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for(Customer o : list){
                                    //CustomerLang ol = o.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                    %>
                                    <tr class="odd gradeX">
                                        <td>
                                            <%=o.getId()%>
                                        </td>
                                        <td class="center"> <%=o.getFirstname()+" "+o.getLastname()%> </td>
                                        <td>
                                            <%=o.getEmail()%>
                                        </td>
                                        <td><%=o.getGroup()%></td>
                                        <td>
                                            <%=o.getNote()%>
                                        </td>
                                        <td>
                                            <%=o.getAddressList(sh.jpa).size()%>
                                        </td>
                                        <td class="center">
                                            <%if(o.isActive()){
                                                %><span aria-hidden="true" class="icon-check font-green-jungle font-lg"></span> &nbsp; </span><%
                                            }else{
                                                %><span aria-hidden="true" class="icon-close font-red-thunderbird font-lg"></span> &nbsp; </span><%
                                            }%>
                                        </td>
                                        <td>
                                            <a href="?page=entity-form&entity=<%=entityName.toLowerCase()%>&id=<%=o.getId()%>" class="btn btn-sm btn-outline grey-salsa"><i class="fa fa-search"></i> Zobrazit</a>
                                            <a href="javascript:;" class="btn btn-sm red btn-outline grey-salsa"><i class="fa fa-times"></i> Deaktivovat</a>
                                        </td>
                                    </tr>
                                    <%
                                }
                            %>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END CONTENT BODY -->
</div>
