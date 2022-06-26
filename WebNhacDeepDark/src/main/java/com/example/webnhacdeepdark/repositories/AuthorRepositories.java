package com.example.webnhacdeepdark.repositories;

import com.example.webnhacdeepdark.entity.Author;
import com.example.webnhacdeepdark.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AuthorRepositories extends JpaRepository<Author, Integer> {
    List<Author> findByNameContaining(String name);
    List<Author> findByNameContainingIgnoreCase(String name) ;

    public void deleteAuthorById(int id);
}
