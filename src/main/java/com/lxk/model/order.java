package com.lxk.model;

public class order {
    private String uid;
    private String address;
    private String tel;
    private String content;

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUid() {
        return uid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContent() {
        return content;
    }

    public String getTel() {
        return tel;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
}
