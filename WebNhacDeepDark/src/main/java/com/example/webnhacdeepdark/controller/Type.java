package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class Type {
    @Autowired
    SongService songService;

    @RequestMapping(path = "/type",method = RequestMethod.GET)
    public ModelAndView type(@RequestParam String type,@RequestParam String action, ModelMap model){
        if(action.equalsIgnoreCase("songType")){
            List<Song> songs = songService.findSongByType(type);
            model.addAttribute("typeName",type);
            model.addAttribute("songsWithName",songs);
            return new ModelAndView("type",model);
        }else if(action.equalsIgnoreCase("viewAlbum")){

        }

        return new ModelAndView("type",model);
    }

}
