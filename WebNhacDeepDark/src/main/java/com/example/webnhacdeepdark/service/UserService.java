package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.repositories.UserRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserRepositories userRepositories;

    public Users findById(int id){
        return userRepositories.findById(id).get();
    }

    public void saveUser(Users u){
        userRepositories.save(u);
    }

    public void deleteUser(int id){
        userRepositories.deleteById(id);
    }
}
