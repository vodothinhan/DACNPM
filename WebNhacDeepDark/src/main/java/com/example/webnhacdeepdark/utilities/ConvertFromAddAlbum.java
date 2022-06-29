package com.example.webnhacdeepdark.utilities;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.model.FormAddAlbum;
import com.example.webnhacdeepdark.service.AlbumService;
import com.example.webnhacdeepdark.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
@Component
public class ConvertFromAddAlbum {
@Autowired
AuthorService service ;
@Autowired
AlbumService albumService;
    public Album toEntity(FormAddAlbum formAlbum){
        Album album = new Album() ;
        album.setName(formAlbum.getNameAlbum());
        String strDate = formAlbum.getDay()+"/"+formAlbum.getMonth()+"/"+formAlbum.getYear() ;
        album.setDateReleased(convertStrtoDate(strDate));
        if(formAlbum.getIdAuthor().isBlank()) {
            Author author = new Author() ;
            author.setName(formAlbum.getNameAuthor());
            album.addAuthor(author);
        }else {

            Author author = service.findAuthorById(formAlbum.getIdAuthor()).get() ;
            album.setAuthor(author);
        }
        return album ;
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
    public FormAddAlbum convertFormAlbum(String strId){
        Album album = albumService.findAlbumById(strId).get();
        FormAddAlbum form = new FormAddAlbum() ;
        form.setIdAlbum(String.valueOf(album.getId()));
        String [] strDate = dateToStrDate(album.getDateReleased());
        form.setDay(strDate[0]);
        form.setMonth(strDate[1]);
        form.setYear(strDate[2]);
        form.setNameAlbum(album.getName());
        form.setNameAuthor(album.getAuthor()==null?"":album.getAuthor().getName());
        form.setIdAuthor(String.valueOf(album.getAuthor()==null?"":album.getAuthor().getId()));
        return form ;
    }
    private String [] dateToStrDate(Date date){
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String strDate = formatter.format(date);
        return strDate.split("/");
    }


}
