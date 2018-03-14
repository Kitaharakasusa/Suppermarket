package com.lxk.model;

public class Goodsinsale {
    private int id;
    private String name;
    private int number;
    private String productaddress;
    private float price;
    private float countprice;

    public void setPrice(float price) {
        this.price = price;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public float getCountprice() {
        return countprice;
    }

    public float getPrice() {
        return price;
    }

    public int getId() {
        return id;
    }

    public int getNumber() {
        return number;
    }

    public String getProductaddress() {
        return productaddress;
    }

    public void setCountprice(float countprice) {
        this.countprice = countprice;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setProductaddress(String productaddress) {
        this.productaddress = productaddress;
    }
}
