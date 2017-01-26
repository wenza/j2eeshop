package com.worstentrepreneur.j2eeshop.api.objects;

import com.worstentrepreneur.j2eeshop.api.APIObject;

public class UsersTableRow extends APIObject {
    //int idCheckBox = ;
    int id = 1;
    String firstname = "Vaclav";
    String lastname = "Bilek";
    String status = "Pff";
    String ordersSumPrice = "$588";
    String viewButton = "<a href=\"javascript:;\" class=\"btn btn-sm btn-outline grey-salsa\"><i class=\"fa fa-search\"></i> View</a>";

    public UsersTableRow() {
        this.id = 1;
        this.firstname = "Vaclav";
        this.lastname = "Bilek";
        this.status = "Pff";
        this.ordersSumPrice = "$588";
        this.viewButton = "<a href=\"javascript:;\" class=\"btn btn-sm btn-outline grey-salsa\"><i class=\"fa fa-search\"></i> View</a>";
    }
}
