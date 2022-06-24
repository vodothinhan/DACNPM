package com.example.webnhacdeepdark.model;

import com.example.webnhacdeepdark.entity.Song;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class ConvertSong {
    @Autowired
    ConvertAuthor author ;
    @Autowired
    ConvertSinger singer ;
    @Autowired
    ConvertAlbum album ;

    public Song toEntity(FormAddMusic formMusic){

        Song song = new Song() ;
        song.setName(formMusic.getNameSong());
        song.setAlbum(album.toEntity(formMusic));
        song.setAuthor(author.toEntity(formMusic));
        song.setSinger(singer.toEntity(formMusic));
        song.setDateAdd(new Date());
        song.setLinkImage("");
        song.setLinkMP3("");
        song.setNumListen(0);
        song.setType(formMusic.getTypeSong());
        song.setStatus("ACTIVE");

       return song ;
    }
}
