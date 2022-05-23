package com.example.webnhacdeepdark.entity;

import org.hibernate.annotations.Generated;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {
    @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)

    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "job")
    private String job;

    public User(String name, String job) {
        this.name = name;
        this.job = job;
    }

    public User(){

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

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }
}
