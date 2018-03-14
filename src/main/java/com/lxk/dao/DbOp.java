package com.lxk.dao;

import com.lxk.model.*;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.SimpleTimeZone;

public class DbOp {
    private ResultSet resultSet=null;
    public boolean Login(String id,String password) throws SQLException {
       String  sql= String.format("SELECT * FROM \"SA\".\"user\" WHERE \"user\".\"UserID\"='%s'",id);
       resultSet=DbLink.DoGetResultSql(sql);
        User user=new User();
        if(resultSet == null)
        {
            return false;
        }
       while (resultSet.next())
       {

           user.setName(resultSet.getString(1));
           user.setId(resultSet.getString(2));
           user.setPassword(resultSet.getString(3));
           user.setAge(String.valueOf(resultSet.getInt(4)));
           user.setAddress(resultSet.getString(5));
           user.setLevel(String.valueOf(resultSet.getInt(6)));
       }
       if(user.getPassword().equals(password)&& user.getId().equals(id))
       {
           return true;
       }
       else return false;
    }
    public User getuser(String id) throws SQLException {
        String  sql= String.format("SELECT * FROM \"SA\".\"user\" WHERE \"user\".\"UserID\"='%s'",id);
        resultSet=DbLink.DoGetResultSql(sql);
        User user=new User();
        while (resultSet.next())
        {
            user.setName(resultSet.getString(1));
            user.setId(resultSet.getString(2));
            user.setPassword(resultSet.getString(3));
            user.setAge(String.valueOf(resultSet.getInt(4)));
            user.setAddress(resultSet.getString(5));
            user.setLevel(String.valueOf(resultSet.getInt(6)));
        }
        return user;
    }
    public ArrayList<Goodsinsale> getallgoods() throws SQLException {
        String sql="SELECT * FROM \"SA\".goodsinsale";
        resultSet=DbLink.DoGetResultSql(sql);
        ArrayList<Goodsinsale> arrayList=new ArrayList<Goodsinsale>();
        while(resultSet.next())
        {
            Goodsinsale goodsinsale=new Goodsinsale();
            goodsinsale.setId(resultSet.getInt(1));
            goodsinsale.setName(resultSet.getString(2));
            goodsinsale.setNumber(resultSet.getInt(3));
            goodsinsale.setProductaddress(resultSet.getString(4));
            goodsinsale.setPrice(resultSet.getFloat(5));
            goodsinsale.setCountprice(resultSet.getFloat(6));
            arrayList.add(goodsinsale);
        }
        return arrayList;

    }
    public ArrayList<Goodsinsale> KuCunstates() throws SQLException {
        String sql="SELECT * FROM \"SA\".allgoodsinfo";
        resultSet=DbLink.DoGetResultSql(sql);
        ArrayList<Goodsinsale> arrayList=new ArrayList<Goodsinsale>();
        while(resultSet.next())
        {
            Goodsinsale goodsinsale=new Goodsinsale();
            goodsinsale.setId(resultSet.getInt(1));
            goodsinsale.setName(resultSet.getString(2));
            goodsinsale.setNumber(resultSet.getInt(3));
            goodsinsale.setProductaddress(resultSet.getString(4));
            goodsinsale.setPrice(resultSet.getFloat(5));
            goodsinsale.setCountprice(resultSet.getFloat(6));
            arrayList.add(goodsinsale);
        }
        return arrayList;

    }
    public boolean KuCunDaoru(String ID,String name,String Number,String product,String
                              price,String Size)
    {
        String sql=String.format("INSERT INTO \"SA\".allgoodsinfo VALUES(%d,'%s',%d,'%s',%f,%f)",
                Integer.valueOf(ID),name,Integer.valueOf(Number),product,Float.valueOf(price),
                Float.valueOf(Size));
        DbLink.DoNoResultSql(sql);
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String sql2=String.format("INSERT INTO \"SA\".goodsaddrecorde VALUES(%d,'%s',%d,'%s',%f,%f,'%s','%s')",
                Integer.valueOf(ID),name,Integer.valueOf(Number),product,Float.valueOf(price),
                Float.valueOf(Size),df.format(day),"导入" );
        DbLink.DoNoResultSql(sql2);
        return true;
    }

