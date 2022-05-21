package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.repositories.ContactRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContactService {
    @Autowired
    ContactRepositories contactRepositories;
}
