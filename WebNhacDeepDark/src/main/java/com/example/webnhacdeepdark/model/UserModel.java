package com.example.webnhacdeepdark.model;

import javax.validation.constraints.NotBlank;
import java.util.Date;

public class UserModel {
    @NotBlank
    private String email;
    @NotBlank
    private String pass;
    @NotBlank
    private String gender;
    @NotBlank
    private String day;
    @NotBlank
    private String month;
    @NotBlank
    private String year;


    public UserModel() {

    }

    public UserModel(String email, String pass, String gender, String day, String month, String year) {
        this.email = email;
        this.pass = pass;
        this.gender = gender;
        this.day = day;
        this.month = month;
        this.year = year;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    @Override
    public String toString() {
        return "UserModel{" +
                "email='" + email + '\'' +
                ", pass='" + pass + '\'' +
                ", gender='" + gender + '\'' +
                ", day='" + day + '\'' +
                ", month='" + month + '\'' +
                ", year='" + year + '\'' +
                '}';
    }
}
