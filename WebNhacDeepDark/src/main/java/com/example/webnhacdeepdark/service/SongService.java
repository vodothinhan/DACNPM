package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.*;
import com.example.webnhacdeepdark.repositories.SongRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class SongService {
    @Autowired
    SongRepositories songRepositories;

    @Autowired
    PlaylistService playlistService;

    @Autowired
    UserService userService;

    public Song getSongByID(int id) {
        return songRepositories.findById(id).get();
    }

    public List<Song> findAll() {
        return songRepositories.findAll();
    }

    public void updateNumListen(int id){
        Song song = getSongByID(id);
        song.setNumListen((song.getNumListen()) + 1);
        saveSong(song);
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

    public List<Song> findByAlbum(Album album, ArrayList<Song> listByNameAuthor) {
        List<Song> list = findAll();
        System.out.println("listAll = " + list);
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getAuthor().getId() == album.getId()) {
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


    public Song saveSong(Song song) {
        return songRepositories.save(song);
    }

    public List<Song> findByAuthor(Author author) {
        List<Song> listByNameAuthor = new ArrayList<>();
        List<Song> list = findAll();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getAuthor().getId() == author.getId()) {
                listByNameAuthor.add(list.get(i));
                System.out.println("Song = " + list.get(i));
                System.out.println("CC = " + listByNameAuthor);
            } else {
                System.out.println("Không có song này");
            }
        }
        System.out.println("listByNameAuthor = " + listByNameAuthor);
        return listByNameAuthor;
    }

    public List<Song> findByNameContainingIgnoreCase(String nameSong) {
        return songRepositories.findByNameContainingIgnoreCase(nameSong);
    }

//    public List<Song> findBySinger(Singer singer) {
//        List<Song> listByNameSinger = new ArrayList<>();
//        List<Song> list = findAll();
//        for (int i = 0; i < list.size(); i++) {
//            if (list.get(i).getSinger().getId() == singer.getId()) {
//                listByNameSinger.add(list.get(i));
//            }
//        }
//        return listByNameSinger;
//    }
    @Transactional
    public Song saveSongOfFormMusic(Song song){
       return songRepositories.save(song) ;
    }
    public List<Song> getAllSong(){
        return  songRepositories.findAll() ;
    }

    public void deleteSong(int id){
        songRepositories.deleteById(id);
    }
    public Song  findSongById(int id) {
        Song song = null ;
        if(songRepositories.findById(id).isPresent()) song = songRepositories.findById(id).get() ;
        else throw new RuntimeException("not found song") ;
        return song ;
    }
    public void updateSong(Song song){
       song.setSinger(null);
       song.setAlbum(null);
       song.setAuthor(null);
       song.setPlayList(null);
       songRepositories.save(song) ;
    }

    public void setPlaylistNull(Song song){
        song.setPlayList(null);
        songRepositories.save(song);
    }

    @Transactional
    public boolean updateManySong(ArrayList<Integer> listIdSong){
        try{
            for (Integer id : listIdSong){
                updateSong(findSongById(id));
            }
            return  true ;
        } catch (Exception e){
            return  false ;
        }
    }

    @Transactional
    public boolean deleteManySong(ArrayList<Integer> listIdSong){
        try{
           if(updateManySong(listIdSong)){
              for (Integer id : listIdSong){
                  deleteSong(id);
              }
           }
            return true ;
        }catch (Exception e){
            return  false ;
        }
    }
    @Transactional
    public Song updateStatusSong(int idSong){
        Song song = findSongById(idSong) ;
        if(song==null) throw  new RuntimeException("not found song") ;
        String status = song.getStatus() ;
       if(status!=null){
           if(status.equals("ACTIVE")) song.setStatus("BLOCK");
           else song.setStatus("ACTIVE");
       }
       else song.setStatus("ACTIVE");

        return songRepositories.save(song) ;

    }
    @Transactional
    public void deleteAlbum(int id){
        Song song = findSongById(id) ;
        song.setAlbum(null);
    }

    @Transactional
    public boolean updatePlaylist(int idSong,int idUser){
        try {
            Song song = findSongById(idSong);
            if(song==null) throw  new RuntimeException("not found song") ;
            Users users = userService.findUserById(idUser);
            PlayList playList = playlistService.findPlaylistByUser(users);
            song.setPlayList(playList);
            playlistService.addSongToPlaylist(song,playList);
            return true;
        }catch (Exception e){
            return false;
        }


    }
    @Transactional
    public void updateAlbum(Song songfromForm){
        Song song = songRepositories.findById(songfromForm.getId()).get();
        song.setName(songfromForm.getName());
        song.updateAlbum(songfromForm.getAlbum());
        song.updateAuthor(songfromForm.getAuthor());
        song.updateSinger(songfromForm.getSinger());
        song.setType(songfromForm.getType());
    }

    public List<Song> find5ByType(String type){
        return songRepositories.findTop5ByTypeOrderByDateAdd(type);
    }
}
