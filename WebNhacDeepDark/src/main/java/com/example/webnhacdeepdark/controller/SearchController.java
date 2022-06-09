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
        List<Song> last = new ArrayList<>();
        List<Song> listSearchName = new ArrayList<>();
        List<Singer> singer = singerService.findByNameContainingIgnoreCase(inputSearch);
        List<Song> songs = new ArrayList<>();
        List<Song> listSearchNameSong = songService.findByNameContaining(inputSearch);
        for (int i = 0; i < singer.size(); i++) {
            listSearchName = songService.findBySinger(singer.get(i));
            for (int j = 0; j < listSearchName.size(); j++) {
                last.add(listSearchName.get(j));
                songs.add(listSearchName.get(j));
            }
        }
        for (int k = 0; k < listSearchNameSong.size(); k++) {
            last.add(listSearchNameSong.get(k));
        }

        List<Singer> singer2 = singerService.findByNameContainingIgnoreCase(inputSearch);
        System.out.println("singer2 = " + singer2.size());

        List<Album> album = albumService.findByNameContainingIgnoreCase(inputSearch);
        mav.addObject("album", album);
        mav.addObject("inputSearch", inputSearch);
        mav.addObject("listSearchName", last);
        mav.addObject("listSearchNameSong", listSearchNameSong);
        mav.addObject("listSearchSinger", songs);
        return mav;
    }
}
