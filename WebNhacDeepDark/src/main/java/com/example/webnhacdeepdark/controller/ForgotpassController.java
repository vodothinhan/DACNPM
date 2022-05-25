package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.service.UserService;
import com.example.webnhacdeepdark.utilities.RenderOTP;
import com.example.webnhacdeepdark.utilities.SendEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ForgotpassController  {
    @Autowired
    UserService userService;
    @Autowired
    SendEmail mailSender ;
    @Autowired
    RenderOTP otp ;
    @RequestMapping(value = "/forgetpass",method = RequestMethod.GET)
    public String forgotPass(){
        return "forgetpass";
    }

    @RequestMapping(value ="/forgetpass",method = RequestMethod.POST)
    public ModelAndView forgetPass( ModelMap model,
            @RequestParam("email") String email,
            @RequestParam("pass") String pass
    )  {
        if(!userService.isExistEmail(email)){
            model.addAttribute("email", false);
            model.addAttribute("email", email);
            return new ModelAndView("forgetpass",model);
        }
        if(!mailSender.sendEmail(email,otp.createOTP()) || !userService.updateCodeAndTimeResetPass(email,otp.getCode())){
            model.addAttribute("sendMail", false) ;
            return  new ModelAndView("forgetpass" , model);
        }

        model.addAttribute("email" , email);
        model.addAttribute("pass" , pass);
        return new ModelAndView("OTP");
    }
    @RequestMapping(value = "/sendOTP" , method = RequestMethod.POST)
    public ModelAndView pageOTP(ModelMap model , @RequestParam("email") String email,
                                @RequestParam("pass")String pass , @RequestParam("otp")String otp){
        model.addAttribute("email" , email);
        model.addAttribute("pass" , pass);
        if(!userService.validTimeCode(email)){
            model.addAttribute("timeCode", false);
            return new ModelAndView("OTP", model);
        }
        if(!userService.validCode(otp)){
            model.addAttribute("code" , false) ;
            return new ModelAndView("OTP", model);
        }
                model.addAttribute("resetPass" , true);
               userService.updatePass(pass);
        return new ModelAndView("redirect:login" , model);
    }

}
