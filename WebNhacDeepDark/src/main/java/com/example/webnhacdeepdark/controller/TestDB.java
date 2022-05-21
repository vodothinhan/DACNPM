package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.service.AlbumService;
import com.example.webnhacdeepdark.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

@RestController
public class TestDB {
    @Autowired
    AuthorService authorService;
    @Autowired
    AlbumService albumService;

    @PostMapping(path = "/api/authors")
    public void insertAuthor(){
        authorService.saveAuthor(new Author("Van Darkholm"));
    }

    @PutMapping(path = "/api/authors")
    @Transactional
    public void insertAuthorsAndAlbum(){
        Author a = authorService.getAuthorByID(1);
        Album b = new Album("Gachimuchi", new Date());
        b.addAuthor(a);
        albumService.saveAlbum(b);
    }

    @GetMapping(path = "/api/albums")
    public List<Album> getAllAlbum(){
        Author a = authorService.getAuthorByID(1);
        return a.getAlbumList();
    }

}
