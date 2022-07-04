package com.example.webnhacdeepdark.model;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.service.SongService;
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
    @Autowired
    SongService service ;

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
    public FormAddMusic convertForm(String idSong){
        Song song = service.findSongById(Integer.parseInt(idSong));
        Author author = song.getAuthor();
        Singer singer = song.getSinger();
        Album album = song.getAlbum() ;
        FormAddMusic form = new FormAddMusic();
        form.setIdSong(idSong);
        form.setNameSong(song.getName());
        form.setTypeSong(song.getType());
        form.setIdSinger(singer==null?"":String.valueOf(singer.getId()));
        form.setNameSinger(singer==null?"":singer.getName());
        form.setIdAuthor(author==null?"":String.valueOf(author.getId()));
        form.setNameAuthor(author==null?"":author.getName());
        form.setIdAlbum(album==null?"":String.valueOf(album.getId()));
        form.setNameAlbum(album==null?"":album.getName());
        return form ;

    }
}
