package com.worstentrepreneur.j2eeshop.dao.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by b00lean on 3/9/14.
 */
@Entity
@Table(name = "user_login")
public class UserLogin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private long id=0;

    @ManyToOne//(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    private User user;
    private Date createdAt;
    @ManyToOne
    private BrowserInfo browserinfo;
    @Column(columnDefinition="TEXT")
    private String message;

    public UserLogin(){

    }

    public UserLogin(User user, BrowserInfo browser, String message) {
        this.user = user;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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
