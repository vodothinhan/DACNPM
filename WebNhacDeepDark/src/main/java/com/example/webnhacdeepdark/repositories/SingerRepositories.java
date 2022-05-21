package com.example.webnhacdeepdark.repositories;

import com.example.webnhacdeepdark.entity.Singer;
import com.example.webnhacdeepdark.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SingerRepositories extends JpaRepository<Singer, Integer> {
}
