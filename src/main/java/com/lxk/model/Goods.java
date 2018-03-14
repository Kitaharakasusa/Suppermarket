package com.lxk.model;

public class Goods {
    private String goodsid;
    private String goodsname;
    private String goodnum;
    private String product;
    private String price;
    private String size;

    public String getGoodnum() {
        return goodnum;
    }

    public String getGoodsid() {
        return goodsid;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public String getPrice() {
        return price;
    }

    public String getProduct() {
        return product;
    }

    public String getSize() {
        return size;
    }

    public void setGoodnum(String goodnum) {
        this.goodnum = goodnum;
    }

    public void setGoodsid(String goodsid) {
        this.goodsid = goodsid;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public void setSize(String size) {
        this.size = size;
    }
}
