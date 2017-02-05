<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.JPAUtil" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="com.worstentrepreneur.j2eeshop.utils.AttributesCombinationHelper" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
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
    Class className = AttributeValueCombination.class;
    List<AttributeValueCombination> list = sh.getJPA().selectAllByID(className);
    String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();

%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE TITLE-->
        <h1 class="page-title"> Země
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
                                <th> Kombinace </th>
                                <th> Kombinace k vyhledávání </th>
                                <th> Nevzhledové Kombinace </th>
                                <th> Nevzhledové Kombinace k vyh. </th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                AttributesCombinationHelper.generateCombinations(sh.jpa);

                                for(AttributesCombinationHelper ach : AttributesCombinationHelper.getHelpers(list,sh)){

                                    %>
                                    <tr class="odd gradeX">
                                        <td><%=ach.getAvc().getId()%></td>
                                        <td><%=ach.getCombinationString()%></td>
                                        <td><%=ach.getSearchString()%></td>
                                        <td><%=ach.getAppearanceString()%></td>
                                        <td><%=ach.getAppearanceSearchString()%></td>
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
