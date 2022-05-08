package entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "customer")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id" , nullable = false)
    private int id ;
    @Column(name = "email",nullable = false)
    private String email ;
    @Column(name = "pass" ,nullable = false)
    private String pass ;
    @Column(name = "role" ,nullable = false)
    private String role ;
    @Column(name = "status",nullable = false)
    private boolean status ;
    @Column(name = "dateofbirth",nullable = false)
    private  String  date ;
    @Column(name = "gender",nullable = false)
    private String gender ;
    @Column(name = "codereset",nullable = true)
    private  String code ;
    @Column(name="time",nullable = true)
    private Date time ;
    public Customer(){}

    public Customer( String email, String pass, String role, boolean status, String date, String gender) {
        this.email = email;
        this.pass = pass;
        this.role = role;
        this.status = status;
        this.date = date;
        this.gender = gender;
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

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
