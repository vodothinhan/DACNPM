package com.example.webnhacdeepdark.repositories;

import com.example.webnhacdeepdark.entity.Song;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SongRepositories extends JpaRepository<Song, Integer> {
}
