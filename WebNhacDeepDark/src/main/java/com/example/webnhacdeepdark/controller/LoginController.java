package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    UserService userService ;
    @RequestMapping(value = {"" , "/login"} , method = RequestMethod.GET)
    public ModelAndView loginPage(ModelMap model ,
           @RequestParam(value = "register" ,required = false) boolean register,
            @RequestParam(value = "resetPass",required = false) boolean resetPass){
        model.addAttribute("register", register);
        model.addAttribute("resetPass", resetPass);
        return new ModelAndView("login" , model);
    }
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(ModelMap model
            , @RequestParam(value = "email" , required = false) String email,
             @RequestParam(value = "pass",required = false) String pass ,
               HttpSession session){

        if(!userService.login(email,pass)){
            model.addAttribute("login",false);
            return new ModelAndView("login",model);
        }
        Users u = userService.findByEmail(email);
        System.out.println(u.getRole());
        session.setAttribute("user",userService.findByEmail(email));
        if(u.getRole().equals("ADMIN")) return new ModelAndView("redirect:/admin/manage-user", model);
        return new ModelAndView("redirect:/main", model);
    }
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/login";
    }
}
