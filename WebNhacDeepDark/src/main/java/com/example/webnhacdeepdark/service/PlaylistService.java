package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Contact;
import com.example.webnhacdeepdark.entity.PlayList;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.repositories.PlaylistRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PlaylistService {
    @Autowired
    SongService songService;

    @Autowired
    PlaylistRepositories playlistRepositories;

    public void deletePlaylist(PlayList playList){
        playList.setUsers(null);
        for (Song song : playList.getListSongs()){
            songService.setPlaylistNull(song);
        }
        playlistRepositories.delete(playList);
    }
    @Transactional
    public void savePlayList(Users users){
        PlayList playList = new PlayList();
        playList.setUsers(users);
        playlistRepositories.save(playList) ;
    }


    public PlayList findPlaylistById(int id){
        return playlistRepositories.findById(id);
    }

    @Transactional
    public void addSongToPlaylist(Song song, PlayList playList){
        playList.getListSongs().add(song);
    }

    @Transactional
    public  PlayList findPlaylistByUser(Users users){
        return playlistRepositories.findPlayListByUsers(users);
    }

}
