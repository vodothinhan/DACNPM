package com.example.webnhacdeepdark.model;

import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;
@Component
public class ConvertAuthor {
    @Autowired
    AuthorService service ;
    public Author toEntity(FormAddMusic formMusic){
        Author author = null ;
        if(formMusic.getIdAuthor().isBlank()){
            author = new Author() ;
            author.setName(formMusic.getNameAuthor());
        }
        else {
            Optional<Author> optional = service.findAuthorById(formMusic.getIdAuthor()) ;
            if(optional.isPresent()) author = optional.get() ;
        }
        return author ;
    }
    public Author toEntityOfNewAuthor(FormAddMusic formAddMusic){
        Author author = null ;
        if(formAddMusic.getIdAuthorOfNewAlbum().isBlank()){
            author = new Author() ;
            author.setName(formAddMusic.getNameAuthorNewAlbm());
        }
        else {
            Optional<Author> optional = service.findAuthorById(formAddMusic.getIdAuthorOfNewAlbum()) ;
            if(optional.isPresent()) author = optional.get() ;
        }
        return  author ;
    }
}
