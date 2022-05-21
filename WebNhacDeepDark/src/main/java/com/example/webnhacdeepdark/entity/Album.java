package com.example.webnhacdeepdark.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
//@Table(name = "album")
public class Album {
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
}
