package com.example.webnhacdeepdark.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
//@Table(name = "contact")
public class Contact {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id_contact")
    private int id;
    private String content;
    //@Column(name = "date_send")
    private Date dateSend;

    public Contact(String content, Date dateSend) {
        this.content = content;
        this.dateSend = dateSend;
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
}
