package com.example.webnhacdeepdark.AdminController;

import com.example.webnhacdeepdark.utilities.CreateDate;
import com.example.webnhacdeepdark.utilities.CreateTypeSong;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AddMusicController {
    @Autowired
    CreateTypeSong typeSong ;
    @Autowired
    CreateDate createDate ;
    @RequestMapping(value = "admin/add-music" , method = RequestMethod.GET)
    public String pageAddMusic(Model model){
        model.addAttribute("listType", typeSong.createTypeSong());
        model.addAttribute("listDay" , createDate.createDays());
        model.addAttribute("listMonth" , createDate.createMonths());
        model.addAttribute("listYear" , createDate.createYears());
        return "addMusic";
    }

}
