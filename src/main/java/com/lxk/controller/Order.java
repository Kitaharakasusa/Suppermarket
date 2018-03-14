package com.lxk.controller;

import com.lxk.dao.DbOp;
import com.lxk.model.order;
import com.sun.org.apache.bcel.internal.generic.MONITORENTER;
import javafx.scene.chart.ValueAxis;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;

@Controller
public class Order {
    private DbOp op=new DbOp();
    @RequestMapping(value = "/addorder",method = RequestMethod.POST)
    public ModelAndView addorder(String address,String tel,HttpSession session) throws SQLException {
        String uid= (String) session.getAttribute("userid");
        ModelAndView modelAndView=new ModelAndView();
        if(op.addorder(uid,address,tel))
        {
            modelAndView.addObject("message","su");
            modelAndView.setViewName("Shop3");
            op.deleteshopcar(uid);
        }
        return modelAndView;
    }
    @RequestMapping(value = "getorder",method = RequestMethod.GET)
    public ModelAndView getorder(HttpSession session) throws SQLException {
        String uid= (String) session.getAttribute("userid");
        ArrayList<order>orders=op.getorder(uid);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("order",orders);
        modelAndView.setViewName("Orderview");
        return modelAndView;
    }
}
