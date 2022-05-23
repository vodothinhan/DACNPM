package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ForgotpassController {
    @Autowired
    UserService userService;
    @RequestMapping(value = "/forgetpass",method = RequestMethod.GET)
    public String forgotPass(){
        return "forgetpass";
    }
    @RequestMapping(value ="/forgetpass",method = RequestMethod.POST)
    public ModelAndView forgetPass( ModelMap model,
            @RequestParam("email") String email,
            @RequestParam("pass") String pass
    ){
        if(!userService.isExistEmail(email)){
            model.addAttribute("email", false);
            return new ModelAndView("forgetpass",model);
        }
        return new ModelAndView("forgetpass",model);
    }
}
