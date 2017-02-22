<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page import="com.worstentrepreneur.utils.AdminSessionHolder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTree" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTreeObj" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.*" %>
<%@ page import="com.worstentrepreneur.j2eeshop.utils.AttributesCombinationHelper" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.worstentrepreneur.utils.jtree.JTreeState" %>

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
    Class className = Payment.class;
    Payment entity = (Payment)sh.getJPA().selectByID(className,request);
    String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();
    Shipping shipping = sh.jpa.selectByID(Shipping.class,TestReq.Int(request,"shipping-id"));
    //Payment lastEntity = sh.jpa.selectLast(Payment.class);
    //int categoryID = TestReq.Int(request,"category-id");
    //Category c = sh.jpa.selectByID(Category.class,categoryID);
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="?page=entity-process&entity=<%=entityName%>">
            <input type="hidden" name="id" value="<%=entity!=null?entity.getId():0%>"/>
            <input type="hidden" name="shipping-id" value="<%=shipping!=null?shipping.getId():0%>"/>
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE TITLE-->
            <%--<h1 class="page-title"> Produkt
                <small></small>
                <button type="submit" class="btn sbold green pull-right bg-green-jungle bg-font-green-jungle">
                    <i class="fa fa-check"></i> Uložit
                </button>
            </h1>--%>
            <div class="page-title" style="margin-top:0;">
                <div class="row">
                    <div class="col-md-6 ta-l">
                    <%
                    for(Language lang : sh.shopSettings.languages){
                        PaymentLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
                        %>
                            <div class="col-md-12 form-group lang-group-<%=lang.getIsoCode()%> lang-group <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode()) ?"shown":""%>">
                                <label class="col-md-3 control-label" style="text-align:left;margin:0;padding:0;">Název(<%=lang.getIsoCode()%>)</label>
                                <div class="col-md-9">
                                    <input type="text" name="name-<%=lang.getIsoCode()%>" class="form-control"  value="<%=entLang!=null?entLang.getName():""%>">
                                </div>
                            </div>
                        <%
                    }
                    %>
                    </div>
                    <div class="col-md-6 ta-r">
                        <button type="submit" style="margin-left:20px;" class="btn btn-circle green-jungle btn-outline pull-right active">Uložit</button>
                        <span class="pull-right font-grey-salsa" style="margin-left:15px;">|</span>
                        <%
                        for(Language lang : sh.shopSettings.languages){
                            %>
                            <a style="margin-left:10px;" class="btn btn-circle green btn-outline lang-group-activator pull-right <%=sh.shopSettings.defaultLanguage.getId()==lang.getId()?"active":""%>" data-iso-code="<%=lang.getIsoCode()%>"> <%=lang.getName()%> (<%=lang.getIsoCode()%>) </a>
                            <%
                        }
                        %>
                    </div>
                </div>
            </div>

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
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-3 control-label">Poštovné</label>
                        <div class="col-md-9">
                            <div class="input-group">
                                <input class="form-control" type="number" name="price" value="<%=entity!=null?entity.getPrice():0%>"/>
                                <span class="input-group-addon"><%=sh.shopSettings.defaultCurrency.getIsoCode()%></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-3 control-label">Podporované státy</label>
                        <div class="col-md-9">

                            <input name="countries" class="jcvd" value="" style="display:none;"/>
                            <div data-counter="0" class="countries-checkbox-tree tree-demo border-default" style="border:none;padding:0px;"> </div>
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
                                                boolean checked = entity!=null?sh.jpa.selectPaymentCountries(entity).contains(cc)?true:false:false;
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
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </div>
</div>

