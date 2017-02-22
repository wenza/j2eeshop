<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTreeObj" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTreeState" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%--
Created by IntelliJ IDEA.
User: wenza
Date: 6/3/14
Time: 10:30 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminSessionHolder sh = AdminSessionHolder.get(session);
    Class className = ShippingPriceLimit.class;
    ShippingPriceLimit entity = (ShippingPriceLimit)sh.getJPA().selectByID(className,request);
    String entityName = TestReq.Str(request,"entity");
    int shippingID = TestReq.Int(request,"shipping-id");
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="?page=entity-process&entity=<%=entityName%>">
            <input type="hidden" name="id" value="<%=entity!=null?entity.getId():0%>"/>
            <input type="hidden" name="shipping-id" value="<%=shippingID%>"/>
            <div class="page-title" style="margin-top:0;">
                <div class="row">
                    <div class="col-md-6 ta-l">
                        <div class="col-md-12 form-group" >
                            <h1>Cenový limit</h1>
                        </div>
                    </div>
                    <div class="col-md-6 ta-r">
                        <button type="submit" style="margin-left:20px;" class="btn btn-circle green-jungle btn-outline pull-right active">Uložit</button>
                    </div>
                </div>
            </div>

            <div class="portlet-body">
                <div class="form-body " >
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Aktivní</label>
                                <div class="col-md-9">
                                    <input  type="checkbox" name="is-active" class="make-switch" data-on-color="success" data-off-color="danger"
                                            data-on-text="<i class='fa fa-check'></i>" data-off-text="<i class='fa fa-remove'></i>" <%=entity!=null?entity.isActive()?"checked":"":"checked"%>>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Od kg (včetně)</label>
                                <div class="col-md-9">
                                    <input  type="text" name="from-weight" value="<%=entity!=null?entity.getFromWeight():"0"%>" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">do kg (včetně)</label>
                                <div class="col-md-9">
                                    <input  type="number" name="to-weight" value="<%=entity!=null?entity.getToWeight():"9999"%>" class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN Portlet PORTLET-->
                    <div class="portlet light">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-speech"></i>
                                <span class="caption-subject bold uppercase"> Ceny a země</span>
                                <span class="caption-helper">nastavení</span>
                            </div>
                            <div class="actions">
                                <%--<a href="javascript:;" class="btn btn-circle btn-default">
                                    <i class="fa fa-pencil"></i> Edit </a>--%>
                                <a class="btn btn-circle btn-default add-shipping-price-limit-countries">
                                    <i class="fa fa-plus"></i> Přidat</a>
                                <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;"> </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-hover order-column" id="sample_1_donotinit">
                                <thead>
                                <tr>
                                    <th> Země </th>
                                    <th> Cena </th>
                                    <th> Akce </th>
                                </tr>
                                </thead>
                                <tbody class="tbody-add-shipping-price-limit-countries">

                                <%
                                    int counter = 0;
                                    for(ShippingPriceLimitCountries shippingPriceLimit : sh.jpa.selectShippingPriceLimitCountries(entity)){
                                        int shippingPriceLimitCountriesID = shippingPriceLimit.getId();
                                        List<Country> countriesX = sh.jpa.selectShippingPriceLimitCountriesCountries(shippingPriceLimit);
                                        %>
                                        <tr id="countries-rm-<%=shippingPriceLimitCountriesID%>" class="odd gradeX ">
                                            <td>

                                                <input name="shipping-price-limit-countries-field" value="shipping-price-limit-<%=shippingPriceLimitCountriesID%>-countries" style="display:none;"/>
                                                <input name="shipping-price-limit-<%=shippingPriceLimitCountriesID%>-countries" class="jcvd" value="" style="display:none;"/>
                                                <div data-counter="<%=counter%>" class="countries-checkbox-tree tree-demo border-default" style="border:none;padding:0px;"> </div>
                                                <script>
                                                    multipleJTreeData.push(
                                                        [
                                                        <%
                                                        List<JTreeObj> parentChildren = new ArrayList<>();
                                                        boolean mainOpened = false;
                                                        for(Continent c : sh.jpa.selectAllByID(Continent.class)){
                                                            List<JTreeObj> countries = new ArrayList<>();
                                                            boolean opened = false;
                                                            for(Country cc : sh.jpa.selectContinentCountries(c)){

                                                                CountryLang countryLang = cc.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                                                boolean checked = countriesX.contains(cc)?true:false;
                                                                JTreeState cState = new JTreeState(checked,false,false);
                                                                JTreeObj cJTreeObj = new JTreeObj(cc.getId(), "none", countryLang.getName(), cState, new ArrayList<JTreeObj>());
                                                                countries.add(cJTreeObj);
                                                                if(checked)opened=true;
                                                            }


                                                            ContinentLang continentLang = c.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                                            JTreeState state = new JTreeState(false,false,opened);
                                                            JTreeObj jTreeObj = new JTreeObj(0, "none", continentLang.getName(), state, countries);//0 is simply to be ignored
                                                            parentChildren.add(jTreeObj);
                                                            if(opened)mainOpened=true;
                                                        }


                                                        JTreeState parentState = new JTreeState(false,false,mainOpened);
                                                        JTreeObj parent = new JTreeObj(0, "none", "Všechny země", parentState, parentChildren);//0 is simply to be ignored
                                                        %>
                                                        <%=sh.objectMapper.writeValueAsString(parent)%>
                                                    ]);
                                                </script>
                                            </td>


                                            <td>
                                                <div class="input-group">
                                                    <input class="form-control" type="number" name="shipping-price-limit-<%=shippingPriceLimitCountriesID%>-countries-price" value="<%=shippingPriceLimit.getPrice()%>"/>
                                                    <span class="input-group-addon"><%=sh.shopSettings.defaultCurrency.getIsoCode()%></span>
                                                </div>

                                            <td>
                                                <a href="javascript:;" class="btn btn-sm red btn-outline grey-salsa btn-id-rm" data-id-to-rm="countries-rm-<%=shippingPriceLimitCountriesID%>"><i class="fa fa-times"></i> Odebrat</a>
                                            </td>
                                        </tr>
                                        <%
                                        counter++;
                                    }
                                %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END Portlet PORTLET-->
                </div>
            </div>
        </form>
    </div>
</div>


