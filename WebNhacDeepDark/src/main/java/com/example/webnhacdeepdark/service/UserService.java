package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.model.UserModel;
import com.example.webnhacdeepdark.repositories.UserRepositories;
import com.example.webnhacdeepdark.utilities.ConvertUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {
    @Autowired
    UserRepositories userRepositories;
    @Autowired
    ConvertUser convertUser ;
    public Users findById(int id){
        return userRepositories.findById(id).get();
    }

    public void saveUser(Users u){
        userRepositories.save(u);
    }

    public void deleteUser(int id){
        userRepositories.deleteById(id);
    }

    public  Users findByEmail(String email){
        return userRepositories.findFirstByEmail(email) ;
    }
    public boolean isExistEmail(String email){
       if(findByEmail(email)==null) return  false ;
       return true ;
    }
    public boolean login(String email , String pass) {
        if(userRepositories.findFirstByEmailAndPassword(email, pass)==null) return  false;
        return  true ;

    }
    @Transactional
    public boolean saveUser(UserModel user){
        try{
            Users u = convertUser.toEntity(user) ;
            userRepositories.save(u);
        }catch (Exception e){
            return false ;
        }
         return  true ;
    }
}
