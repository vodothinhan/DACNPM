package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.entity.Contact;
import com.example.webnhacdeepdark.repositories.ContactRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ContactService {
    @Autowired
    ContactRepositories contactRepositories;

    public void save(Contact contact) {contactRepositories.save(contact);};

    public void delete(Contact contact) {contactRepositories.delete(contact);};

    public Contact findByUsersId(int userId) {
        return contactRepositories.findByUsersId(userId);
    }
    public List<Contact> findAllContact(){
        return contactRepositories.findAll() ;
    }
    @Transactional
    public void deleteContact(int idContact){
        Contact contact = contactRepositories.findById(idContact).get() ;
        contact.deleteUser();
        contactRepositories.delete(contact);
    }
    public Contact findContactById(String strIdContact){
        return contactRepositories.findById(Integer.parseInt(strIdContact)).get() ;
    }
}
