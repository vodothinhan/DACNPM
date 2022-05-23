package com.example.webnhacdeepdark.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
//@Table(name = "author")
public class Author {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id_author")
    private int id;
    private String name;

    @JsonIgnore
    @OneToMany(mappedBy = "author")
    private List<Album> albumList = new ArrayList<>();

    public Author(String name) {
        this.name = name;
    }

    public Author(){}

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

    public List<Album> getAlbumList() {
        return albumList;
    }
}
