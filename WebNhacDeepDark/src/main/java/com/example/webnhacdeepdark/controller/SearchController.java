package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.service.AlbumService;
import com.example.webnhacdeepdark.service.SingerService;
import com.example.webnhacdeepdark.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@RestController
public class SearchController {
    @Autowired
    SingerService singerService;
    @Autowired
    SongService songService;
    @Autowired
    AlbumService albumService;

    @RequestMapping(path = "/search/Song")
    public ModelAndView searchSinger(@RequestParam(name = "inputSearch") String inputSearch) {
        ModelAndView mav = new ModelAndView("search");
        String messageAll = "";String messageNameSong = "";String messageNameSinger = "";String messageNameAllbum = "";
        List<Singer> singer = singerService.findByNameContainingIgnoreCase(inputSearch);
        List<Song> listSearchNameSong = songService.findByNameContainingIgnoreCase(inputSearch);

        List<Album> album = albumService.findByNameContainingIgnoreCase(inputSearch);

        ArrayList<Song> all = new ArrayList<>();
        all.addAll(listSearchNameSong);
        for (int i = 0; i < singer.size(); i++) {
            all.addAll(singer.get(i).getSongList());
        }
//        for (int i = 0; i < album.size(); i++) {
//            all.addAll(album.get(i).getSongList());
//        }
        if(singer.size() == 0) {
            messageNameSinger = "Không có ca sĩ nào";
        } else if(all.size() == 0) {
            messageAll = "Không có ca sĩ hay bài hát nào";
        } else if(listSearchNameSong.size() == 0) {
            messageNameSong = "Không có bài hát nào";
        } else if(album.size() == 0) {
            messageNameAllbum = "Không có Allbum nào";
        }
        mav.addObject("messageNameSinger", messageNameSinger);
        mav.addObject("messageAll", messageAll);
        mav.addObject("messageNameSong", messageNameSong);
        mav.addObject("messageNameAllbum", messageNameAllbum);
        mav.addObject("inputSearch", inputSearch);
        mav.addObject("all", all);
        mav.addObject("album", album);
        mav.addObject("singer", singer);
        mav.addObject("listSearchNameSong", listSearchNameSong);
        return mav;
    }
}
