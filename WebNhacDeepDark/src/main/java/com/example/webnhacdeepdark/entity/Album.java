package com.example.webnhacdeepdark.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
//@Table(name = "album")
public class Album implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id_album")
    private int id;
    private String name;
    //@Column(name = "date_released")
    private Date dateReleased;
   @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "author_id", referencedColumnName = "id")
    private Author author;

    @JsonIgnore
    @OneToMany(mappedBy = "album")
    private List<Song> songList = new ArrayList<>();

    public Album(String name, Date dateReleased) {
        this.name = name;
        this.dateReleased = dateReleased;
    }

    public Album(){}

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

    public Date getDateReleased() {
        return dateReleased;
    }

    public void setDateReleased(Date dateReleased) {
        this.dateReleased = dateReleased;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public void addAuthor(Author author) {
        this.author = author;
    }

    public List<Song> getSongList() {
        return songList;
    }

    public void setSongList(List<Song> songList) {
        this.songList = songList;
    }

    public  void deleteAuthor(){
        getAuthor() ;
        this.setAuthor(null);
    }
}
