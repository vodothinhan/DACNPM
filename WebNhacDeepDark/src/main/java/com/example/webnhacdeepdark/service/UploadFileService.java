package com.example.webnhacdeepdark.service;

import org.apache.tomcat.jni.File;
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
    public void deleteFileMusic(int idSong){
        String pathMp3 = "src\\main\\resources\\static\\mp3\\" ;
        String pathMp4 = "src\\main\\resources\\static\\mp3\\" ;
       try{
           if(Files.exists(Paths.get(pathMp3+idSong+".mp3"))){
               Files.delete(Paths.get(pathMp3+idSong+".mp3"));
               return;
           }
           if(Files.exists(Paths.get(pathMp4+idSong+".mp4"))){
               Files.delete(Paths.get(pathMp4+idSong+".mp4"));
               return;
           }

       } catch (Exception e){
           return;
       }

    }
    public void deleFileThumbnail(int idsong){
        String pathThumbnailJpeg = "src\\main\\resources\\static\\thumbnail\\"+idsong+".jpeg" ;
        String pathThumbnailPng = "src\\main\\resources\\static\\thumbnail\\"+idsong+".png" ;
        try{
            if(Files.exists(Paths.get(pathThumbnailJpeg))) {
                Files.delete(Paths.get(pathThumbnailJpeg));
                return;
            }
            if(Files.exists(Paths.get(pathThumbnailPng))) {
                Files.delete(Paths.get(pathThumbnailPng));
                return;
            }
        } catch (Exception e){

            return;
        }

    }
   public  String getExtensionFile(MultipartFile file){
        String fileName = file.getOriginalFilename() ;
    return fileName.substring(fileName.lastIndexOf("."));
    }


}
