package com.example.webnhacdeepdark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MusicPlay {

    @RequestMapping(path = "/play")
    public ModelAndView toMusicPlayPage(){
        ModelAndView mav = new ModelAndView("music_play");
        List<String> list = new ArrayList<>();
        list.add("13");
        list.add("1");
        list.add("Evan2");
        mav.addObject("playlist", list);
        return mav;
    }
}