    public ArrayList<Goodsdaorurecord>Kucunliu() throws SQLException {
        String sql="SELECT * FROM \"SA\".goodsaddrecorde";
        ArrayList<Goodsdaorurecord>mylist=new ArrayList<Goodsdaorurecord>();
        resultSet=DbLink.DoGetResultSql(sql);
        while (resultSet.next())
        {
            Goodsdaorurecord goodsinsale=new Goodsdaorurecord();
            goodsinsale.setId(resultSet.getInt(1));
            goodsinsale.setName(resultSet.getString(2));
            goodsinsale.setNumber(resultSet.getInt(3));
            goodsinsale.setProductaddress(resultSet.getString(4));
            goodsinsale.setPrice(resultSet.getFloat(5));
            goodsinsale.setCountprice(resultSet.getFloat(6));
            goodsinsale.setDate(resultSet.getString(7));
            goodsinsale.setLiuxiang(resultSet.getString(8));
            mylist.add(goodsinsale);
        }
        return mylist;
    }
    public ArrayList<Caiwuxin>caiwuxin() throws SQLException {
        String sql="SELECT * FROM \"SA\".salary";
        ArrayList<Caiwuxin>myli=new ArrayList<Caiwuxin>();
        resultSet=DbLink.DoGetResultSql(sql);
        while (resultSet.next())
        {
            Caiwuxin caiwuxin=new Caiwuxin();
            caiwuxin.setId(resultSet.getString(1));
            caiwuxin.setSalary(resultSet.getFloat(2));
            caiwuxin.setChangedate(resultSet.getString(3));
            caiwuxin.setName(resultSet.getString(4));
            myli.add(caiwuxin);
        }
        return myli;
    }
    public boolean Changesalary(String id,String salary){
        String sql=String.format("UPDATE \"SA\".salary SET usersalary=%f WHERE userid='%s'",Float.valueOf(salary),id);
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String sql2=String.format("UPDATE \"SA\".salary SET lastchangedate='%s' WHERE userid='%s'",df.format(day),id);
        DbLink.DoNoResultSql(sql);
        DbLink.DoNoResultSql(sql2);
        return true;
    }
    public boolean Addcaiwubaobiao(String stateda,String endda,String goodsid,String money)
    {
        String sql=String.format("INSERT INTO \"SA\".caiwubaobiao VALUES('%s','%s',%d,%f)",stateda,endda,Integer.valueOf(
        goodsid),Float.valueOf(money));
        DbLink.DoNoResultSql(sql);
        return true;
    }
    public ArrayList<Caiwubaobiao>caiwubaobiao() throws SQLException {
        String sql="SELECT * FROM \"SA\".caiwubaobiao";
        ArrayList<Caiwubaobiao>baobiao=new ArrayList<Caiwubaobiao>();
        resultSet=DbLink.DoGetResultSql(sql);
        while (resultSet.next())
        {
            Caiwubaobiao ab=new Caiwubaobiao();
            ab.setStartday(resultSet.getString(1));
            ab.setEndday(resultSet.getString(2));
            ab.setGoogsid(resultSet.getInt(3));
            ab.setMoney(resultSet.getFloat(4));
            baobiao.add(ab);
        }
        return baobiao;
    }
    public boolean addshopcar(String uid,String gid,String gname,String gum,String danjia)
    {
        float zongjia=Integer.valueOf(gum)*Float.valueOf(danjia);
        String sql=String.format("INSERT INTO \"SA\".shopcar VALUES('%s','%d','%s','%d',%f,%f)",uid,Integer.valueOf(gid),gname,Integer.valueOf(gum),Float.valueOf(danjia),zongjia);
        System.out.println(sql);
        DbLink.DoNoResultSql(sql);
        return true;
    }
    public ArrayList<shopcar> getshopcar(String uid) throws SQLException {
        String sql=String.format("SELECT * FROM \"SA\".shopcar WHERE userid='%s'",uid);
        ArrayList<shopcar>car=new ArrayList<shopcar>();
        resultSet=DbLink.DoGetResultSql(sql);
        while (resultSet.next())
        {
            shopcar shop=new shopcar();
            shop.setUid(resultSet.getString(1));
            shop.setGid(resultSet.getInt(2));
            shop.setGname(resultSet.getString(3));
            shop.setGnum(resultSet.getInt(4));
            shop.setDanjia(resultSet.getFloat(5));
            shop.setZongjia(resultSet.getFloat(6));
            car.add(shop);
        }
        return car;
    }
    public Goodsinsale getgoodsbyid(String gid) throws SQLException {
        String sql=String.format("SELECT * FROM \"SA\".goodsinsale WHERE \"GoodsID\"=%d",Integer.valueOf(gid));
        resultSet=DbLink.DoGetResultSql(sql);
        Goodsinsale goodsinsale=new Goodsinsale();
        while (resultSet.next())
        {
            goodsinsale.setId(resultSet.getInt(1));
            goodsinsale.setName(resultSet.getString(2));
            goodsinsale.setNumber(resultSet.getInt(3));
            goodsinsale.setProductaddress(resultSet.getString(4));
            goodsinsale.setPrice(resultSet.getFloat(5));
            goodsinsale.setCountprice(resultSet.getFloat(6));

        }
        return goodsinsale;
    }
    public boolean addorder(String uid,String address,String tel) throws SQLException {
        String sql=String.format("SELECT * FROM \"SA\".shopcar WHERE userid='%s'",uid);
        ArrayList<shopcar>car=new ArrayList<shopcar>();
        resultSet=DbLink.DoGetResultSql(sql);
        String content="";
        while (resultSet.next())
        {

            content+=(Integer.toString(resultSet.getInt(2))
                    +resultSet.getString(3)+Integer.toString(resultSet.getInt(4))
            );
        }

        String sql2=String.format("INSERT INTO \"SA\".order VALUES('%s','%s','%s','%s')",uid,address,tel,content);
        DbLink.DoNoResultSql(sql2);
        return true;

    }
    public ArrayList<order> getorder(String uid) throws SQLException {
        String sql=String.format("SELECT * FROM \"SA\".order WHERE customerid='%s'",uid);
        ArrayList<order>orders=new ArrayList<order>();
        resultSet=DbLink.DoGetResultSql(sql);
        while (resultSet.next())
        {
            order order1=new order();
            order1.setUid(resultSet.getString(1));
            order1.setAddress(resultSet.getString(2));
            order1.setTel(resultSet.getString(3));
            order1.setContent(resultSet.getString(4));
            orders.add(order1);
        }
        return orders;
    }
    public boolean addyuangong(String uname,String uid,String upass,String uage,String uaddre,String ulev)
    {
        String sql=String.format("INSERT INTO \"SA\".user VALUES('%s','%s','%s',%d,'%s',%d)",uname,uid,upass,Integer.valueOf(
        uage),uaddre,Integer.valueOf(ulev));
        System.out.println(sql);
        DbLink.DoNoResultSql(sql);
        return true;
    }
    public void deleteshopcar(String uid)
    {
        String sql=String.format("DELETE FROM \"SA\".shopcar WHERE userid='%s'",uid);
        DbLink.DoNoResultSql(sql);
    }
    public ArrayList<User> getuserinfo() throws SQLException {
        ArrayList<User>users=new ArrayList<User>();
        String sql="SELECT * FROM \"SA\".user";
        resultSet=DbLink.DoGetResultSql(sql);
        while (resultSet.next())
        {
            User user=new User();
            user.setName(resultSet.getString(1));
            user.setId(resultSet.getString(2));
            user.setAge(String.valueOf(resultSet.getInt(4)));
            user.setAddress(resultSet.getString(5));
            user.setLevel(String.valueOf(resultSet.getInt(6)));
            users.add(user);

        }
        return users;
    }
}
