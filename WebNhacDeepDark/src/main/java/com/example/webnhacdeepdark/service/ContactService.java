package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Contact;
import com.example.webnhacdeepdark.repositories.ContactRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContactService {
    @Autowired
    ContactRepositories contactRepositories;

    public void save(Contact contact) {contactRepositories.save(contact);};

    public void delete(Contact contact) {contactRepositories.delete(contact);};

    public Contact findByUsersId(int userId) {
        return contactRepositories.findByUsersId(userId);
    }
}
