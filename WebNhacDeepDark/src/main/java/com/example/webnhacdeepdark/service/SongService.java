package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.repositories.SongRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SongService {
    @Autowired
    SongRepositories songRepositories;

    public Song getSongByID(int id) {
        return songRepositories.findById(id).get();
    }

    public Song saveSong(Song album) {
        return songRepositories.save(album);
    }

    public List<Song> findAll() {
        return songRepositories.findAll();
    }

    public List<Song> findByAuthor(Author author, ArrayList<Song> listByNameAuthor) {
        List<Song> list = findAll();
        System.out.println("listAll = " + list);
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getAuthor().getId() == author.getId()) {
                listByNameAuthor.add(list.get(i));
                System.out.println("Song = " + list.get(i));
            } else {
                System.out.println("Không có album này");
            }
        }
        System.out.println("listByNameAuthor = " + listByNameAuthor);
        return listByNameAuthor;
    }

    public Song findById(int id){
        return songRepositories.findById(id).get();
    }

    public List<Song> findSongByType(String type){
        return songRepositories.findSongByType(type);
    }

    public List<Song> findTop10SongByNumListen(){
        return songRepositories.findTop10ByOrderByNumListenDesc();
    }

    public List<Song> find4NewSong(){
        return songRepositories.findTop4ByOrderByDateAddAsc();
    }

    public List<Song> findSongBySinger(int idSinger) {return songRepositories.findSongBySingerId(idSinger);}
}
