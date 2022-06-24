package com.example.webnhacdeepdark.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Service
public class UploadFileService {
    private final Path rootMusic =Paths.get("src\\main\\resources\\static\\mp3");
    private final Path rootThumbnail = Paths.get("src\\main\\resources\\static\\thumbnail");

    public boolean saveFileMusic(MultipartFile file , int id){
        try{
            Files.copy(file.getInputStream() ,this.rootMusic.resolve(id+getExtensionFile(file)), StandardCopyOption.REPLACE_EXISTING);
            return true  ;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return  false ;
        }
    }
    public boolean saveThumbnail(MultipartFile file , int id){
        try{
            Files.copy(file.getInputStream() ,this.rootThumbnail.resolve(id+getExtensionFile(file)));
            return  true ;
        } catch(Exception e){
            return  false ;
        }
    }
   public  String getExtensionFile(MultipartFile file){
        String fileName = file.getOriginalFilename() ;
    return fileName.substring(fileName.lastIndexOf("."));
    }


}
