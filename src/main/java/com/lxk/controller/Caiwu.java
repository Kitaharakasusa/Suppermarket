package com.lxk.controller;

import com.lxk.dao.DbOp;
import com.lxk.model.Caiwubaobiao;
import com.lxk.model.Caiwuxin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

@Controller
public class Caiwu {
    private DbOp op=new DbOp();
    @RequestMapping(value = "Caiwuxin",method = RequestMethod.GET)
    public ModelAndView caiwuxin() throws SQLException {
        ArrayList<Caiwuxin>nowlist=op.caiwuxin();
        ModelAndView modelAndView=new ModelAndView();
        System.out.println("caiwuxinshui");
        modelAndView.addObject("mylist",nowlist);
        modelAndView.setViewName("Caiwuxin");
        return modelAndView;
    }
    @RequestMapping(value = "/ChangeSalary",method = RequestMethod.POST)
    public ModelAndView salary(String uid,String usa) throws SQLException {
        ModelAndView modelAndView = new ModelAndView();
        if(op.Changesalary(uid,usa)) {

            modelAndView.addObject("message","su");
            ArrayList<Caiwuxin>nowlist=op.caiwuxin();
            modelAndView.addObject("mylist",nowlist);
            modelAndView.setViewName("Caiwuxin");

        }
        return modelAndView;
    }
    @RequestMapping(value = "Caiwuadd",method = RequestMethod.GET)
    public String caiwuadd(){
        return "Caiwuaddbao";
    }
    @RequestMapping(value = "/Caiwuaddbaobiao",method = RequestMethod.POST)
    public ModelAndView addcaiwu(String usta,String uend,String upid,String umo)
    {
        ModelAndView modelAndView=new ModelAndView();
        if(op.Addcaiwubaobiao(usta,uend,upid,umo))
        {
            modelAndView.addObject("message","su");
            modelAndView.setViewName("CaiWu");
        }
        return modelAndView;
    }
    @RequestMapping(value = "Caiwusee",method = RequestMethod.GET)
    public ModelAndView seebaobiao() throws SQLException {
        ModelAndView modelAndView=new ModelAndView();
        ArrayList<Caiwubaobiao>mylist;
        mylist=op.caiwubaobiao();
        modelAndView.addObject("mylist",mylist);
        modelAndView.setViewName("Caiwusee");
        return modelAndView;
    }
}
