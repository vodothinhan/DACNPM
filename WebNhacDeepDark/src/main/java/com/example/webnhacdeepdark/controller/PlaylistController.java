package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class PlaylistController {
    @Autowired
    SongService songService;
    @RequestMapping(path = "/playlist", method = RequestMethod.GET)
    public ModelAndView playlist() {
        ModelAndView mav = new ModelAndView("playlist");
        List<Song> songs = songService.findAll();
        mav.addObject("songs",songs);
        return mav;
    }
}
