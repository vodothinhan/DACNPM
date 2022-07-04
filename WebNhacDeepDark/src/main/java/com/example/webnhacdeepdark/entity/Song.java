package com.example.webnhacdeepdark.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
//@Table(name = "song")
public class Song implements Serializable {
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

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "playlist_id", referencedColumnName = "id")
    private PlayList playList;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "album_id", referencedColumnName = "id")
    private Album album;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "author_id", referencedColumnName = "id")
    private Author author;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "singer_id", referencedColumnName = "id")
    private Singer singer;

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

    public PlayList getPlayList() {
        return playList;
    }

    public void setPlayList(PlayList playList) {
        this.playList = playList;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public Singer getSinger() {
        return singer;
    }

    public void setSinger(Singer singer) {
        this.singer = singer;
    }

    public Integer getIdUserPlaylist() {
        if(getPlayList()==null) return null;
        return getPlayList().getUsers().getId();
    }

    public void deleteAlbum(){
        getAlbum();
        this.setAlbum(null);
    }
    public void updateSinger(Singer singer){
        getSinger() ;
        setSinger(singer);
    }
    public void updateAuthor(Author author){
        getAuthor();
        setAuthor(author);
    }
    public void updateAlbum(Album album){
        getAlbum() ;
        setAlbum(album);
    }




}
