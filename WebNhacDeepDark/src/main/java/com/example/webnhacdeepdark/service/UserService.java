package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.User;
import com.example.webnhacdeepdark.repositories.UserInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserInterface userInterface;

    public User findById(int id){
        return userInterface.findById(id);
    }
}
