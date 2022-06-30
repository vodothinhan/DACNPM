package com.example.webnhacdeepdark.AdminController;

import com.example.webnhacdeepdark.model.FormAddAlbum;
import com.example.webnhacdeepdark.service.AlbumService;
import com.example.webnhacdeepdark.utilities.ConvertFromAddAlbum;
import com.example.webnhacdeepdark.utilities.CreateDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AddAlbumController {
    @Autowired
    CreateDate createDate;
    @Autowired
    AlbumService albumService;
    @Autowired
    ConvertFromAddAlbum convert;

    @RequestMapping(value = "/admin/add-album", method = RequestMethod.GET)
    public String pageAddAlbum(@ModelAttribute(name = "album") FormAddAlbum formalbum, Model model) {
        model.addAttribute("listDay", createDate.createDays());
        model.addAttribute("listMonth", createDate.createMonths());
        model.addAttribute("listYear", createDate.createYears());
        return "addAlbum";
    }

    @RequestMapping(value = "/admin/add-album", method = RequestMethod.POST)
    public ModelAndView addAlbum(ModelMap modelMap, @ModelAttribute(name = "album") FormAddAlbum formAlbum) {
        try {
            albumService.saveAlbum(convert.toEntity(formAlbum));
            modelMap.addAttribute("add", true);
            return new ModelAndView("redirect:/admin/manage-album", modelMap);
        } catch (Exception e) {
            modelMap.addAttribute("listDay", createDate.createDays());
            modelMap.addAttribute("listMonth", createDate.createMonths());
            modelMap.addAttribute("listYear", createDate.createYears());
            modelMap.addAttribute("add",false);
            return new ModelAndView("addAlbum", modelMap);
        }
    }
}
