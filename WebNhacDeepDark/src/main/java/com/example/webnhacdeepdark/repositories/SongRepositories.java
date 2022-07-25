package com.example.webnhacdeepdark.repositories;

import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.entity.Song;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SongRepositories extends JpaRepository<Song, Integer> {
    public List<Song> findSongByType(String type);

    public List<Song> findTop10ByOrderByNumListenDesc();

    public List<Song> findTop4ByOrderByDateAddAsc();

    public List<Song> findSongBySingerId(int idSinger);

    List<Song> findByAuthor(Author author);
    List<Song> findByNameContainingIgnoreCase(String nameSong);

    List<Song> findTop5ByTypeOrderByDateAdd(String type);
}
