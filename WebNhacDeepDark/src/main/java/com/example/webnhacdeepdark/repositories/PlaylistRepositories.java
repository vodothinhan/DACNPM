package com.example.webnhacdeepdark.repositories;

import com.example.webnhacdeepdark.entity.Contact;
import com.example.webnhacdeepdark.entity.PlayList;
import com.example.webnhacdeepdark.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PlaylistRepositories extends JpaRepository<PlayList, Integer> {

    public PlayList findById(int id);

    public PlayList findPlayListByUsers(Users users);
}
