package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.repositories.AuthorRepositories;
import com.example.webnhacdeepdark.repositories.SongRepositories;
import org.apache.coyote.http11.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.*;
import java.util.List;

@Service
public class SongService {
    @Autowired
    SongRepositories songRepositories;


    public Song saveSong(Song song){
        return songRepositories.save(song);
    }

    public Song findById(int id){
        return songRepositories.findById(id).get();
    }

    public List<Song> findSongByType(String type){
        return songRepositories.findSongByType(type);
    }

    public List<Song> findTop10SongByNumListen(){
        return songRepositories.findTop10ByOrderByNumListenDesc();
    }

    public List<Song> find4NewSong(){
        return songRepositories.findTop4ByOrderByDateAddAsc();
    }





}
