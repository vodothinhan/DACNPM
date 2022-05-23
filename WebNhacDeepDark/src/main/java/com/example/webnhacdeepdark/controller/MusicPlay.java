package com.example.webnhacdeepdark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MusicPlay {

    @RequestMapping(path = "/play")
    public String toMusicPlayPage(){
        return "music_play";
    }
}
