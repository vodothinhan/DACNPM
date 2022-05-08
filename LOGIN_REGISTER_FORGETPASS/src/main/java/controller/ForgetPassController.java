package controller;

import entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import repositories.DAOCustomer;
import service.DateService;
import service.MailService;
import service.OTP;

import java.util.List;

@Controller
public class ForgetPassController {
    @Autowired
    DAOCustomer daoCustomer ;
    @Autowired
    MailService mailService ;
    @Autowired
    OTP otp ;
    @Autowired
    DateService dateService ;
    @RequestMapping(path = "/forgetpass/reset" , method = RequestMethod.POST)
    public  String forgetPass(@RequestParam("email") String email  ,@RequestParam String pass, Model model){
        if(daoCustomer.findByEmail(email).size()==0) {
            model.addAttribute("email" ,email);
            model.addAttribute("checkEmail" , true);
            return "forgetpass";
        }
        model.addAttribute("email", email);
        model.addAttribute("pass", pass);
        String code = otp.getOTP();
        otp.updateCodeAndTime(email,code);
        mailService.sendMail(email , "OTP reset password" ,code);


       return "OTP";
    }
    @RequestMapping(path = "/forgetpass/resetOTP")
    public String resetOTP(Model model ,@RequestParam("email") String email ){
        model.addAttribute("email" , email);
        model.addAttribute("sucess" , true);

        return "OTP";
    }
    @RequestMapping(path = "forgetpass/sendOTP",  method = RequestMethod.POST)
    public String sendOTP(Model model , @RequestParam("email") String email, @RequestParam("otp") String otp ,
                          @RequestParam("pass") String pass){
            if(daoCustomer.findByEmail(email).size()==0) return "forgetpass";
            if(dateService.checkTimerResetPass(100000 , email)){

                if(this.otp.checkOTP(otp,email)){
                    List<Customer> list =  daoCustomer.findByEmail(email);
                    Customer customer = list.get(0);
                    customer.setPass(pass);
                    model.addAttribute("resetpass" , true);
                    return "login";
                }
            }
            else {
                model.addAttribute("email", email);
                model.addAttribute("pass",pass);
                model.addAttribute("timeFailure" , true);
                return "OTP";
            }
            model.addAttribute("email", email);
             model.addAttribute("pass",pass);
            model.addAttribute("failure" , true);
            return "OTP";

    }


}
