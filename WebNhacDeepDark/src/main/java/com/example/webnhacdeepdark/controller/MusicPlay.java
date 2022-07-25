package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.entity.PlayList;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.repositories.SongRepositories;
import com.example.webnhacdeepdark.service.AlbumService;
import com.example.webnhacdeepdark.service.PlaylistService;
import com.example.webnhacdeepdark.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MusicPlay {
    @Autowired
    SongService songService;
    @Autowired
    PlaylistService playlistService;
    @Autowired
    AlbumService albumService;


    @RequestMapping(path = "/play/{id}")
    public ModelAndView toMusicPlayPage(@PathVariable int id ){
        ModelAndView mav = new ModelAndView("music_play");
        List<Song> listCurrent = new ArrayList<>();
        List<Song> listSameAuthor = new ArrayList<>();
        Song song = songService.getSongByID(id);
        listCurrent.add(song);
        mav.addObject("playlist", listCurrent);
        songService.updateNumListen(id);
        listSameAuthor = songService.find5ByType(listCurrent.get(0).getType());
        mav.addObject("authorlist", listSameAuthor);
        return mav;
    }

    @RequestMapping(path = "/play/list/{id}")
    public ModelAndView toMusicPlayList(@PathVariable int id ){
        System.out.println(playlistService.findPlaylistById(1).getId());
        ModelAndView mav = new ModelAndView("music_play");
        List<Song> listCurrent = playlistService.findPlaylistById(id).getListSongs();
        System.out.println(listCurrent.size());
        List<Song> listSameAuthor = new ArrayList<>();
        mav.addObject("playlist", listCurrent);
//        listSameAuthor = listCurrent.get(0).getAlbum().getSongList();
        listSameAuthor = songService.find5ByType(listCurrent.get(0).getType());
        mav.addObject("authorlist", listSameAuthor);
        return mav;
    }

    @RequestMapping(path = "/play/album/{id}")
    public ModelAndView toAlbumPlayList(@PathVariable int id ){
        System.out.println(albumService.getAlbumByID(id).getSongList());
        ModelAndView mav = new ModelAndView("music_play");
        List<Song> listCurrent = albumService.getAlbumByID(id).getSongList();
        System.out.println(listCurrent.size());
        List<Song> listSameAuthor = new ArrayList<>();
        mav.addObject("playlist", listCurrent);
//        listSameAuthor = listCurrent.get(0).getAlbum().getSongList();
        listSameAuthor = songService.find5ByType(listCurrent.get(0).getType());
        mav.addObject("authorlist", listSameAuthor);
        return mav;
    }

}
