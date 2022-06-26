package com.example.webnhacdeepdark.AdminController;

import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.service.AuthorService;
import com.example.webnhacdeepdark.service.SingerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class ManageAuthorController {
    @Autowired
    AuthorService authorService;


    @RequestMapping(value = "admin/manage-author" , method = RequestMethod.GET)
    public String pageManageSinger(Model model){
        List<Author> listAuthor = authorService.findAll();
        model.addAttribute("listAuthor",listAuthor );
        return "manageAuthor";
    }
}
