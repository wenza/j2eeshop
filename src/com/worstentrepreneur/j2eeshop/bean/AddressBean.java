package com.worstentrepreneur.j2eeshop.bean;

import com.worstentrepreneur.j2eeshop.dao.MergeResult;
import com.worstentrepreneur.j2eeshop.dao.entity.*;
import com.worstentrepreneur.j2eeshop.utils.AttributesCombinationHelper;
import com.worstentrepreneur.utils.AdminSessionHolder;
import com.worstentrepreneur.utils.CustomerSessionHolder;
import com.worstentrepreneur.utils.TestReq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

public class AddressBean {
    public static MergeResult merge(HttpServletRequest request, HttpSession session){
        List<String> errors = new ArrayList<>();
        Address entity = null;
        try {
            TestReq.printParams(request);
            TestReq.printProcessJSPHeader(request);
            if(request.getParameter("address-lastname")!=null && request.getParameter("address-firstname")!=null) {
            /*===========PRECONSTRUCTED VARIABLES============*/
                CustomerSessionHolder sh = CustomerSessionHolder.get(session);

                int entityID = TestReq.Int(request, "id");
                entity = sh.jpa.selectByID(Address.class, entityID);
                if (entity == null) entity = new Address();

                Order order = sh.order;

                String address_lastname = TestReq.Str(request, "address-lastname");//
                String address_firstname = TestReq.Str(request, "address-firstname");//
                int address_country = TestReq.Int(request, "address-country");//1
                String address_postcode = TestReq.Str(request, "address-postcode");//
                String address_phone = TestReq.Str(request, "address-phone");//
                String address_address1 = TestReq.Str(request, "address-address1");//
                String address_city = TestReq.Str(request, "address-city");//
                Address address = new Address();
                address.setCustomer(sh.customer);
                address.setManufacturer(null);
                address.setAlias(null);
                address.setCompany("");
                address.setCountry(sh.jpa.selectByID(Country.class, address_country));
                address.setLastname(address_lastname);
                address.setFirstname(address_firstname);
                address.setAddress1(address_address1);
                address.setAddress2("");
                address.setPostcode(address_postcode);
                address.setCity(address_city);
                address.setOther("");
                address.setPhone(address_phone);
                address.setDni("");
                address.setActive(true);
                address.setDeleted(false);
                address.setVatNumber("");
                address.setDateAdd(new Date());
                address.setDateUpd(new Date());
                address = (Address) sh.jpa.merge(address);

                order.setAddressDelivery(address);

                if (TestReq.Bool(request, "billing-address-checkbox")) {

                    String bill_address_phone = TestReq.Str(request, "bill-address-phone");//
                    String bill_address_postcode = TestReq.Str(request, "bill-address-postcode");//
                    String bill_address_company = TestReq.Str(request, "bill-address-company");//
                    String bill_address_lastname = TestReq.Str(request, "bill-address-lastname");//
                    String bill_address_firstname = TestReq.Str(request, "bill-address-firstname");//
                    int bill_address_country = TestReq.Int(request, "bill-address-country");//1
                    String bill_address_city = TestReq.Str(request, "bill-address-city");//
                    String bill_address_address1 = TestReq.Str(request, "bill-address-address1");//
                    Address billAddress = new Address();
                    billAddress.setCustomer(sh.customer);
                    billAddress.setManufacturer(null);
                    billAddress.setAlias("");
                    billAddress.setCompany(bill_address_company);
                    billAddress.setLastname(bill_address_lastname);
                    billAddress.setFirstname(bill_address_firstname);
                    billAddress.setAddress1(bill_address_address1);
                    billAddress.setAddress2("");
                    billAddress.setCountry(sh.jpa.selectByID(Country.class, bill_address_country));
                    billAddress.setPostcode(bill_address_postcode);
                    billAddress.setCity(bill_address_city);
                    billAddress.setOther("");
                    billAddress.setPhone(bill_address_phone);
                    billAddress.setDni("");
                    billAddress.setActive(true);
                    billAddress.setDeleted(false);
                    billAddress.setVatNumber("");
                    billAddress.setDateAdd(new Date());
                    billAddress.setDateUpd(new Date());

                    billAddress = (Address) sh.jpa.merge(billAddress);
                    order.setAddressInvoice(billAddress);
                }

                order = (Order) sh.jpa.merge(order);
                sh.order = order;
                sh.update(session);


                entity = (Address) sh.jpa.merge(entity);
            }

        }catch (Exception e){
            e.printStackTrace();
            errors.add(e.getMessage());
        }
        return new MergeResult(entity, errors);
    }
}
