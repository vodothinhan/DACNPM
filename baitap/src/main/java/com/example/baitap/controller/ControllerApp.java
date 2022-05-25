package com.example.baitap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@org.springframework.stereotype.Controller
public class ControllerApp {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String loginPage(){
        return "pagelogin" ;
    }
    @RequestMapping(value = "/showTopic", method = RequestMethod.GET)
    public String showTopicPage(){
        return "showTopic" ;
    }
    @RequestMapping(value = "/listTopic" , method = RequestMethod.GET)
    public String listTopic(){
        return "listTopic";
    }
}
