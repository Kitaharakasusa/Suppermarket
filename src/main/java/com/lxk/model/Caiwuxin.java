package com.lxk.model;

public class Caiwuxin {
    private String id;
    private String name;
    private float salary;
    private String changedate;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public String getChangedate() {
        return changedate;
    }

    public float getSalary() {
        return salary;
    }

    public void setChangedate(String changedate) {
        this.changedate = changedate;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }
}
