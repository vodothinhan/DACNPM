package controller;

import entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.Register;

@Controller
public class RegisterController {
    @Autowired
    Register register;
    @RequestMapping(path = "/register/add" , method = RequestMethod.POST)
    public String register(Model model,
                           @RequestParam("email") String email , @RequestParam("pass") String pass ,
                            @RequestParam("day") String day ,@RequestParam("month") String month,
                           @RequestParam("year") String year , @RequestParam("gender") String gender){
        if(register.checkExistEmail(email)) {
            model.addAttribute("email" , email);
            model.addAttribute("checkEmail" , true);
            return "register";
        }

        String date = year+"-"+month+"-"+year;
        register.save(
                new Customer(email ,pass,"USER",true,date,gender)
        );
        return "login";
    }
}
