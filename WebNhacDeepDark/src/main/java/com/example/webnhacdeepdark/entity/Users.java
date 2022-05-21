package com.example.webnhacdeepdark.entity;

import org.hibernate.annotations.Generated;

import javax.persistence.*;
import java.security.Timestamp;
import java.util.Date;

@Entity
//@Table(name = "users")
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id_user", nullable = false)
    private int id;
    private String email;
    private String password;
    private String role;
    private String status;
    //@Column(name = "date_of_birth")
    private Date dateOfBirth;
    private String gender;
    //@Column(name = "code_recovery")
    private String codeRecovery;
    //@Column(name = "time_recovery")
    private Timestamp timeRecovery;

    public Users(String email, String password, String role, String status,
                Date dateOfBirth, String gender, String codeRecovery, Timestamp timeRecovery) {
        this.email = email;
        this.password = password;
        this.role = role;
        this.status = status;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.codeRecovery = codeRecovery;
        this.timeRecovery = timeRecovery;
    }

    public Users() {

    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", role='" + role + '\'' +
                ", status='" + status + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", gender='" + gender + '\'' +
                ", codeRecovery='" + codeRecovery + '\'' +
                ", timeRecovery=" + timeRecovery +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCodeRecovery() {
        return codeRecovery;
    }

    public void setCodeRecovery(String codeRecovery) {
        this.codeRecovery = codeRecovery;
    }

    public Timestamp getTimeRecovery() {
        return timeRecovery;
    }

    public void setTimeRecovery(Timestamp timeRecovery) {
        this.timeRecovery = timeRecovery;
    }
}
