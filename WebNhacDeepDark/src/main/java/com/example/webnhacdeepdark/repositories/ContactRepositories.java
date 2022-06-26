package com.example.webnhacdeepdark.repositories;

import com.example.webnhacdeepdark.entity.Contact;
import com.example.webnhacdeepdark.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContactRepositories extends JpaRepository<Contact, Integer> {
    public Contact findByUsersId(int userId);

}
