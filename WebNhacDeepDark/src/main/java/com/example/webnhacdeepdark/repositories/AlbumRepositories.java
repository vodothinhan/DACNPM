package com.example.webnhacdeepdark.repositories;

import com.example.webnhacdeepdark.entity.Album;
import com.example.webnhacdeepdark.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlbumRepositories extends JpaRepository<Album, Integer> {
}
