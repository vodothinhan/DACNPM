package com.example.webnhacdeepdark.utilities;

import org.springframework.stereotype.Component;

import java.util.ArrayList;

@Component
public class CreateTypeSong {
    public ArrayList<String> createTypeSong(){
        ArrayList<String> listType = new ArrayList<>() ;
        listType.add("V-POP") ;
        listType.add("K-POP");
        listType.add("US-UK");
        return listType ;
    }
}
