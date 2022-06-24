package com.example.webnhacdeepdark.repositories;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.entity.Song;
import com.example.webnhacdeepdark.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AlbumRepositories extends JpaRepository<Album, Integer> {
    List<Album> findByNameContainingIgnoreCase(String nameSong);

    public List<Album> findByName(String name) ;


}
