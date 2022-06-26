package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Contact;
import com.example.webnhacdeepdark.entity.PlayList;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.repositories.PlaylistRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
