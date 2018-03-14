package com.lxk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Start {
    @RequestMapping("/Login")
    public String login()
    {
        return "Login";
    }
}
