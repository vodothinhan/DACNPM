package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.repositories.AuthorRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class AuthorService {
    @Autowired
    AuthorRepositories authorRepositories;

    public Author getAuthorByID(int id){
        return authorRepositories.findById(id).get();
    }

    public Author saveAuthor(Author author){
        return authorRepositories.save(author);
    }

    public List<Author> findByNameContaining(String name) {
        return authorRepositories.findByNameContaining(name);}
    public List<Author> findAll(){
        return authorRepositories.findAll();
    }
    public List<Author> findByNameAuthor(String name){
        return authorRepositories.findByNameContainingIgnoreCase(name);
    }
    public Optional<Author> findAuthorById(String strId){
        int id = Integer.parseInt(strId) ;
        return authorRepositories.findById(id) ;
    }

    public void deleteAuthor(int id){
        authorRepositories.deleteAuthorById(id);
    }
    @Transactional
    public boolean deleteManyAuthor(ArrayList<Integer> listIdAuthor){
        try{
            for (Integer id : listIdAuthor){
                for (Song song : getAuthorByID(id).getSongList()){
                    song.setAuthor(null);
                }
                for (Album album : getAuthorByID(id).getAlbumList()){
                    album.setAuthor(null);
                }
                deleteAuthor(id);
            }
            return true ;
        }catch (Exception e){
            return  false ;
        }
    }

    public Author addAuthor(String nameAuthor){
        return authorRepositories.save(new Author(nameAuthor));
    }

    public Author updateAuthor(Author author) {
        getAuthorByID(author.getId()).setName(author.getName());
        return getAuthorByID(author.getId());
    }
}
