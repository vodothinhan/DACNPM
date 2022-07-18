package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.entity.PlayList;
import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.repositories.SingerRepositories;
import com.example.webnhacdeepdark.service.SingerService;
import com.example.webnhacdeepdark.service.SongService;
import com.example.webnhacdeepdark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class User {
    @Autowired
    UserService userService;
    @Autowired
    SongService songService;
    //    @Autowired
//    SingerService singerService;
    @RequestMapping(path = "/user", method = RequestMethod.GET)
    public ModelAndView user(HttpSession httpSession){
        ModelAndView mav = new ModelAndView("user");
        Users s = (Users) httpSession.getAttribute("user");


//        Song ss =songService.findById(11);
//        Singer sss =ss.getSinger();
//        List<PlayList> list =s.getPlayLists();

//        List<Song> list1 =list.get(0).getListSongs();

//        mav.addObject("list1",list1);




        mav.addObject("list",userService.findByEmail(s.getEmail()).getPlayLists());
        mav.addObject("song",new Song());
//        mav.addObject("singer",sss);
        mav.addObject("user",s);
        return mav;
    }

    @RequestMapping(path = "/doiTT", method = RequestMethod.GET)
    public ModelAndView doiTT(@RequestParam("name") String name, @RequestParam("email") String email,
                              @RequestParam("date")String date, @RequestParam("gender") String gender,HttpSession session){
        ModelAndView mav = new ModelAndView("user");
        Users u = (Users) session.getAttribute("user") ;
        Users s = userService.findById(u.getId());
        try{
            Date d = new SimpleDateFormat("yyyy-mm-dd").parse(date);
            s.setDateOfBirth(d);
        }catch (Exception e){
            mav.addObject("error","Ngày sinh không hợp lệ");
            mav.addObject("user",s);
            return mav;
        }

        s.setEmail(email);
        s.setGender(gender);

        userService.saveUser(s);

        mav.addObject("success","Cập nhật thông tin thành công");

        mav.addObject("user",s);



        return mav;
    }


    @RequestMapping(path = "/doiMK", method = RequestMethod.POST)
    public ModelAndView doiMK(@RequestParam("pass1") String pass1, @RequestParam("pass2") String pass2 , HttpSession session){
        ModelAndView mav = new ModelAndView("user");
        Users u = (Users) session.getAttribute("user") ;
        Users s = userService.findById(u.getId());

        if(!pass1.equals(pass2)) {
            mav.addObject("error1","Xác nhận mật khẩu không chính xác");
            mav.addObject("user",s);
            return mav;
        }
        s.setPassword(pass1);
        mav.addObject("success1", "Đổi mật khẩu thành công");
        mav.addObject("user", s);
        userService.saveUser(s);




        return mav;
    }

}

