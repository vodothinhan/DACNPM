package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Song;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
public class ManageSongService {
    @Autowired
    SongService service ;
    @Autowired
    UploadFileService fileService ;
    @Transactional
    public boolean deleteSong(ArrayList<Integer> list){
        try {
            if(service.deleteManySong(list)){
                for(Integer id : list){
                    fileService.deleteFileMusic(id);
                    fileService.deleFileThumbnail(id);
                }
            }
            return  true  ;

        } catch (Exception e){
            return  false ;
        }
    }
    public Song updateStatus(int idSong){
         return service.updateStatusSong(idSong);
    }

    public Boolean updatePlaylist(int idSong,int idUser) {
        try{
            service.updatePlaylist(idSong,idUser);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
