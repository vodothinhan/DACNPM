package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.controller.User;
import com.example.webnhacdeepdark.entity.Contact;
import com.example.webnhacdeepdark.entity.PlayList;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.model.UserModel;
import com.example.webnhacdeepdark.repositories.UserRepositories;
import com.example.webnhacdeepdark.utilities.ConvertUser;
import com.example.webnhacdeepdark.utilities.HashMD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private Users user;
    @Autowired
    UserRepositories userRepositories;
    @Autowired
    ConvertUser convertUser;

    @Autowired
    PlaylistService playlistService;
    @Autowired
    HashMD5 hashMD5 ;
    @Autowired
    ContactService contactService;
    public Users findById(int id) {
        return userRepositories.findById(id).get();
    }

    public void saveUser(Users u) {
        userRepositories.save(u);
    }

    public void deleteUser(int id) {
        userRepositories.deleteById(id);
    }

    public List<Users> findAll() { return userRepositories.findAll(); }

    public Users findByEmail(String email) {
        return userRepositories.findFirstByEmail(email);
    }

    public boolean isExistEmail(String email) {
        if (findByEmail(email) == null) return false;
        return true;
    }

    public boolean login(String email, String text) {
        hashMD5.setText(text);
        String pass = hashMD5.md5ToBase64();
        if (userRepositories.findFirstByEmailAndPasswordAndStatus(email, pass,"ACTIVE") == null) return false;

        return true;
    }

    @Transactional
    public boolean saveUser(UserModel user) {
        try {
            Users u = convertUser.toEntity(user);
           this.user = userRepositories.save(u);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    @Transactional
    public boolean updateCodeAndTimeResetPass(String email, String code) {
        try {
            Users user = findByEmail(email);
            user.setCodeRecovery(code);
            user.setTimeRecovery(System.currentTimeMillis());
            userRepositories.save(user);
            return true;
        } catch (Exception exception) {
            return false;
        }
    }

    public boolean validTimeCode(String email) {
        Users users = findByEmail(email);
        if (users == null) return false;
        this.user = users;
        long time = users.getTimeRecovery();
        if (((System.currentTimeMillis() - time) / 1000) > 60) {
            return false;
        }
        return true;

    }

    public boolean validCode(String otp) {
        if (this.user.getCodeRecovery().equals(otp)) {
            return true;
        }
        return false;
    }

    @Transactional
    public void updatePass(String text) {
        hashMD5.setText(text);
        String pass = hashMD5.md5ToBase64();
        this.user.setPassword(pass);
        userRepositories.save(user);
    }


    public Users findUserById(int id) {
        Users users = null ;
        if(userRepositories.findById(id).isPresent()) users = userRepositories.findById(id).get() ;
        else throw new RuntimeException("not found user") ;
        return users ;
    }

    @Transactional
    public void updateUser(Users user){
        for (Contact contact : user.getContacts()){
            if(contact!=null){
            contactService.delete(contact);}
        }
        for (PlayList playList : user.getPlayLists()){
            if(playList!=null){
            playlistService.deletePlaylist(playList);}
        }
        userRepositories.save(user) ;
    }

    @Transactional
    public boolean updateManyUser(ArrayList<Integer> listIdUser){
        try{
            for (Integer id : listIdUser){
                updateUser(findUserById(id));
            }
            return  true ;
        } catch (Exception e){
            return  false ;
        }
    }
    @Transactional
    public boolean deleteManyUser(ArrayList<Integer> listIdUser){
        try{
            if(updateManyUser(listIdUser)){
                for (Integer id : listIdUser){
                    deleteUser(id);
                }
            }
            return true ;
        }catch (Exception e){
            return  false ;
        }
    }

    @Transactional
    public Users updateStatusUser(int idUser){
        Users user = findUserById(idUser) ;
        if(user==null) throw  new RuntimeException("not found user") ;
        String status = user.getStatus() ;
        if(status!=null){
            if(status.equals("ACTIVE")) user.setStatus("BLOCK");
            else user.setStatus("ACTIVE");
        }
        else user.setStatus("ACTIVE");

        return userRepositories.save(user) ;

    }
    public Users getUser(){
        return user ;
    }



}
