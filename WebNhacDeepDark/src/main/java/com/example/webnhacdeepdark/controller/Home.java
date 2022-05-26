package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.service.AlbumService;
import com.example.webnhacdeepdark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class Home {
    @Autowired
    UserService userService;
    @Autowired
    AlbumService albumService;

    @RequestMapping(path = "/home", method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView mav = new ModelAndView("index");
        Users u = userService.findById(69);
        mav.addObject("user", u);

        return mav;
    }

    @RequestMapping(path = "/dulieu", method = RequestMethod.POST)
    public ModelAndView test(@RequestParam("email") String email){
        ModelAndView mav = new ModelAndView("index2");
        mav.addObject("email", email);
        return mav;

    }

    @RequestMapping(path = "/testUser", method = RequestMethod.GET)
        public String test2(){
            return "test";
        }

    @RequestMapping(path = "/search")
    public ModelAndView search(){
        ModelAndView mav = new ModelAndView("Search");
//        List<Album> list = albumService.SearchNameAllbum(name);
//        mav.addObject("list", list);
        return mav;
    }
}