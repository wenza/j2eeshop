<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.JPAUtil" %>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="java.util.Set" %>
<%@ page import="javax.persistence.ManyToOne" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="com.fasterxml.jackson.annotation.JsonProperty" %>
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
    Class className = Product.class;
    List<Product> list = sh.getJPA().selectAllByID(className);
    String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();

%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE TITLE-->
        <h1 class="page-title"> Produkty
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
                                <th> Název </th>
                                <th> Kategorie </th>
                                <th> EAN13 </th>
                                <th> Kód výrobce </th>
                                <th> Kód v shopu </th>
                                <th> Počet ks skladem </th>
                                <th> Daň </th>
                                <th> Cena </th>
                                <th> Akce </th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for(Product o : list){
                                    ProductLang ol = o.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                        TaxLang t = o.getTax().getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                    %>
                                    <tr class="odd gradeX">
                                        <td>
                                            <%=o.getId()%>
                                        </td>
                                        <td class="center"> <%=ol.getName()%> </td>
                                        <td><%=o.getCategory().getLang(sh.shopSettings.defaultLanguage,sh.jpa).getName()%></td>
                                        <td> <%=o.getEan13()%></td>
                                        <td> <%=o.getManufacturerProductCode()%></td>
                                        <td> <%=o.getShopProductCode()%></td>
                                        <td> <%=o.getQuantity()%></td>
                                        <td> <%=t.getName()+" ("+o.getTax().getRate()+"%)"%></td>
                                        <td> <%=o.getPrice()+" ("+o.getCurrency().getIsoCode()+") "%></td>
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
