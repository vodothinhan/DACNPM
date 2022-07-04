package com.example.webnhacdeepdark.model;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

@Component
public class ConvertAlbum {
    @Autowired
    AlbumService service ;
    @Autowired
    ConvertAuthor convertAuthor ;
    public Album toEntity(FormAddMusic formMusic){
        Album album = null ;
        if(formMusic.getIdAlbum().isBlank()&&formMusic.getNameAuthorNewAlbm().isBlank()) return album ;
        if(formMusic.getIdAlbum().isBlank()){
            album = new Album() ;
            String strDate = formMusic.getDay()+"/"+formMusic.getMonth()+"/"+formMusic.getYear();
            album.setAuthor(convertAuthor.toEntityOfNewAuthor(formMusic));
            album.setName(formMusic.getNameNewAlbum());
            album.setDateReleased(convertStrtoDate(strDate));
        }
        else {
            Optional<Album>  optional = service.findAlbumById(formMusic.getIdAlbum()) ;
            if(optional.isPresent()) album = optional.get() ;
        }

        return  album ;
    }
    private String [] dateToStrDate(Date date){
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String strDate = formatter.format(date);
        return strDate.split("/");
    }
    private Date convertStrtoDate(String strDate){
        SimpleDateFormat formatter=new SimpleDateFormat("dd/MM/yyyy");
        try {
            return formatter.parse(strDate) ;
        } catch (ParseException e) {
            System.out.println(e.getMessage());
            return null ;
        }

    }

}
