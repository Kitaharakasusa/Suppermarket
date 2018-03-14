package com.lxk.controller;

import com.lxk.dao.DbOp;
import com.lxk.model.Goodsinsale;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLException;
import java.util.ArrayList;

@Controller
@SessionAttributes("userid")
public class Login {
    @RequestMapping(value = "/LoginVerify",method = RequestMethod.POST)
    public ModelAndView myselogin(String uid,String upassword) throws SQLException {
        DbOp my=new DbOp();
        ModelAndView modelAndView=new ModelAndView();
        ArrayList<Goodsinsale> goodsinsales;
        modelAndView.addObject("userid",uid);
        if(my.Login(uid,upassword))
        {
            System.out.println(uid+" "+upassword);
            if(my.getuser(uid).getLevel().equals("4"))
            {
                goodsinsales=my.getallgoods();
                modelAndView.addObject("arraylist",goodsinsales);
                modelAndView.setViewName("Shop3");
                System.out.println(4);

            }
            else if(my.getuser(uid).getLevel().equals("2"))
            {
                modelAndView.setViewName("KuCun");
                System.out.println(2);
            }
            else if(my.getuser(uid).getLevel().equals("3"))
            {
                modelAndView.setViewName("CaiWu");
                System.out.println(3);
            }
            else if(my.getuser(uid).getLevel().equals("0")||my.getuser(uid).getLevel().equals("1"))
            {
                    modelAndView.setViewName("Zonglan");
                System.out.println(0);
            }

        }
        else {
            modelAndView.setViewName("Login");
        }
        return modelAndView;
    }
}
