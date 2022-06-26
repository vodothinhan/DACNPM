package com.example.webnhacdeepdark.API;

import com.example.webnhacdeepdark.model.ObjectResponse;
import com.example.webnhacdeepdark.service.SongService;
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
public class ManageUserAPI {
    @Autowired
    UserService service ;
    @RequestMapping(value = "/deleteUser" , method = RequestMethod.POST)
    public ResponseEntity<ObjectResponse> deleteUser(@RequestBody ArrayList<Integer> listIdUser) {
        if (service.deleteManyUser(listIdUser)) return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("oke", "TRUE")
        );
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ObjectResponse("", ""));
    }

    @RequestMapping(value = "/update-status-user")
    public ResponseEntity<ObjectResponse> updateStatusSong(@RequestBody int idUser){
        return  ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("oke" , service.updateStatusUser(idUser))
        ) ;

    }
}
