package com.example.webnhacdeepdark.AdminController;

import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.model.ConvertSong;
import com.example.webnhacdeepdark.model.FormAddMusic;
import com.example.webnhacdeepdark.service.SongService;
import com.example.webnhacdeepdark.utilities.CreateDate;
import com.example.webnhacdeepdark.utilities.CreateTypeSong;
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
public class EditSongController {
    @Autowired
    CreateTypeSong typeSong ;
    @Autowired
    CreateDate createDate ;
    @Autowired
    ConvertSong convertSong ;
    @Autowired
    SongService service ;
    @RequestMapping(value = "/admin/edit-song" ,method = RequestMethod.GET)
    public String pageEditSong(Model model, @RequestParam(name = "id") String id){
        model.addAttribute("listType", typeSong.createTypeSong());
        model.addAttribute("song",convertSong.convertForm(id));
        model.addAttribute("listDay" , createDate.createDays()) ;
        model.addAttribute("listMonth",createDate.createMonths());
        model.addAttribute("listYear",createDate.createYears());
        return "editSong";
    }
    @RequestMapping(value = "/admin/edit-song",method = RequestMethod.POST)
    public ModelAndView editSong(ModelMap model , @ModelAttribute(name = "song")FormAddMusic form){

            try{
                Song song = convertSong.toEntity(form);
                song.setId(Integer.parseInt(form.getIdSong()));
                service.updateAlbum(song);
                model.addAttribute("editSong",true);
                return new ModelAndView("redirect:/admin/manage-song", model);

            }catch (Exception e){
                model.addAttribute("listType", typeSong.createTypeSong());
                model.addAttribute("listDay" , createDate.createDays()) ;
                model.addAttribute("listMonth",createDate.createMonths());
                model.addAttribute("listYear",createDate.createYears());
                model.addAttribute("editSong",false);
                return new ModelAndView("editSong", model);

            }

    }
}
