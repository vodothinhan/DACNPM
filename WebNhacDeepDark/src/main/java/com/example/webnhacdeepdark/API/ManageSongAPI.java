package com.example.webnhacdeepdark.API;

import com.example.webnhacdeepdark.entity.PlayList;
import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.model.ObjectResponse;
import com.example.webnhacdeepdark.service.ManageSongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
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

    @RequestMapping(value = "/updatePlaylist" , method = RequestMethod.POST)
    public ResponseEntity<ObjectResponse> updatePlaylist(@RequestBody ArrayList<Integer> arrayList) {
        if(service.updatePlaylist(arrayList.get(0),arrayList.get(1))) {
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ObjectResponse("oke" , "TRUE")
            ) ;
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ObjectResponse("" ,""));
    }
}
