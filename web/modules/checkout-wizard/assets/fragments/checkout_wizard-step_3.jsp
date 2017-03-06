<%@ page import="com.worstentrepreneur.utils.CustomerSessionHolder" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Address" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Country" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.CountryLang" %>
<%@ page import="com.worstentrepreneur.utils.TestReq" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.worstentrepreneur.j2eeshop.dao.entity.Order" %>
<%@ page import="com.worstentrepreneur.j2eeshop.bean.AddressBean" %><%--
  Created by IntelliJ IDEA.
  User: wenza
  Date: 1/23/17
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerSessionHolder sh = CustomerSessionHolder.get(session);
%>
<div>
    <div class="col-md-6 " style="padding-left:5px;padding-right:5px;">
        <div>
            <h2 style="display:inline-block;">Dodací adresa</h2>
            <span>
                Všechny údaje které mají vedle názvu * jsou povinné,
            </span>
        </div>
    </div>
    <div class="col-md-6" style="padding-left:5px;padding-right:5px;text-align:right;">

        <h2 style="display:inline-block;">&nbsp;</h2>
        <span>
            <select class="form-control block">
                <option>Předvyplnit z Vašich předešlých adres</option>
                <%
                    for(Address addr : sh.jpa.selectCustomerAddresses(sh.customer)){
                        %>
                        <option
                            data-id="<%=addr.getId()%>"
                            data-company="<%=addr.getCompany()%>"
                            data-lastname="<%=addr.getLastname()%>"
                            data-firstname="<%=addr.getFirstname()%>"
                            data-address-1="<%=addr.getAddress1()%>"
                            data-address-2="<%=addr.getAddress2()%>"
                            data-postcode="<%=addr.getPostcode()%>"
                            data-city="<%=addr.getCity()%>"
                            data-other="<%=addr.getOther()%>"
                            data-phone="<%=addr.getPhone()%>"
                            data-dni="<%=addr.getDni()%>"
                            data-active="<%=addr.isActive()%>"
                            data-deleted="<%=addr.isDeleted()%>"
                            data-vat-number="<%=addr.getVatNumber()%>">
                            <%=addr.getAddress1()%>, <%=addr.getCity()%>
                        </option>
                        <%
                    }
                %>
            </select>
        </span>

    </div>
    <div class="col-md-12"></div>
    <div class="col-md-6" style="padding-left:5px;padding-right:5px;">
        <div class="form-group form-md-line-input sm">
            <input type="text" class="form-control ta-l" name="address-firstname" placeholder="JMÉNO*"/>
            <span class="help-block ta-l" >JMÉNO*</span>
        </div>
        <div class="form-group form-md-line-input sm">
            <input type="text" class="form-control ta-l" name="address-lastname" placeholder="PŘÍJMENÍ*"/>
            <span class="help-block ta-l" >PŘÍJMENÍ*</span>
        </div>
        <div class="form-group form-md-line-input sm">
            <input type="text" class="form-control ta-l" name="address-phone" placeholder="MOBIL*"/>
            <span class="help-block ta-l" >MOBIL</span>
        </div>
        <div class="md-checkbox" style="margin-top:18px;">
            <input type="checkbox" id="billing-address-checkbox" name="billing-address-checkbox" class="md-check" checked>
            <label for="billing-address-checkbox">
                <span class="inc"></span>
                <span class="check"></span>
                <span class="box"></span> Fakturační adresa je stejná jako dodací adresa
            </label>
        </div>

    </div>
    <div class="col-md-6" style="padding-left:5px;padding-right:5px;">
        <div class="form-group form-md-line-input sm">
            <select name="address-country" class="form-control">
                <%
                    for(Country c : sh.jpa.selectAllByID(Country.class)){
                        CountryLang clang = c.getLang(sh.getLang(),sh.jpa);
                        %><option value="<%=c.getId()%>"><%=clang.getName()%></option><%
                    }
                %>
            </select>

            <%--<input type="text" class="form-control ta-l" name="address-country" value="Česká Republika" placeholder="ZĚMĚ*" disabled/>--%>
            <span class="help-block ta-l" >ZEMĚ*</span>
        </div>
        <div class="form-group form-md-line-input sm" <%--style="width:49%;display:inline-block;margin-bottom:3px;"--%>>
            <input type="text" class="form-control ta-l" name="address-address1" placeholder="ULICE A ČÍSLO POPISNÉ*" style="margin-top:0;"/>
            <span class="help-block ta-l" >ULICE*</span>
        </div>
        <%--<div class="form-group form-md-line-input sm" style="width:50%;display:inline-block;margin-bottom:3px;">
            <input type="text" class="form-control ta-l" name="" placeholder="*" style="margin-top:0;"/>
            <span class="help-block ta-l" >ČÍSLO POPISNÉ*</span>
        </div>--%>
        <div class="form-group form-md-line-input sm">
            <input type="text" class="form-control ta-l" name="address-city" placeholder="MĚSTO*"/>
            <span class="help-block ta-l" >MĚSTO*</span>
        </div>
        <div class="form-group form-md-line-input sm">
            <input type="text" class="form-control ta-l" name="address-postcode" placeholder="PSČ*"/>
            <span class="help-block ta-l" >PSČ*</span>
        </div>
    </div>
    <div class="billing-address-container" style="display:none;">
        <div class="col-md-12 " style="padding-left:5px;padding-right:0;">
            <div class="col-md-6 no-padding"><h2>Fakturační adresa</h2></div>
                <div class="col-md-6 no-padding" style="padding-left:5px;padding-right:5px;text-align:right;">
                    <h2 style="display:inline-block;">&nbsp;</h2>
                    <span>
                    <select class="form-control block">
                        <option>Předvyplnit z Vašich předešlých adres</option>
                        <%
                            for(Address addr : sh.jpa.selectCustomerAddresses(sh.customer)){
                        %>
                                <option
                                        data-id="<%=addr.getId()%>"
                                        data-company="<%=addr.getCompany()%>"
                                        data-lastname="<%=addr.getLastname()%>"
                                        data-firstname="<%=addr.getFirstname()%>"
                                        data-address-1="<%=addr.getAddress1()%>"
                                        data-address-2="<%=addr.getAddress2()%>"
                                        data-postcode="<%=addr.getPostcode()%>"
                                        data-city="<%=addr.getCity()%>"
                                        data-other="<%=addr.getOther()%>"
                                        data-phone="<%=addr.getPhone()%>"
                                        data-dni="<%=addr.getDni()%>"
                                        data-active="<%=addr.isActive()%>"
                                        data-deleted="<%=addr.isDeleted()%>"
                                        data-vat-number="<%=addr.getVatNumber()%>">
                                    <%=addr.getAddress1()%>, <%=addr.getCity()%>
                                </option>
                                <%
                                    }
                                %>
                    </select>
                </span>
            </div>
        </div>

        <div class="col-md-6" style="padding-left:5px;padding-right:5px;">
            <div class="form-group form-md-line-input sm">
                <input type="text" class="form-control ta-l" name="bill-address-company" placeholder="NÁZEV FIRMY*"/>
                <span class="help-block ta-l" >Název firmy*</span>
            </div>
            <%--<div class="form-group form-md-line-input sm">
                <input type="text" class="form-control ta-l" name="bill-address-lastname" placeholder="PŘÍJMENÍ*"/>
                <span class="help-block ta-l" >IČ</span>
            </div>--%>
            <div class="form-group form-md-line-input sm">
                <input type="text" class="form-control ta-l" name="bill-address-firstname" placeholder="JMÉNO*"/>
                <span class="help-block ta-l" >JMÉNO*</span>
            </div>
            <div class="form-group form-md-line-input sm">
                <input type="text" class="form-control ta-l" name="bill-address-lastname" placeholder="PŘÍJMENÍ*"/>
                <span class="help-block ta-l" >PŘÍJMENÍ*</span>
            </div>
            <div class="form-group form-md-line-input sm">
                <input type="text" class="form-control ta-l" name="bill-address-phone" placeholder="MOBIL*"/>
                <span class="help-block ta-l" >MOBIL</span>
            </div>

        </div>
        <div class="col-md-6" style="padding-left:5px;padding-right:5px;">
            <div class="form-group form-md-line-input sm">
                <select name="bill-address-country" class="form-control">
                    <%
                    for(Country c : sh.jpa.selectAllByID(Country.class)){
                        CountryLang clang = c.getLang(sh.getLang(),sh.jpa);
                        %><option value="<%=c.getId()%>"><%=clang.getName()%></option><%
                    }
                %>
                </select>
            </div>
            <div class="form-group form-md-line-input sm" <%--style="width:49%;display:inline-block;margin-bottom:3px;"--%>>
                <input type="text" class="form-control ta-l" name="bill-address-address1" placeholder="ULICE A ČÍSLO POPISNÉ*" style="margin-top:0;"/>
                <span class="help-block ta-l" >ULICE*</span>
            </div>
            <%--<div class="form-group form-md-line-input sm" style="width:50%;display:inline-block;margin-bottom:3px;">
                <input type="text" class="form-control ta-l" name="" placeholder="*" style="margin-top:0;"/>
                <span class="help-block ta-l" >ČÍSLO POPISNÉ*</span>
            </div>--%>
            <div class="form-group form-md-line-input sm">
                <input type="text" class="form-control ta-l" name="bill-address-city" placeholder="MĚSTO*"/>
                <span class="help-block ta-l" >MĚSTO*</span>
            </div>
            <div class="form-group form-md-line-input sm">
                <input type="text" class="form-control ta-l" name="bill-address-postcode" placeholder="PSČ*"/>
                <span class="help-block ta-l" >PSČ*</span>
            </div>
        </div>

        <%--<div class="col-md-6" style="padding-left:5px;padding-right:5px;">
            <div class="form-group form-md-line-input sm">
                <input type="text" class="form-control ta-l" name="" placeholder="JMÉNO*"/>
                <span class="help-block ta-l" >JMÉNO*</span>
            </div>
            <div class="form-group form-md-line-input sm">
                <input type="text" class="form-control ta-l" name="" placeholder="PŘÍJMENÍ*"/>
                <span class="help-block ta-l" >PŘÍJMENÍ*</span>
            </div>
            <div class="form-group form-md-line-input sm">
                <input type="text" class="form-control ta-l" name="" placeholder="MOBIL*"/>
                <span class="help-block ta-l" >MOBIL</span>
            </div>

        </div>
        <div class="col-md-6" style="padding-left:5px;padding-right:5px;">
            <div class="form-group form-md-line-input sm">
                <input type="text" class="form-control ta-l" name="country" value="Česká Republika" placeholder="ZĚMĚ*" disabled/>
                <span class="help-block ta-l" >ZEMĚ*</span>
            </div>
            <div class="form-group form-md-line-input sm" style="width:49%;display:inline-block;margin-bottom:3px;">
                <input type="text" class="form-control ta-l" name="" placeholder="ULICE*" style="margin-top:0;"/>
                <span class="help-block ta-l" >ULICE*</span>
            </div>
            <div class="form-group form-md-line-input sm" style="width:50%;display:inline-block;margin-bottom:3px;">
                <input type="text" class="form-control ta-l" name="" placeholder="ČÍSLO POPISNÉ*" style="margin-top:0;"/>
                <span class="help-block ta-l" >ČÍSLO POPISNÉ*</span>
            </div>
            <div class="form-group form-md-line-input sm">
                <input type="text" class="form-control ta-l" name="" placeholder="MĚSTO*"/>
                <span class="help-block ta-l" >MĚSTO*</span>
            </div>
            <div class="form-group form-md-line-input sm">
                <input type="text" class="form-control ta-l" name="" placeholder="PSČ*"/>
                <span class="help-block ta-l" >PSČ*</span>
            </div>
        </div>--%>
    </div>
    <%--<div class="col-md-12 " style="padding-left:5px;">
        <div class="md-checkbox">
            <input type="checkbox" id="billing-address-checkbox" class="md-check" checked>
            <label for="billing-address-checkbox">
                <span class="inc"></span>
                <span class="check"></span>
                <span class="box"></span> Fakturační adresa je stejná jako dodací adresa
            </label>
        </div>
    </div>--%>
</div>
<script>

    $("#billing-address-checkbox").change(function() {
        if(this.checked) {
            //Do stuff
            $('.billing-address-container').hide();
        }else{
            $('.billing-address-container').show();
        }
    });
</script>