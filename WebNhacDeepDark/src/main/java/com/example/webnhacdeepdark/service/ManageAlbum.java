package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.entity.Song;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class ManageAlbum {
    @Autowired
    SongService songService;
    @Autowired
    AlbumService albumService;
    public void deleteAlbums(ArrayList<Integer> listIdAlbum) {
        for (Integer id : listIdAlbum) {
        Album album = albumService.findAlbumById(id).get();
            List<Song> listSong = album.getSongList();
            for (Song song : listSong) {
                songService.deleteAlbum(song.getId());
            }
            albumService.deleteAuthor(album);
            albumService.deleteAlbum(album);

        }

    }
}
