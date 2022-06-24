package com.example.webnhacdeepdark.model;

import org.springframework.web.multipart.MultipartFile;

public class FormAddMusic {
    private String nameSong ;
    private String  typeSong ;
    private String  idSinger ;
    private String nameSinger ;
    private String idAuthor ;
    private String nameAuthor;
    private String idAlbum;
    private String nameNewAlbum;
    private String idAuthorOfNewAlbum;
    private String nameAuthorNewAlbm;
    private MultipartFile fileThumbnail;
    private MultipartFile fileMusic;


    @Override
    public String toString() {
        return "FormAddMusic{" +
                "nameSong='" + nameSong + '\'' +
                ", typeSong='" + typeSong + '\'' +
                ", idSinger=" + idSinger +
                ", nameSinger='" + nameSinger + '\'' +
                ", idAuthor=" + idAuthor +
                ", nameAuthor='" + nameAuthor + '\'' +
                ", idAlbum=" + idAlbum +
                ", nameNewAlbum='" + nameNewAlbum + '\'' +
                ", idAuthorOfNewAlbum=" + idAuthorOfNewAlbum +
                ", nameAuthorNewAlbm='" + nameAuthorNewAlbm + '\'' +
                ", fileThumbnail=" + fileThumbnail.getOriginalFilename() +
                ", fileMusic=" + fileMusic.getOriginalFilename() +
                '}';
    }

    public String getNameSong() {
        return nameSong;
    }

    public void setNameSong(String nameSong) {
        this.nameSong = nameSong;
    }

    public String getTypeSong() {
        return typeSong;
    }

    public void setTypeSong(String typeSong) {
        this.typeSong = typeSong;
    }

    public String getIdSinger() {
        return idSinger;
    }

    public void setIdSinger(String idSinger) {
        this.idSinger = idSinger;
    }

    public String getNameSinger() {
        return nameSinger;
    }

    public void setNameSinger(String nameSinger) {
        this.nameSinger = nameSinger;
    }

    public String getIdAuthor() {
        return idAuthor;
    }

    public void setIdAuthor(String idAuthor) {
        this.idAuthor = idAuthor;
    }

    public String getNameAuthor() {
        return nameAuthor;
    }

    public void setNameAuthor(String nameAuthor) {
        this.nameAuthor = nameAuthor;
    }

    public String getIdAlbum() {
        return idAlbum;
    }

    public void setIdAlbum(String idAlbum) {
        this.idAlbum = idAlbum;
    }

    public String getNameNewAlbum() {
        return nameNewAlbum;
    }

    public void setNameNewAlbum(String nameNewAlbum) {
        this.nameNewAlbum = nameNewAlbum;
    }

    public String getIdAuthorOfNewAlbum() {
        return idAuthorOfNewAlbum;
    }

    public void setIdAuthorOfNewAlbum(String idAuthorOfNewAlbum) {
        this.idAuthorOfNewAlbum = idAuthorOfNewAlbum;
    }

    public String getNameAuthorNewAlbm() {
        return nameAuthorNewAlbm;
    }

    public void setNameAuthorNewAlbm(String nameAuthorNewAlbm) {
        this.nameAuthorNewAlbm = nameAuthorNewAlbm;
    }

    public MultipartFile getFileThumbnail() {
        return fileThumbnail;
    }

    public void setFileThumbnail(MultipartFile fileThumbnail) {
        this.fileThumbnail = fileThumbnail;
    }

    public MultipartFile getFileMusic() {
        return fileMusic;
    }

    public void setFileMusic(MultipartFile fileMusic) {
        this.fileMusic = fileMusic;
    }
}
