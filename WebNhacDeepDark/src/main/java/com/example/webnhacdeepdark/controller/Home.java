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
    public ModelAndView search(@RequestParam(name = "inputSearch") String inputSearch) {
        ModelAndView mav = new ModelAndView("search");
        List<Song> listSearchName = new ArrayList<Song>();
        List<Author> author = authorService.findByNameContaining(inputSearch);
        System.out.println("author = " + author);
        ArrayList<Song> listByNameAuthor = new ArrayList<>();
        for (int i = 0; i < author.size(); i++) {
            listSearchName = songService.findByAuthor(author.get(i),listByNameAuthor);
        }
        mav.addObject("listSearchName", listSearchName);
        return mav;
    }

}
