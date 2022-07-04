package com.example.webnhacdeepdark.AdminController;

import com.example.webnhacdeepdark.model.ConvertSong;
import com.example.webnhacdeepdark.utilities.CreateDate;
import com.example.webnhacdeepdark.utilities.CreateTypeSong;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EditSongController {
    @Autowired
    CreateTypeSong typeSong ;
    @Autowired
    CreateDate createDate ;
    @Autowired
    ConvertSong convertSong ;
    @RequestMapping(value = "/admin/edit-song" ,method = RequestMethod.GET)
    public String pageEditSong(Model model, @RequestParam(name = "id") String id){
        model.addAttribute("listType", typeSong.createTypeSong());
        model.addAttribute("song",convertSong.convertForm(id));
        model.addAttribute("listDay" , createDate.createDays()) ;
        model.addAttribute("listMonth",createDate.createMonths());
        model.addAttribute("listYear",createDate.createYears());
        return "editSong";
    }
}
