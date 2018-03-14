package com.lxk.controller;

import com.lxk.dao.DbOp;
import com.lxk.model.Goodsinsale;
import javafx.scene.chart.ValueAxis;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.lxk.model.shopcar;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;

@Controller
public class Shop {
    private   DbOp my=new DbOp();
    @RequestMapping(value = "allgoodshow",method = RequestMethod.GET)
    public String allgoods(){
        return "allgoodsshow";
    }

    @RequestMapping(value = "Allgoods",method = RequestMethod.GET)
    public ModelAndView goodss() throws SQLException {

        ModelAndView modelAndView=new ModelAndView();
        ArrayList<Goodsinsale> goodsinsales;
        goodsinsales=my.getallgoods();
        modelAndView.addObject("arraylist",goodsinsales);
        modelAndView.setViewName("Allgoods");
        return modelAndView;
    }
    @RequestMapping(value = "/addshopcar",method = RequestMethod.POST)
    public ModelAndView addshopcar(String gid,String gname,String danjia,String gnum,HttpSession session) throws SQLException {
        System.out.println("gid"+gid+"name"+gname+danjia+gnum);
        ModelAndView modelAndView=new ModelAndView();
        String uid= (String) session.getAttribute("userid");
        if(my.addshopcar(uid,gid,gname,gnum,danjia))
        {
            modelAndView.addObject("message","su");
            ArrayList<Goodsinsale> goodsinsales;
            goodsinsales=my.getallgoods();
            modelAndView.addObject("arraylist",goodsinsales);
            modelAndView.setViewName("Shop3");
        }
        return modelAndView;
    }
    @RequestMapping(value = "myshopcar",method = RequestMethod.GET)
    public ModelAndView getmyshopcar(HttpSession session) throws SQLException {
        ArrayList<shopcar>mylist;
        String uid= (String) session.getAttribute("userid");
        mylist=my.getshopcar(uid);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("mylist",mylist);
        modelAndView.setViewName("Shopcar");
        return modelAndView;
    }
    @RequestMapping(value = "/Shopxingqi",method =RequestMethod.POST)
    public ModelAndView shopxiangqin(String cid) throws SQLException {
        Goodsinsale goodsinsale=my.getgoodsbyid(cid);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("goodsinfo",goodsinsale);
        modelAndView.setViewName("Shopxiangqing");
        return modelAndView;
    }
    @RequestMapping(value = "mainright",method = RequestMethod.GET)
    public ModelAndView mainright() throws SQLException {
        ModelAndView modelAndView=new ModelAndView();
        ArrayList<Goodsinsale> goodsinsales;
        goodsinsales=my.getallgoods();
        modelAndView.addObject("arraylist",goodsinsales);
        modelAndView.setViewName("ShopmainRight");
        return modelAndView;
    }

}
