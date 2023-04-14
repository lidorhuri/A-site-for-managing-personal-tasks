/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;

/**
 *
 * @author לידור
 */
public class TaskList implements Serializable{

    private String ListName;
    private String Email;

    public TaskList(String ListName, String Email) {
        this.ListName = ListName;
        this.Email = Email;
    }

    public TaskList() {

    }

    public String getListName() {
        return ListName;
    }

    public String getEmail() {
        return Email;
    }

    public void setListName(String ListName) {
        this.ListName = ListName;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
    
    

}
