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
public class Task implements Serializable {

    private String ListName;
    private String TaskDesctiption;
    private String TaskPriority;
    private Date FinishedDate;
    private String TaskName;
    private String UserMail;
    private boolean Flag;

    public Task(String ListName, String TaskDesctiption, String TaskPriority, Date FinishedDate, String TaskName, String UserMail, boolean Flag) {
        this.ListName = ListName;
        this.TaskDesctiption = TaskDesctiption;
        this.TaskPriority = TaskPriority;
        this.FinishedDate = FinishedDate;
        this.TaskName = TaskName;
        this.UserMail = UserMail;
        this.Flag = Flag;

    }

    public Task() {

    }

    public String getListName() {
        return ListName;
    }

    public String getTaskDesctiption() {
        return TaskDesctiption;
    }

    public String getTaskPriority() {
        return TaskPriority;
    }

    public Date getFinishedDate() {
        return FinishedDate;
    }

    public String getTaskName() {
        return TaskName;
    }

    public String getUserMail() {
        return UserMail;
    }

    public boolean getFlag() {
        return Flag;
    }

    public void setListName(String ListName) {
        this.ListName = ListName;
    }

    public void setTaskDesctiption(String TaskDesctiption) {
        this.TaskDesctiption = TaskDesctiption;
    }

    public void setTaskPriority(String TaskPriority) {
        this.TaskPriority = TaskPriority;
    }

    public void setFinishedDate(Date FinishedDate) {
        this.FinishedDate = FinishedDate;
    }

    public void setTaskName(String TaskName) {
        this.TaskName = TaskName;
    }

    public void setUserMail(String UserMail) {
        this.UserMail = UserMail;
    }

    public void setFlag(boolean Flag) {
        this.Flag = Flag;
    }

}
