package com.example.webnhacdeepdark.model;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class ConvertAlbum {
    @Autowired
    AlbumService service ;
    @Autowired
    ConvertAuthor convertAuthor ;
    public Album toEntity(FormAddMusic formMusic){
        Album album = null ;
        if(formMusic.getIdAlbum().isBlank()){
            album = new Album() ;
            album.setAuthor(convertAuthor.toEntityOfNewAuthor(formMusic));
            album.setName(formMusic.getNameNewAlbum());
        }
        else {
            Optional<Album>  optional = service.findAlbumById(formMusic.getIdAlbum()) ;
            if(optional.isPresent()) album = optional.get() ;
        }

        return  album ;
    }
}
