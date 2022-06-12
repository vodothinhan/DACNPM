package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.repositories.SingerRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SingerService {
    @Autowired
    SingerRepositories singerRepositories;

    public Singer findSingerById(int id){ return singerRepositories.findSingerById(id);}

    public Singer getAuthorByID(int id){
        return singerRepositories.findById(id).get();
    }

    public Singer saveAuthor(Singer singer){
        return singerRepositories.save(singer);
    }

    public List<Singer> findByNameContainingIgnoreCase(String name) { return singerRepositories.findByNameContainingIgnoreCase(name);};

}
