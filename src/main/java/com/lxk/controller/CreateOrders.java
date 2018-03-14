//package com.lxk.controller;
//
//import com.lxk.dao.SetDb;
//import com.lxk.model.Customer;
//import com.lxk.model.Orders;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpSession;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
////处理创建爱你订单和获取订单请求
//@Controller
//public class CreateOrders {
//    @RequestMapping(value = "/create_new_orders")
//    public ModelAndView mynewcust(String orderaddress, String cid, String ordercontent, HttpSession session) throws SQLException {
//        SetDb mydb=new SetDb();
//        ModelAndView mav=new ModelAndView();
//        if(mydb.create_orders(orderaddress,cid,ordercontent, String.valueOf(session.getAttribute("Userid"))))
//        {
//            mav.addObject("message2","su");
//        }
//        else {
//            mav.addObject("message2","fa");
//        }
//        ResultSet rs=mydb.get_all_my_cust((String) session.getAttribute("Userid"));
//        ArrayList<Customer> mylist=new ArrayList<Customer>();
//        while (rs.next())
//        {
//            Customer cus=new Customer();
//            cus.setId(String.valueOf(rs.getInt(1)));
//            cus.setName(rs.getString(2));
//            cus.setManagername(rs.getString(3));
//            cus.setSalername(rs.getString(4));
//            cus.setSex(rs.getString(5));
//            cus.setTelephone(rs.getString(6));
//            cus.setDuetosale(String.valueOf(rs.getInt((7))));
//            mylist.add(cus);
//        }
//        mav.addObject("mylist",mylist);
//        mav.setViewName("get_my_cust");
//        return mav;
//    }
//
//    @RequestMapping(value = "/get_all_orders")
//    public  ModelAndView allorder() throws SQLException {
//        SetDb mydb=new SetDb();
//        ResultSet res=mydb.get_all_orders();
//        ArrayList<Orders>mylist=new ArrayList<Orders>();
//        ModelAndView mav=new ModelAndView();
//        while (res.next())
//        {
//            Orders orders=new Orders();
//            orders.setId(String.valueOf(res.getInt(1)));
//            orders.setDate(String.valueOf(res.getString(2)));
//            orders.setAddress(res.getString(3));
//            String status=res.getString(4);
//            System.out.println(status);
//            if(status.equals("0"))orders.setStatus("未完成");
//            else if(status.equals("1"))orders.setStatus("已完成");
//            orders.setCustid(String.valueOf(res.getInt(5)));
//            orders.setOrdercontent(res.getString(6));
//            mylist.add(orders);
//        }
//        mav.setViewName("view_orders");
//        mav.addObject("mylist",mylist);
//        return mav;
//    }
//    @RequestMapping(value = "/get_my_orders")
//    public ModelAndView getmyorders(HttpSession session) throws SQLException {
//        String myid= (String) session.getAttribute("Userid");
//        SetDb mydb=new SetDb();
//        ResultSet res=mydb.get_my_orders(myid);
//        ArrayList<Orders>mylist=new ArrayList<Orders>();
//        ModelAndView mav=new ModelAndView();
//        while (res.next())
//        {
//            Orders orders=new Orders();
//            orders.setId(String.valueOf(res.getInt(1)));
//            orders.setDate(String.valueOf(res.getString(2)));
//            orders.setAddress(res.getString(3));
//            String status=res.getString(4);
//            System.out.println(status);
//            if(status.equals("0"))orders.setStatus("未完成");
//            else if(status.equals("1"))orders.setStatus("已完成");
//            orders.setCustid(String.valueOf(res.getInt(5)));
//            orders.setOrdercontent(res.getString(6));
//            mylist.add(orders);
//        }
//        mav.setViewName("view_orders");
//        mav.addObject("mylist",mylist);
//        return mav;
//    }
//}
