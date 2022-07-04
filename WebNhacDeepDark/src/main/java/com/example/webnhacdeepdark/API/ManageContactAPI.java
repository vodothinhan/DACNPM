package com.example.webnhacdeepdark.API;

import com.example.webnhacdeepdark.model.ObjectResponse;
import com.example.webnhacdeepdark.service.ContactService;
import com.example.webnhacdeepdark.utilities.SendEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class ManageContactAPI {
    @Autowired
    ContactService service;
    @Autowired
    SendEmail sendEmail ;
    @RequestMapping(value = "/deleteContact" ,method = RequestMethod.POST)
    public ResponseEntity<ObjectResponse> deletContact(@RequestBody ArrayList<Integer> listIdContact){
        for(Integer id : listIdContact){
            service.deleteContact(id);
        }
        return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("Oke" , "success")
        );
    }
    @RequestMapping(value = "/replayContact", method = RequestMethod.POST)
    public ResponseEntity<ObjectResponse> replayContact(@RequestBody ArrayList<String> list){
        sendEmail.replayEmail(list);
        return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("oke","success")
        );
    }
}
