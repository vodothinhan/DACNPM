package com.example.webnhacdeepdark.model;

import org.springframework.web.multipart.MultipartFile;

public class FormAddMusic {
    private String nameSong ;
    private String idSong ;
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
    private String day ;
    private String month;
    private String year;
    private String nameAlbum ;

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
    public void setIdSong(String idSong){
        this.idSong = idSong;
    }
    public String getIdSong(){
        return idSong ;
    }
    public void setDay(String day){
        this.day = day ;
    }
    public String getDay(){
        return day ;
    }
    public void setMonth(String month){
        this.month = month ;
    }
    public String getMonth(){
        return month ;
    }
    public void setYear(String year){
        this.year = year ;
    }
    public String getYear(){
        return year ;
    }
    public void setNameAlbum(String nameAlbum){
        this.nameAlbum = nameAlbum ;
    }
    public String getNameAlbum(){
        return nameAlbum ;
    }

    @Override
    public String toString() {
        return "FormAddMusic{" +
                "nameSong='" + nameSong + '\'' +
                ", idSong='" + idSong + '\'' +
                ", typeSong='" + typeSong + '\'' +
                ", idSinger='" + idSinger + '\'' +
                ", nameSinger='" + nameSinger + '\'' +
                ", idAuthor='" + idAuthor + '\'' +
                ", nameAuthor='" + nameAuthor + '\'' +
                ", idAlbum='" + idAlbum + '\'' +
                ", nameNewAlbum='" + nameNewAlbum + '\'' +
                ", idAuthorOfNewAlbum='" + idAuthorOfNewAlbum + '\'' +
                ", nameAuthorNewAlbm='" + nameAuthorNewAlbm + '\'' +
                ", fileThumbnail=" + fileThumbnail +
                ", fileMusic=" + fileMusic +
                ", day='" + day + '\'' +
                ", month='" + month + '\'' +
                ", year='" + year + '\'' +
                ", nameAlbum='" + nameAlbum + '\'' +
                '}';
    }
}
