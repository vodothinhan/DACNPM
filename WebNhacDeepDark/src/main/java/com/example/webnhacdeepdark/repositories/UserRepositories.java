package com.example.webnhacdeepdark.repositories;

import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepositories extends JpaRepository<Users, Integer> {
    public Users findFirstByEmail(String email) ;
    public Users findFirstByEmailAndPassword(String email , String pass);
    public List<Users> findAll();
}
