package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class RestAPI {
    @Autowired
    UserService userService;

    @GetMapping(path = "/getUser")
    public Users getUserByIDAPI(@RequestParam(value = "id", defaultValue = "69") int id){
        return userService.findById(id);
    }


    @PostMapping("/insertUser")
    public String insertUser(@RequestBody Users user){
        userService.saveUser(user);
        return "ok btch";
    }

    @DeleteMapping("/deleteUser/{id}")
        public String deleteUser(@PathVariable int id){
            userService.deleteUser(id);
            return "ok boiz";
        }
}


