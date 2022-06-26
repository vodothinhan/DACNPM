package com.example.webnhacdeepdark.API;

import com.example.webnhacdeepdark.model.ObjectResponse;
import com.example.webnhacdeepdark.service.AuthorService;
import com.example.webnhacdeepdark.service.SingerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class ManageAuthorAPI {
    @Autowired
    AuthorService service ;
    @RequestMapping(value = "/deleteAuthor" , method = RequestMethod.POST)
    public ResponseEntity<ObjectResponse> deleteUser(@RequestBody ArrayList<Integer> listIdAuthor) {
        if (service.deleteManyAuthor(listIdAuthor)) return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("oke", "TRUE")
        );
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ObjectResponse("", ""));
    }
}
