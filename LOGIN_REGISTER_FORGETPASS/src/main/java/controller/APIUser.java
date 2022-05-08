package controller;

import entity.Customer;
import model.ReponseObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import repositories.DAOCustomer;
import service.DateService;
import service.MailService;
import service.OTP;

import java.util.Date;
import java.util.List;

@RestController
public class APIUser {
    @Autowired
    DateService dateService ;
    @Autowired
    MailService mailService;
    @Autowired
    OTP otp ;
    @Autowired
    DAOCustomer daoCustomer ;
   @RequestMapping( value = "user/resetOTP")
    public ResponseEntity<ReponseObject> resetOTP(@RequestParam("email") String email) {
       if(dateService.checkTimerResetPass(100000,email)){
           return ResponseEntity.status(HttpStatus.OK).body(
                   new ReponseObject("running", "time running")
           );
       }
       String otp = this.otp.getOTP();
       List<Customer> list = daoCustomer.findByEmail(email);
      if(list.size()>0){
          Customer  customer = list.get(0);
          customer.setCode(otp);
          customer.setTime(new Date());
          daoCustomer.save(customer);
          mailService.sendMail(email , "Code OTP" , otp);
      }
       return ResponseEntity.status(HttpStatus.OK).body(
               new ReponseObject("stopped" , "time stopped")
       );
    }
}
