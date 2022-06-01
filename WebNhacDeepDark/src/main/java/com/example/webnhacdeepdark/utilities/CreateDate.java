package com.example.webnhacdeepdark.utilities;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
@Component
public class CreateDate {

    public ArrayList<Integer> createDays(){
        ArrayList<Integer> list = new ArrayList<>() ;
        for (int  i= 1 ; i<32 ; i++){
            list.add(i);
        }
        return list ;
    }
    public ArrayList<Integer> createMonths(){
        ArrayList<Integer> list = new ArrayList<>();
        for (int i=1 ; i<13 ; i++){
            list.add(i);
        }
        return  list;

    }
    public ArrayList<Integer> createYears(){
        ArrayList<Integer> list = new ArrayList<>();
        for (int i=1980 ; i<2030; i++){
            list.add(i);
        }
        return  list ;
    }
}
