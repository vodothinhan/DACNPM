package com.example.webnhacdeepdark.controller;

import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.service.AuthorService;
import com.example.webnhacdeepdark.service.SongService;
import com.example.webnhacdeepdark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@RestController
public class RestAPI {
    @Autowired
    UserService userService;

    @Autowired
    SongService songService;

    @Autowired
    AuthorService authorService;

    @GetMapping(path = "/getUser")
    public Users getUserByIDAPI(@RequestParam(value = "id", defaultValue = "69") int id){
        return userService.findById(id);
    }

    @PostMapping("/insertUser")
    public String insertUser(@RequestBody Users user){
        userService.saveUser(user);
        return "ok btch";
    }

    @DeleteMapping("/deleteUser/{id}")
        public String deleteUser(@PathVariable int id){
            userService.deleteUser(id);
            return "ok boiz";
        }

    @PutMapping("/song/{songId}/author/{authorId}")
    @Transactional
    public Song assignAuthorToSong( @PathVariable int songId,@PathVariable int authorId){
        Song song = songService.findById(songId);
        Author author = authorService.getAuthorByID(authorId);
        song.setAuthor(author);
        return songService.saveSong(song);
    }


}


