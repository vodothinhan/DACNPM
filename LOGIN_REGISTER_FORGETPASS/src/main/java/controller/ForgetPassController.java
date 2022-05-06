package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import repositories.DAOCustomer;

@Controller
public class ForgetPassController {
    @Autowired
    DAOCustomer daoCustomer ;
    @RequestMapping(path = "/forgetpass/reset" , method = RequestMethod.POST)
    public  String forgetPass(@RequestParam("email") String email , Model model){
        if(daoCustomer.findByEmail(email).size()==0) {
            model.addAttribute("email" ,email);
            model.addAttribute("checkEmail" , true);
            return "forgetpass";
        }
        model.addAttribute("email", email);
       return "OTP";
    }
    @RequestMapping(path = "/forgetpass/resetOTP")
    public String resetOTP(Model model ,@RequestParam("email") String email ){
        model.addAttribute("email" , email);
        model.addAttribute("sucess" , true);
        return "OTP";
    }
    @RequestMapping(path = "forgetpass/sendOTP")
    public String sendOTP(Model model , @RequestParam("email") String email, @RequestParam("otp") String otp){

        return "login";
    }


}
