package com.example.webnhacdeepdark.API;

import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.model.ObjectResponse;
import com.example.webnhacdeepdark.service.UserService;
import com.example.webnhacdeepdark.utilities.RenderOTP;
import com.example.webnhacdeepdark.utilities.SendEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class APIUser {
    @Autowired
    UserService userService ;
    @Autowired
    RenderOTP otp ;
    @Autowired
    SendEmail sendEmail ;
    @GetMapping("/isExistEmail")
    public ResponseEntity<ObjectResponse> isExistEmail(@RequestParam("email") String email){
         Users users = userService.findByEmail(email);
         if(users!=null) return ResponseEntity.status(HttpStatus.OK)
                 .body(new ObjectResponse("FALSE" ,""));
        return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("TRUE" ,"")
        );
    }
    @RequestMapping(value = "/resetOTP" , method = RequestMethod.GET)
    public ResponseEntity<ObjectResponse> resetOTP(@RequestParam("email") String email ){

        if(userService.validTimeCode(email)) return ResponseEntity.status(HttpStatus.OK)
                .body(
                        new ObjectResponse("RUNNING", "")
                );
        sendEmail.sendEmail(email,otp.createOTP());
        userService.updateCodeAndTimeResetPass(email, otp.getCode());
        return ResponseEntity.status(HttpStatus.OK)
                .body(new ObjectResponse("SUCCESS",""));
    }

}
