package controller;
import entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.Authen;


@Controller
public class LoginController {
    @Autowired
    Authen authen ;
    @RequestMapping(path = "/login" , method = RequestMethod.POST)
    public String login(Model model , @RequestParam("email") String email , @RequestParam("pass") String pass){
        boolean checkEmail = authen.email(email);
        boolean checkPass = authen.pass(pass);
        if(checkEmail && checkPass) return "home";
        if(!checkEmail) model.addAttribute("email" , true);
        if(!checkPass) model.addAttribute("pass" , true);
        model.addAttribute("value" , email);
        return "login" ;
    }
    @RequestMapping("/")
    public String pageLogin(){

        return "login";
    }
    @RequestMapping("/forgetpass")
    public String pageForgetPass(){

        return "forgetpass";
    }
    @RequestMapping("/register")
    public String pageRegister(){
        return "register";
    }

}
