package com.example.webnhacdeepdark.AdminController;

import com.example.webnhacdeepdark.controller.User;
import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.service.UserService;
import com.example.webnhacdeepdark.utilities.CreateTypeSong;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class ManageUserController {
    @Autowired
    UserService userService;


    @RequestMapping(value = "admin/manage-user" , method = RequestMethod.GET)
    public String pageManageUser(Model model){
        List<Users> listUser = userService.findAll();
        model.addAttribute("listUser",listUser );
        return "manageUser";
    }
}
