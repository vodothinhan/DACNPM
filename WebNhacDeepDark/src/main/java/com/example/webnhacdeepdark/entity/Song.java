package com.example.webnhacdeepdark.entity;

import javax.persistence.*;
import java.util.Date;


@Entity
//@Table(name = "song")
public class Song {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id_song")
    private int id;
    private String name;
    private String type;
    //@Column(name = "link_image")
    private String linkImage;
    //@Column(name = "link_mp3")
    private String linkMP3;
    private String status;
    //@Column(name = "date_add")
    private Date dateAdd;
    //@Column(name = "num_listen")
    private int numListen;

    public Song(String name, String type, String linkImage, String linkMP3,
                String status, Date dateAdd, int numListen) {
        this.name = name;
        this.type = type;
        this.linkImage = linkImage;
        this.linkMP3 = linkMP3;
        this.status = status;
        this.dateAdd = dateAdd;
        this.numListen = numListen;
    }

    public Song(){

    }

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLinkImage() {
        return linkImage;
    }

    public void setLinkImage(String linkImage) {
        this.linkImage = linkImage;
    }

    public String getLinkMP3() {
        return linkMP3;
    }

    public void setLinkMP3(String linkMP3) {
        this.linkMP3 = linkMP3;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(Date dateAdd) {
        this.dateAdd = dateAdd;
    }

    public int getNumListen() {
        return numListen;
    }

    public void setNumListen(int numListen) {
        this.numListen = numListen;
    }
}
