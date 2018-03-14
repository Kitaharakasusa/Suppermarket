package com.lxk.controller;

import com.lxk.dao.DbOp;
import com.lxk.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLException;
import java.util.ArrayList;

@Controller
public class Userc {
    @RequestMapping(value = "AddYuangong",method = RequestMethod.GET)
    public String adduser()
    {
        return "AddYuangong";
    }
    @RequestMapping(value = "/addnewuser",method = RequestMethod.POST)
    public ModelAndView addnewusr(String uname,String uid,String upass,String uage,String uaddre,String ulev)
    {
        ModelAndView modelAndView=new ModelAndView();
        DbOp op=new DbOp();
        if(op.addyuangong(uname,uid,upass,uage,uaddre,ulev))
        {
            modelAndView.addObject("message","su");
            modelAndView.setViewName("Zonglan");
        }
        return modelAndView;
    }
    @RequestMapping(value = "getuserinfo",method = RequestMethod.GET)
    public ModelAndView seealluser() throws SQLException {
        ModelAndView modelAndView=new ModelAndView();
        DbOp op=new DbOp();
        ArrayList<User>users=op.getuserinfo();
        modelAndView.addObject("mylist",users);
        modelAndView.setViewName("AllUserINFO");
        return modelAndView;

    }
}
