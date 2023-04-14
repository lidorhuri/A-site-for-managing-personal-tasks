/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author לידור
 */
public class User implements Serializable{

    private String fname;
    private String lname;
    private String email;
    private String password;
    private Date BDate;
    private int Age;
    private String Gender;

    public User(String fname, String lname, String email, String password, Date Date, int Age, String Gender) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
        this.BDate = Date;
        this.Age = Age;
        this.Gender = Gender;
    }

    public User() {

    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public Date getBDate() {
        return BDate;
    }

    public int getAge() {
        return Age;
    }

    public String getGender() {
        return Gender;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setBDate(Date Date) {
        this.BDate = BDate;
    }

    public void setAge(int Age) {
        this.Age = Age;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

}
