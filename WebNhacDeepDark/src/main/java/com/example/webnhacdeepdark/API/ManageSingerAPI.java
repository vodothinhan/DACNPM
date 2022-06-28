package com.example.webnhacdeepdark.API;

import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.model.ObjectResponse;
import com.example.webnhacdeepdark.service.SingerService;
import com.example.webnhacdeepdark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class ManageSingerAPI {
    @Autowired
    SingerService service ;
    @RequestMapping(value = "/deleteSinger" , method = RequestMethod.POST)
    public ResponseEntity<ObjectResponse> deleteSinger(@RequestBody ArrayList<Integer> listIdSinger) {
        if (service.deleteManySinger(listIdSinger)) return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("oke", "TRUE")
        );
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ObjectResponse("", ""));
    }

    @RequestMapping(value = "/addSinger" , method = RequestMethod.POST)
    public ResponseEntity<ObjectResponse> addSinger(@RequestBody String nameSinger) {
        return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("oke",service.addSinger(nameSinger) )
        );
    }

    @RequestMapping(value = "/updateSinger" , method = RequestMethod.POST)
    public ResponseEntity<ObjectResponse> updateSinger(@RequestBody Singer singer) {
        return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("oke", service.updateSinger(singer))
        );
    }

}
