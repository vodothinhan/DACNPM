package com.example.webnhacdeepdark.model;

import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.service.SingerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;
@Component
public class ConvertSinger {
    @Autowired
    SingerService service ;
    public Singer toEntity(FormAddMusic formMusic) {
        Singer  singer = null ;
        if(formMusic.getIdSinger().isBlank()){
            singer  = new Singer() ;
            singer.setName(formMusic.getNameSinger());
        }
        else {
            Optional<Singer> optional = service.findSingerById(formMusic.getIdSinger()) ;
            if(optional.isPresent()) singer = optional.get() ;
        }
        return  singer ;
    }
}
