package com.example.webnhacdeepdark.API;

import com.example.webnhacdeepdark.model.ObjectResponse;
import com.example.webnhacdeepdark.service.ManageAlbum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class ManageAlbumAPI {
@Autowired
    ManageAlbum manageAlbum ;
    @RequestMapping(value = "/deleteAlbum" , method = RequestMethod.POST)

    public ResponseEntity<ObjectResponse> deleteAlbum(@RequestBody ArrayList<Integer> listIdAlbum){
        manageAlbum.deleteAlbums(listIdAlbum);
        return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("success" , "oke")
        );
    }
}
