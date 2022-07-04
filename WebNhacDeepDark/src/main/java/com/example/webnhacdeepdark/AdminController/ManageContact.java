package com.example.webnhacdeepdark.AdminController;

import com.example.webnhacdeepdark.service.AlbumService;
import com.example.webnhacdeepdark.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManageContact {
    @Autowired
    ContactService service ;
    @RequestMapping(value = "/admin/manage-contact")
    public String pageContact(Model model){
        model.addAttribute("list" , service.findAllContact());
        return "manageContact" ;
    }

}
