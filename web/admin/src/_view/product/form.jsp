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
    Class className = Product.class;
    Product entity = (Product)sh.getJPA().selectByID(className,request);
    String entityName = TestReq.Str(request,"entity");//className.getSimpleName().toLowerCase();
    //Product lastEntity = sh.jpa.selectLast(Product.class);
    int categoryID = TestReq.Int(request,"category-id");
    Category c = sh.jpa.selectByID(Category.class,categoryID);
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <form class="form-horizontal" method="post" role="form" action="?page=entity-process&entity=<%=entityName%>">
            <input type="hidden" name="id" value="<%=entity!=null?entity.getId():0%>"/>
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
                    ProductLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
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

        <div class="portlet-body">
            <div class="tabbable-custom ">
                <ul class="nav nav-tabs ">
                    <li class="active">
                        <a href="#tab_1" data-toggle="tab"> Základní nastavení </a>
                    </li>
                    <li>
                        <a href="#tab_2" data-toggle="tab"> Kombinace </a>
                    </li>
                    <li>
                        <a href="#tab_3" data-toggle="tab"> Rozměry </a>
                    </li>
                    <li>
                        <a href="#tab_4" data-toggle="tab"> Cena </a>
                    </li>
                    <li>
                        <a href="#tab_5" data-toggle="tab"> SEO </a>
                    </li>
                    <li>
                        <a href="#tab_6" data-toggle="tab"> Ostatní </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="form-body tab-pane active basic" id="tab_1">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Výrobce</label>
                                    <div class="col-md-9">
                                        <select class="form-control select2" name="manufacturer-id" >
                                            <%
                                            for(Manufacturer m : sh.jpa.selectAllByID(Manufacturer.class)){
                                                boolean selected = false;
                                                if(entity!=null){
                                                    if(entity.getManufacturer().getId()==m.getId())selected=true;
                                                }
                                                %>
                                                <option value="<%=m.getId()%>" <%=selected?"selected":""%>><%=m.getName()%></option>
                                                <%
                                            }
                                            %>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Aktivní</label>
                                    <div class="col-md-9">
                                        <input  type="checkbox" name="is-active" class="make-switch" checked data-on-color="success" data-off-color="danger"
                                                data-on-text="<i class='fa fa-check'></i>" data-off-text="<i class='fa fa-remove'></i>" <%=entity!=null?entity.isActive()?"checked":"":""%>>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Kategorie</label>
                                    <div class="col-md-9">
                                        <!-- TODO -->
                                        <input name="categories" value="" style="display:none;"/>
                                        <div id="categories-checkbox-tree" class="tree-demo border-default" style="border:1px solid black;padding:5px;"> </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <%
                                    for(Language lang : sh.shopSettings.languages){
                                        ProductLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
                                        %>
                                        <div class="form-group lang-group-<%=lang.getIsoCode()%> lang-group <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode()) ?"shown":""%>">

                                            <label class="col-md-3 control-label">Popis(<%=lang.getIsoCode()%>)</label>
                                            <div class="col-md-9">
                                                <textarea name="description-<%=lang.getIsoCode()%>" class="ckeditor-sm-init form-control"><%=entLang!=null?entLang.getDescription():""%></textarea>
                                            </div>
                                        </div>
                                        <%
                                    }
                                %>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="multi-imgs-container">
                                    <div class="multi-imgs-dropzone">
                                        <div class="multi-img-fileupload cloud" data-name="img-url-1">
                                            <input type="hidden" name="min-width" value="540"/>
                                            <input type="hidden" name="min-height" value="960"/>
                                        </div>

                                        <div class="multi-img">
                                            <div class="multi-img-image" style="background-image:url('/uploads/rglsxfyfsi1486310712607.jpg');"></div>
                                            <div class="iscover">Cover<input type="text" name="img-url-1-cover" value="/uploads/rglsxfyfsi1486310712607.jpg" style="display:none;"/></div>
                                        </div>
                                        <div class="multi-img">
                                            <div class="multi-img-image" style="background-image:url('/uploads/rglsxfyfsi1486310712607.jpg');">
                                                <input type="text" name="img-url-1" value="/uploads/rglsxfyfsi1486310712607.jpg" style="display:none;">
                                            </div>
                                        </div>
                                        <div class="multi-img">
                                            <div class="multi-img-image" style="background-image:url('/uploads/rglsxfyfsi1486310712607.jpg');">
                                                <input type="text" name="img-url-1" value="/uploads/rglsxfyfsi1486310712607.jpg" style="display:none;">
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-body tab-pane combinations" id="tab_2">
                            <div class="form-group">
                                <label for="multiple" class="col-md-1 control-label">Kombinace</label>
                                <div class="col-md-11">
                                    <select id="multiple" class="form-control select2-multiple" name="attribute-value-ids" multiple>
                                        <%
                                        List<AttributeValue> attributeValues = sh.jpa.selectAllByID(AttributeValue.class);
                                        Collections.sort(attributeValues, new Comparator<AttributeValue>() {
                                            @Override
                                            public int compare(AttributeValue o1, AttributeValue o2) {
                                                return o1.getAttribute().getId().compareTo(o2.getAttribute().getId());
                                            }
                                        });
                                        for(AttributeValue av : attributeValues){
                                            AttributeValueLang avl = av.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                            AttributeLang al = av.getAttribute().getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                            boolean selected = false;
                                            for(AttributeValueCombination avc : sh.jpa.selectProductAtributeValueCombinations(entity)){
                                                String combination = ","+avc.getCombination()+",";
                                                if(combination.contains(av.getId()+""))selected=true;
                                            }
                                            %>
                                            <option value="<%=av.getId()%>" <%=selected?"selected":""%>><%=al.getName()%> : <%=avl.getValue()%></option>
                                            <%
                                        }
                                        %>
                                    </select>
                                </div>
                            </div>
                    </div>

                    <div class="form-body tab-pane size" id="tab_3">
                        <div class="container-fluid">
                            <div class="row">
                            <div>
                                <h2>Parametry balíku</h2>
                                <p class="subtitle">Upravte cenu poštovného vyplněním rozměrů balíku produktu.</p>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Šířka</label>
                                    <div class="input-group">
                                        <input type="text" id="form_step4_width" name="width" class="form-control" value="<%=entity!=null?entity.getWidth():0%>">
                                        <span class="input-group-addon">cm</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Výška</label>

                                    <div class="input-group">
                                        <input type="text" id="form_step4_height" name="height" class="form-control" value="<%=entity!=null?entity.getHeight():0%>">
                                        <span class="input-group-addon">cm</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Hloubka</label>

                                    <div class="input-group">
                                        <input type="text" id="form_step4_depth" name="depth" class="form-control" value="<%=entity!=null?entity.getDepth():0%>">
                                        <span class="input-group-addon">cm</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Váha</label>

                                    <div class="input-group">
                                        <input type="text" id="form_step4_weight" name="weight" class="form-control" value="<%=entity!=null?entity.getWeight():0%>">
                                        <span class="input-group-addon">kg</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="form-body tab-pane price" id="tab_4">
                        <div class="row">
                            <div class="col-md-12">
                                <h2>Maloobchodní cena</h2>
                                <%--<p class="subtitle">Zde si můžete nastavit cenu od odběratelů a vaši prodejní cenu pro lepší management.</p>--%>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="price" class="form-control-label">Cena vč. DPH</label>
                                        <div class="input-group">
                                            <input type="text" id="price" name="price" class="form-control product-price" value="<%=entity!=null?entity.getPrice():"0"%>">
                                            <span class="input-group-addon"><%=sh.shopSettings.defaultCurrency.getIsoCode()%></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="product-tax-id" class="form-control-label">DPH</label>
                                        <select id="product-tax-id" class="form-control select2 " name="price-tax-id">
                                            <%
                                            for(Tax tax : sh.jpa.selectAllByID(Tax.class)){
                                                TaxLang tlang = tax.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                                boolean selected = false;
                                                if(entity!=null){
                                                    if(entity.getTax()!=null) {
                                                        if (tax.getId() == entity.getTax().getId()) selected = true;
                                                    }
                                                }else {
                                                    if (tax.getId() == sh.shopSettings.defaultTax.getId())selected = true;
                                                }
                                                %><option value="<%=tax.getId()%>" data-rate="<%=tax.getRate()%>" <%=selected?"selected":""%>><%=tlang.getName()%></option><%
                                            }
                                        %>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="price-without-tax" class="form-control-label">Cena bez DPH</label>
                                        <div class="input-group">
                                            <input type="text" id="price-without-tax" name="price-without-tax" class="form-control" value="0">
                                            <span class="input-group-addon"><%=sh.shopSettings.defaultCurrency.getIsoCode()%></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h2>Nákupní cena</h2>
                                <%--<p class="subtitle">Zde si můžete nastavit cenu od odběratelů a vaši prodejní cenu pro lepší management.</p>--%>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="supplier-price" class="form-control-label">Nákupní cena vč. DPH</label>
                                        <div class="input-group">
                                            <input type="text" id="supplier-price" name="supplier-price" class="form-control" value="<%=entity!=null?entity.getPrice():0%>">
                                            <span class="input-group-addon"><%=sh.shopSettings.defaultCurrency.getIsoCode()%></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="supplier-price-tax-id" class="form-control-label">DPH</label>
                                        <select id="supplier-price-tax-id" class="form-control select2" name="supplier-price-tax-id">
                                            <%
                                            for(Tax tax : sh.jpa.selectAllByID(Tax.class)){
                                                TaxLang tlang = tax.getLang(sh.shopSettings.defaultLanguage,sh.jpa);
                                                boolean selected = false;
                                                if(entity!=null){
                                                    if(entity.getTax()!=null) {
                                                        if (entity.getTax().getId() == tax.getId()) selected = true;
                                                    }
                                                }else {
                                                    if (tax.getId() == sh.shopSettings.defaultTax.getId())selected = true;
                                                }
                                                %><option value="<%=tax.getId()%>" data-rate="<%=tax.getRate()%>" <%=selected?"selected":""%>><%=tlang.getName()%></option><%
                                            }
                                        %>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="supplier-price-without-tax" class="form-control-label">Nákupní cena bez DPH</label>
                                        <div class="input-group">
                                            <input type="text" id="supplier-price-without-tax" name="supplier-price-without-tax" class="form-control" value="<%=entity!=null?entity.getSupplierPrice():0%>">
                                            <span class="input-group-addon"><%=entity!=null?entity.getSupplierCurrency()!=null?entity.getSupplierCurrency().getIsoCode():sh.shopSettings.defaultCurrency.getIsoCode():sh.shopSettings.defaultCurrency.getIsoCode()%></span>
                                        </div>
                                    </div>
                                </div>
                                <%--<div class="col-md-3">
                                    <div class="form-group">
                                        <label for="price-profit-rate-with-tax" class="form-control-label">Profit(daň odečtena)</label>
                                        <div class="input-group">
                                            <input disabled type="text" id="price-profit-rate-with-tax" name="price-profit-rate-with-tax" class="form-control supplier-price-profit-rate-with-tax" value="0">
                                            <span class="input-group-addon"><%=sh.shopSettings.defaultCurrency.getIsoCode()%></span>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-body tab-pane seo" id="tab_5">
                        <div class="form-group">
                            <div class="row">
                                <%
                                    for(Language lang : sh.shopSettings.languages){
                                        ProductLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
                                %>
                                <div class="lang-group-<%=lang.getIsoCode()%> lang-group <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode()) ?"shown":""%>">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Meta titulek(<%=lang.getIsoCode()%>)</label>
                                            <div class="col-md-9">
                                                <input type="text" name="meta-title-<%=lang.getIsoCode()%>" value="<%=entLang!=null?entLang.getMetaTitle():""%>" class="form-control maxlength_alloptions" maxlength="70" >
                                                <%--<span class="help-block"> <code>25 znaků</code> </span>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Meta popis()</label>
                                            <div class="col-md-9">
                                                <input type="text" name="meta-description-<%=lang.getIsoCode()%>" value="<%=entLang!=null?entLang.getMetaDescription():""%>" class="form-control maxlength_alloptions" maxlength="160" >
                                                <%--<span class="help-block"> <code>25 znaků</code> </span>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                %>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <%
                                        for(Language lang : sh.shopSettings.languages){
                                            ProductLang entLang = entity!=null?entity.getLang(lang,sh.jpa):null;
                                    %>
                                    <div class="form-group lang-group-<%=lang.getIsoCode()%> lang-group <%=lang.getIsoCode().equals(sh.shopSettings.defaultLanguage.getIsoCode()) ?"shown":""%>">
                                        <label class="col-md-3 control-label">Meta klíčová slova/tagy(<%=lang.getIsoCode()%>)</label>
                                        <div class="col-md-9">
                                            <input type="text" name="meta-keywords-<%=lang.getIsoCode()%>" value="<%=entLang!=null?entLang.getMetaKeywords():""%>" class="tagsinput-def">
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-body tab-pane others" id="tab_6">

                        <div class="form-group">
                            <div class="col-md-12">
                                <h2></h2>
                                <%--<p class="subtitle">Zde si můžete nastavit cenu od odběratelů a vaši prodejní cenu pro lepší management.</p>--%>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Kód výrobce</label>
                                            <div class="col-md-9">
                                                <input type="text" name="manufacturer-product-code" value="<%=entity!=null?entity.getManufacturerProductCode():""%>" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">EAN13</label>
                                            <div class="col-md-9">
                                                <input type="text" name="ean-13" value="<%=entity!=null?entity.getEan13():""%>" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Interní kód</label>
                                            <div class="col-md-9">
                                                <input type="text" name="shop-product-code" value="<%=entity!=null?entity.getShopProductCode():""%>" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>

<script>

    categoriesTableData = [
    <%
    Category rootCategory = sh.jpa.selectRootCategory();
    if(rootCategory!=null){
        JTreeObj jtree = JTree.categoryEntityToJtreeObj(rootCategory,sh,entity!=null?null:c!=null?c:rootCategory);//TODO
        %>
        <%=sh.objectMapper.writeValueAsString(jtree)%>
        <%
    }

    %>
    ];

</script>