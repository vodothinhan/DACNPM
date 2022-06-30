package com.example.webnhacdeepdark.AdminController;

import com.example.webnhacdeepdark.service.AlbumService;
import com.example.webnhacdeepdark.service.ManageAlbum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Controller
public class ManageAlbumController {
    @Autowired
    AlbumService service ;
    @RequestMapping(value = "/admin/manage-album" , method = RequestMethod.GET)
    public String pageManage(Model model , @RequestParam(name = "add" , required = false) boolean add,
                             @RequestParam(name = "edit",required = false) boolean edit){
        model.addAttribute("add", add);
        model.addAttribute("edit", edit);
        model.addAttribute( "listAlbum",service.findAllAlbum()) ;
        return "manageAlbum" ;
    }

}
