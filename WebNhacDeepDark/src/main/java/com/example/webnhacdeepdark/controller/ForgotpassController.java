package com.example.webnhacdeepdark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ForgotpassController {
    @RequestMapping("/forgetpass")
    public String forgotPass(){

        return "forgetpass";
    }
}
