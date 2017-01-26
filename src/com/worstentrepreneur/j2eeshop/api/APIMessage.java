package com.worstentrepreneur.j2eeshop.api;

public class APIMessage {
    public static final int TYPE_GET = 1;
    public static final int TYPE_POST = 2;
    public static final int TYPE_PUT = 3;
    public static final int TYPE_DELETE = 4;

    public final String path;
    public final int method;
    public final APIObject data;

    public APIMessage(int method, String path, APIObject data) {
        this.method = method;
        this.path = path;
        this.data=data;
    }
    public APIMessage(int method, String path) {
        this.method = method;
        this.path = path;
        this.data=null;
    }
    public APIMessage(){
        this.method = 0;
        this.path = "";
        this.data=null;
    }
}
