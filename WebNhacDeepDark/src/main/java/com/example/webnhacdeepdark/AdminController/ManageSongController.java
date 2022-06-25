package com.example.webnhacdeepdark.AdminController;

import com.example.webnhacdeepdark.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManageSongController {
    @Autowired
    SongService service ;
    @RequestMapping(value = "admin/manage-song", method = RequestMethod.GET)
    public String pageManageSong(Model model){
        model.addAttribute("listSong" , service.getAllSong());
        return "manageSong" ;
    }
}
