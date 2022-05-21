package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Home {
    @Autowired
    UserService userService;

    @RequestMapping(path = "/home", method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView mav = new ModelAndView("index");
        Users u = userService.findById(69);
        mav.addObject("user", u);

        return mav;
    }

    @RequestMapping(path = "/dulieu", method = RequestMethod.POST)
    public ModelAndView test(@RequestParam("email") String email){
        ModelAndView mav = new ModelAndView("index2");
        mav.addObject("email", email);
        return mav;

    }

    @RequestMapping(path = "/testUser", method = RequestMethod.GET)
        public String test2(){
            return "test";
        }

}
