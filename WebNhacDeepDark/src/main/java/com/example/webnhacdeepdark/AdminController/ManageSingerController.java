package com.example.webnhacdeepdark.AdminController;

import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.service.SingerService;
import com.example.webnhacdeepdark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class ManageSingerController {
    @Autowired
    SingerService singerService;


    @RequestMapping(value = "admin/manage-singer" , method = RequestMethod.GET)
    public String pageManageSinger(Model model){
        List<Singer> listSinger = singerService.findAll();
        model.addAttribute("listSinger",listSinger );
        return "manageSinger";
    }
}
