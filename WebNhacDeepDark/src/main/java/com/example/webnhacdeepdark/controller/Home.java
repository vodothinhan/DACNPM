package com.example.webnhacdeepdark.controller;


import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.service.AuthorService;
import com.example.webnhacdeepdark.service.SongService;
import com.example.webnhacdeepdark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class Home {
    @Autowired
    UserService userService;
    @Autowired
    AuthorService authorService;
    @Autowired
    SongService songService;

    @RequestMapping(path = "/home", method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView("index");

        List<Song> top10 = songService.findTop10SongByNumListen();
        List<Song> top4newSong = songService.find4NewSong();
        mav.addObject("top10", top10);
        mav.addObject("top4newSong", top4newSong);
        //test

        return mav;
    }

    @RequestMapping(path = "/dulieu", method = RequestMethod.POST)
    public ModelAndView test(@RequestParam("email") String email) {
        ModelAndView mav = new ModelAndView("index2");
        mav.addObject("email", email);
        return mav;

    }

    public String test2() {
        return "test";
    }


    @RequestMapping(path = "/main", method = RequestMethod.GET)
    public ModelAndView main() {
        ModelAndView mav = new ModelAndView("main");
        List<Song> top10 = songService.findTop10SongByNumListen();
        List<Song> top4New = songService.find4NewSong();
        mav.addObject("top4New", top4New);
        mav.addObject("listTop10", top10);
        return mav;
    }

}
