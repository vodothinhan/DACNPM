package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.model.FormAddAlbum;
import com.example.webnhacdeepdark.repositories.AlbumRepositories;
import com.example.webnhacdeepdark.utilities.ConvertFromAddAlbum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class AlbumService {
    @Autowired
    AlbumRepositories albumRepositories;
    @Autowired
    ConvertFromAddAlbum convert ;

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
        return albumRepositories.findByNameContainingIgnoreCase(name);}

    public List<Album> findByNameAuthor(String name){
        return albumRepositories.findByNameContainingIgnoreCase(name);
    }
    public boolean isExistAlbum(String name){
        return albumRepositories.findByName(name).size()==0 ;
    }
    public Optional<Album> findAlbumById(String strId){
        int id = Integer.parseInt(strId) ;
        return  albumRepositories.findById(id) ;
    }

    public List<Album> findAllAlbum(){
        return  albumRepositories.findAll() ;
    }
    public Optional<Album> findAlbumById(int id){
        return  albumRepositories.findById(id) ;
    }
    @Transactional
    public void deleteAuthor(Album album){
        album.deleteAuthor();
    }
    @Transactional
    public void deleteAlbum(Album album){
        albumRepositories.delete(album);
    }
    @Transactional
    public void updateAlbum(FormAddAlbum form){
        Album album = findAlbumById(form.getIdAlbum()).get();
        Album albumConverted = convert.toEntity(form);
        album.setAuthor(albumConverted.getAuthor());
        album.setName(albumConverted.getName());
        album.setDateReleased(albumConverted.getDateReleased());
    }



}
