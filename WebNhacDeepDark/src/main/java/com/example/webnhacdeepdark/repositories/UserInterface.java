package com.example.webnhacdeepdark.repositories;

import com.example.webnhacdeepdark.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserInterface extends JpaRepository<User, Integer> {
    User findById(int id);
}
