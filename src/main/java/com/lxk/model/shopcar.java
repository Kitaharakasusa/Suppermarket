package com.lxk.model;

public class shopcar {
    private String uid;
    private int gid;
    private String gname;
    private int gnum;
    private float danjia;
    private float zongjia;
    public int getGid() {
        return gid;
    }

    public int getGnum() {
        return gnum;
    }

    public String getGname() {
        return gname;
    }

    public String getUid() {
        return uid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public void setGnum(int gnum) {
        this.gnum = gnum;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public float getDanjia() {
        return danjia;
    }

    public float getZongjia() {
        return zongjia;
    }

    public void setDanjia(float danjia) {
        this.danjia = danjia;
    }

    public void setZongjia(float zongjia) {
        this.zongjia = zongjia;
    }
}
