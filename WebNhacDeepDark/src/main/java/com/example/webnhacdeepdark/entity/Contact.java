package com.example.webnhacdeepdark.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
//@Table(name = "contact")
public class Contact implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id_contact")
    private int id;
    private String content;
    //@Column(name = "date_send")
    private Date dateSend;
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private Users users;

    public Contact(String content, Date dateSend, Users users) {
        this.content = content;
        this.dateSend = dateSend;
        this.users = users;
    }

    public Contact(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDateSend() {
        return dateSend;
    }

    public void setDateSend(Date dateSend) {
        this.dateSend = dateSend;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
    public void deleteUser(){
        getUsers();
        setUsers(null);
    }

}
