package com.worstentrepreneur.j2eeshop.dao.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by b00lean on 3/9/14.
 */
@Entity
@Table(name = "customer_login")
public class CustomerLogin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private long id=0;

    @ManyToOne//(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    private Customer customer;
    private Date createdAt;
    @ManyToOne
    private BrowserInfo browserinfo;
    @Column(columnDefinition="TEXT")
    private String message;

    public CustomerLogin(){

    }

    public CustomerLogin(Customer customer, BrowserInfo browser, String message) {
        this.customer = customer;
        this.createdAt = new Date();
        this.message = message;
        this.browserinfo=browser;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public BrowserInfo getBrowserinfo() {
        return browserinfo;
    }

    public void setBrowserinfo(BrowserInfo browserinfo) {
        this.browserinfo = browserinfo;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
