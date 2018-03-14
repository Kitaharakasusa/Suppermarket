package com.lxk.model;

public class User {
    private String name;
    private String id;
    private String password;
    private String age;
    private String address;
    private String level;

    public String getName() {
        return name;
    }

    public String getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getPassword() {
        return password;
    }

    public String getAge() {
        return age;
    }

    public String getLevel() {
        return level;
    }

    public void setAge(String age) {
        this.age = age;
    }
}
