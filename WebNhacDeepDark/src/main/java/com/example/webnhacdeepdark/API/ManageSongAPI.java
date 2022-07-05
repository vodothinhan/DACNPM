package com.example.webnhacdeepdark.API;

import com.example.webnhacdeepdark.entity.PlayList;
import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.model.ObjectResponse;
import com.example.webnhacdeepdark.service.ManageSongService;
import com.example.webnhacdeepdark.service.UploadFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@RestController
public class ManageSongAPI {
    @Autowired
    ManageSongService service;
    @Autowired
    UploadFileService uploadFileService;
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

    @RequestMapping(value = "/edit-file-mp3", method = RequestMethod.POST)
    public ResponseEntity<ObjectResponse> editFileMusic(@RequestPart("file") MultipartFile file , @RequestParam("id") String id){
       uploadFileService.saveFileMusic(file,Integer.parseInt(id));
        return  ResponseEntity.status(HttpStatus.OK).body(
          new ObjectResponse("oke" ,"success")
        );

    }
    @RequestMapping(value = "/edit-file-thumbnail" , method = RequestMethod.POST)
    public ResponseEntity<ObjectResponse> editFileThumbnail(@RequestParam("file") MultipartFile file,
                                                            @RequestParam("id") String id){
        uploadFileService.saveThumbnail(file,Integer.parseInt(id));
        System.out.println(file.getOriginalFilename()+" "+id);
        return ResponseEntity.status(HttpStatus.OK).body(
                new ObjectResponse("oke","success")
        );
    }

}
