package com.example.webnhacdeepdark.API;

import com.example.webnhacdeepdark.model.ObjectResponse;
import com.example.webnhacdeepdark.service.ManageSongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class ManageSongAPI {
    @Autowired
    ManageSongService service;
    @RequestMapping(value = "/deleteSong" , method = RequestMethod.POST)
    public ResponseEntity<ObjectResponse> deleteSong(@RequestBody ArrayList<Integer> listIdSong) {
            if(service.deleteSong(listIdSong)) {
                return ResponseEntity.status(HttpStatus.OK).body(
                        new ObjectResponse("oke" , "TRUE")
                ) ;
            }
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ObjectResponse("" ,""));

    }
    @RequestMapping(value = "/update-status-song")
    public ResponseEntity<ObjectResponse> updateStatusSong(@RequestBody int idSong){
       return  ResponseEntity.status(HttpStatus.OK).body(
               new ObjectResponse("oke" , service.updateStatus(idSong))
       ) ;

    }
}
