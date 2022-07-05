package com.example.webnhacdeepdark.service;


import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.model.ConvertSong;
import com.example.webnhacdeepdark.model.FormAddMusic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class AddMusic {

    @Autowired
    SongService songService ;
    @Autowired
    ConvertSong convertSong ;
    @Autowired
    UploadFileService uploadFile ;

    public boolean addMusic(FormAddMusic formMusic) {
        try{
            long start = System.currentTimeMillis();
            Song song = songService.saveSong(convertSong.toEntity(formMusic));
            uploadFile.saveFileMusic(formMusic.getFileMusic(), song.getId());
            uploadFile.saveThumbnail(formMusic.getFileThumbnail(), song.getId());
            song.setLinkMP3("/mp3/"+song.getId()+uploadFile.getExtensionFile(formMusic.getFileMusic()));
            song.setLinkImage("/thumbnail/"+song.getId()+uploadFile.getExtensionFile(formMusic.getFileThumbnail()));
            songService.saveSong(song) ;
            System.out.println((System.currentTimeMillis()-start)/1000 +" giay");
            return  true ;
        } catch (Exception e){
            System.out.println(e.getMessage());
            return  false ;
        }
    }
}
