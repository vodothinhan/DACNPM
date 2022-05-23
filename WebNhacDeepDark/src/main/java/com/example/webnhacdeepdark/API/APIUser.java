package com.example.webnhacdeepdark.API;

import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.model.ObjectResponse;
import com.example.webnhacdeepdark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class APIUser {
    @Autowired
    UserService userService ;
    @GetMapping("/isExistEmail")
    public ResponseEntity<ObjectResponse> isExistEmail(@RequestParam("email") String email){
         Users users = userService.findByEmail(email);
         if(users!=null) return ResponseEntity.status(HttpStatus.OK)
                 .body(new ObjectResponse("FALSE" ,""));
        return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("TRUE" ,"")
        );
    }

}
