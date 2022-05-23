package com.example.webnhacdeepdark.entity;

import javax.persistence.*;

@Entity
//@Table(name = "singer")
public class Singer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id_singer")
    private int id;
    private String name;

    public Singer(String name) {
        this.name = name;
    }

    public Singer(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
