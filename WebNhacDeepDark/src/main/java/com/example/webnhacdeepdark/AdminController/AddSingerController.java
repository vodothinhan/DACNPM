package com.example.webnhacdeepdark.AdminController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AddSingerController {
    @RequestMapping(value = "admin/add-singer" , method = RequestMethod.GET)
    public String pageAddMusic(Model model){

        return "addSinger";
    }
}
