package com.example.webnhacdeepdark.repositories;

import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorRepositories extends JpaRepository<Author, Integer> {
}
