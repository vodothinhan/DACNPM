package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.entity.Song;

import com.example.webnhacdeepdark.service.SingerService;

import com.example.webnhacdeepdark.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import java.util.List;

@Controller
public class Type {
    @Autowired
    SongService songService;

    @Autowired
    SingerService singerService;

    @RequestMapping(path = "/type",method = RequestMethod.GET)
    public ModelAndView type(@RequestParam String type, @RequestParam String action, ModelMap model){
        if(action.equalsIgnoreCase("songType")){
            System.out.println(type);
            List<Song> songs = songService.findSongByType(type);
            model.addAttribute("typeName",type);
            model.addAttribute("songsWithName",songs);
            return new ModelAndView("type",model);
        }else if(action.equalsIgnoreCase("singerName")){
            int idSinger = Integer.parseInt(type);
            List<Song> songs = songService.findSongBySinger(idSinger);
            String nameSinger = singerService.findSingerById(idSinger).getName();
            model.addAttribute("typeName",nameSinger);
            model.addAttribute("songsWithName",songs);
            return new ModelAndView("type",model);
        }

        return new ModelAndView("type",model);
    }

}
