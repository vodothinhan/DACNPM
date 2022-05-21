package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.repositories.AlbumRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlbumService {
    @Autowired
    AlbumRepositories albumRepositories;

    public Album getAlbumByID(int id){
        return albumRepositories.findById(id).get();
    }

    public Album saveAlbum(Album album){
        return albumRepositories.save(album);
    }
}
