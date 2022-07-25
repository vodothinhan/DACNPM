package com.example.webnhacdeepdark.API;

import com.example.webnhacdeepdark.model.FormAddMusic;
import com.example.webnhacdeepdark.model.ObjectResponse;
import com.example.webnhacdeepdark.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminAddMusicAPI {
    @Autowired
    AlbumService albumService ;
    @Autowired
    AuthorService authorService;
    @Autowired
    SingerService singerService ;
    @Autowired
    AddMusic addMusic;
    @RequestMapping(value = "/getAllAlbum" , method = RequestMethod.GET)
    public ResponseEntity<ObjectResponse> getAllAlbum(){
        return ResponseEntity.status(HttpStatus.OK).body(
              new ObjectResponse("success" , albumService.findAll())
        );
    }
    @RequestMapping(value = "/getAllAuthor" , method = RequestMethod.GET)
    public ResponseEntity<ObjectResponse> getAllAuthor(){
        return ResponseEntity.status(HttpStatus.OK).body(
               new ObjectResponse("success" , authorService.findAll())
        ) ;
    }
    @RequestMapping(value = "/getAllSinger" , method = RequestMethod.GET)
    public ResponseEntity<ObjectResponse> getAllSinger(){
        return  ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("success" , singerService.findAll())
        );
    }
    @RequestMapping(value = "/isExistAlbum" , method = RequestMethod.GET)
    public ResponseEntity<ObjectResponse> isExistAlbum(@RequestParam(name = "name") String name){
        if(albumService.isExistAlbum(name)) return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("success" ,"FALSE" )
        ) ;
        return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("success" , "TRUE")
        );
    }
    @RequestMapping(value = "/findNameAuthor" , method = RequestMethod.GET)
    public ResponseEntity<ObjectResponse> findNameAuthor(@RequestParam(name = "name") String name){
        return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("success" ,authorService.findByNameAuthor(name) )
        ) ;
    }
    @RequestMapping(value = "/findNameSinger" , method = RequestMethod.GET)
    public ResponseEntity<ObjectResponse> findNameSinger(@RequestParam(name = "name") String name){
        return  ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("success" , singerService.findByNameSinger(name))
        ) ;
    }
    @RequestMapping(value = "/findNameAlbum"  , method = RequestMethod.GET)
    public ResponseEntity<ObjectResponse> findNameAlbum(@RequestParam(name = "name") String name){
        return  ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("scucess" , albumService.findByNameAuthor(name))
        ) ;

    }
    @RequestMapping(value = "/addMusic", method = RequestMethod.POST)
    public ResponseEntity<ObjectResponse> addMusic(FormAddMusic formAddMusic){
           if(addMusic.addMusic(formAddMusic)) return ResponseEntity.status(HttpStatus.OK).body(
                   new ObjectResponse("oke" , "")
           ) ;
        return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("failure" , formAddMusic.toString())
        );

    }


}
