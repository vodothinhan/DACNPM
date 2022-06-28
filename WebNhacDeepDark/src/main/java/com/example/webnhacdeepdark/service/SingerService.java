package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.repositories.SingerRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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

    public List<Singer> findByNameContainingIgnoreCase(String name) { return singerRepositories.findByNameContainingIgnoreCase(name);}
    public List<Singer> findAll(){
        return  singerRepositories.findAll();
    }
    public List<Singer> findByNameSinger(String name){
        return singerRepositories.findByNameContainingIgnoreCase(name);
    }
    public Optional<Singer> findSingerById(String strId){
        int id = Integer.parseInt(strId) ;
        return singerRepositories.findById(id) ;
    }

    @Transactional
    public void deleteSinger(int id){
        singerRepositories.deleteSingerById(id);
    }

    @Transactional
    public boolean deleteManySinger(ArrayList<Integer> listIdSinger){
        try{
                for (Integer id : listIdSinger){
                    for (Song song : findSingerById(id).getSongList()){
                        song.setSinger(null);
                    }
                    deleteSinger(id);
                }
            return true ;
        }catch (Exception e){
            return  false ;
        }
    }

    @Transactional
    public Singer addSinger(String nameSinger) {
            return singerRepositories.save(new Singer(nameSinger));
    }

    @Transactional
    public Singer updateSinger(Singer singer) {
            findSingerById(singer.getId()).setName(singer.getName());
            return findSingerById(singer.getId());
    }
}
