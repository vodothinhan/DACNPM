package com.example.webnhacdeepdark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    @RequestMapping(value = {"" , "/login"})
    public ModelAndView loginPage(ModelMap model , @RequestParam(value = "register" , required = false) boolean register){
        model.addAttribute("register", register);
        return new ModelAndView("login" , model);
    }

    public String login(Model model){
        return "login";
    }
}
