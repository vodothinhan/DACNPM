package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.repositories.AlbumRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AlbumService {
    @Autowired
    AlbumRepositories albumRepositories;

    public Album getAlbumByID(int id){
        return albumRepositories.findById(id).get();
    }
    public List<Album> findAll() {
        return albumRepositories.findAll();
    }

    public Album saveAlbum(Album album){
        return albumRepositories.save(album);
    }
    public List<Album> findByNameContainingIgnoreCase(String name) {
        return albumRepositories.findByNameContainingIgnoreCase(name);};
}
