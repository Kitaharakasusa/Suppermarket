package com.lxk.model;

public class Caiwubaobiao {
    private String startday;
    private String endday;
    private int googsid;
    private float money;

    public float getMoney() {
        return money;
    }

    public int getGoogsid() {
        return googsid;
    }

    public String getEndday() {
        return endday;
    }

    public String getStartday() {
        return startday;
    }

    public void setEndday(String endday) {
        this.endday = endday;
    }

    public void setGoogsid(int googsid) {
        this.googsid = googsid;
    }

    public void setMoney(float money) {
        this.money = money;
    }

    public void setStartday(String startday) {
            this.startday = startday;
    }
}
