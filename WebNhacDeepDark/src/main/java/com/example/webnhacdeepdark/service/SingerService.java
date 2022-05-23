package com.example.webnhacdeepdark.service;

import com.example.webnhacdeepdark.repositories.SingerRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SingerService {
    @Autowired
    SingerRepositories singerRepositories;

}
