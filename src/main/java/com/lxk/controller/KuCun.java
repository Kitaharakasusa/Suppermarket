package com.lxk.controller;

import com.lxk.dao.DbOp;
import com.lxk.model.Goodsdaorurecord;
import com.lxk.model.Goodsinsale;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLException;
import java.util.ArrayList;

@Controller
public class KuCun {

    private DbOp op=new DbOp();
    @RequestMapping(value = "KuCunStatus",method = RequestMethod.GET)
    public ModelAndView states() throws SQLException {
        ArrayList<Goodsinsale>nowlist;
        nowlist=op.KuCunstates();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("kucun",nowlist);
        modelAndView.setViewName("KuCunStatus");
        return modelAndView;
    }
    @RequestMapping(value = "KuCunDaoru",method = RequestMethod.GET)
    public String toKucundaoru()
    {
        return "KuCunDaoru";
    }
    @RequestMapping(value = "KuCunDaoruu",method = RequestMethod.POST)
    public ModelAndView KuCunDaoRu(String uid,String uname,String unumber,String uproduct,String uprice,String usize)
    {
        op.KuCunDaoru(uid,uname,unumber,uproduct,uprice,usize);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("message2","su2");
        modelAndView.setViewName("KuCun");
        return modelAndView;
    }
    @RequestMapping(value = "KuCunFlow",method = RequestMethod.GET)
    public ModelAndView kuncunliu() throws SQLException {
        ArrayList<Goodsdaorurecord> nowlist=op.Kucunliu();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("mylist",nowlist);
        modelAndView.setViewName("KuCunFlow");
        return modelAndView;
    }
}
