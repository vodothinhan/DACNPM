package com.example.webnhacdeepdark.AdminController;

import com.example.webnhacdeepdark.entity.Album;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EditAlbumController {
    @Autowired
    CreateDate createDate ;
    @Autowired
    ConvertFromAddAlbum convert ;
    @Autowired
    AlbumService service ;
    @RequestMapping(value = "/admin/edit-album" , method = RequestMethod.GET)
   public String pageEditAlbum(Model model , @RequestParam(name = "id") String id){
        model.addAttribute("album" ,convert.convertFormAlbum(id)) ;
       model.addAttribute("listDay", createDate.createDays());
       model.addAttribute("listMonth", createDate.createMonths());
       model.addAttribute("listYear", createDate.createYears());
       return "editAlbum" ;
   }
   @RequestMapping(value = "/admin/edit-album" , method = RequestMethod.POST)
   public ModelAndView editAlbum(ModelMap modelMap , @ModelAttribute(name = "album") FormAddAlbum formAlbum){

        try{
            service.updateAlbum(formAlbum);
            modelMap.addAttribute("edit",true);
            return new ModelAndView("redirect:/admin/manage-album" , modelMap);
        }catch (Exception e) {
            modelMap.addAttribute("listDay", createDate.createDays());
            modelMap.addAttribute("listMonth", createDate.createMonths());
            modelMap.addAttribute("listYear", createDate.createYears());
            modelMap.addAttribute("edit", false);
            return new ModelAndView("editAlbum" , modelMap) ;
        }
   }



}
