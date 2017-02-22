<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.JPAUtil" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Currency" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Country" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CountryLang" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.ContinentLang" %>
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
    Class className = Country.class;
    List<Country> list = sh.getJPA().selectAllByID(className);
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
                                <th> Kontinent </th>
                                <th> Název </th>
                                <th> ISO kód </th>
                                <th> Předvolba volání </th>
                                <th> Měna </th>
                                <th> Formát PSČ </th>
                                <th> Aktivní </th>
                                <th> Akce </th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for(Country o : list){
                                    CountryLang ol = o.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                    ContinentLang cont = o.getContinent().getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                    %>
                                    <tr class="odd gradeX">
                                        <td>
                                            <%=o.getId()%>
                                        </td>
                                        <td><%=cont.getName()%></td>
                                        <td class="center"> <%=ol.getName()%> </td>
                                        <td><%=o.getIsoCode()%></td>
                                        <td><%=o.getCallPrefix()%></td>
                                        <td><%
                                        if(o.getCurrency()!=null){
                                            Currency curr = o.getCurrency();
                                            %>
                                            Název: <%=curr.getName()%><br>
                                            iso kód: <%=curr.getIsoCode()%><br>
                                            iso: <%=curr.getIsoCodeNum()%><br>
                                            Konverze: <%=curr.getConversionRate()%><br>
                                            znak: <%=curr.getSign()%><br>
                                            <%
                                        }
                                        %></td>
                                        <td><%=o.getZipCodeFormat()%></td>
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
