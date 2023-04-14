/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import java.sql.*;
import Util.*;
import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.util.*;
import model.*;

/**
 *
 * @author לידור
 */
public class TaskDB {

    private Connection connection;

    public TaskDB() {
        connection = DBUtil.getConnection();
    }

    public void addTask(Task t) {
        try {
            PreparedStatement pStatement;
            pStatement = connection.prepareStatement("insert into tasks values (?,?,?,?,?,?,?)");
            pStatement.setString(1, t.getListName());
            pStatement.setString(2, t.getTaskDesctiption());
            pStatement.setString(3, t.getTaskPriority());
            pStatement.setDate(4, t.getFinishedDate());
            pStatement.setString(5, t.getTaskName());
            pStatement.setString(6, t.getUserMail());
            pStatement.setBoolean(7, t.getFlag());

            pStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Task getTask(String listName, String taskname, User u) {
        Task tl = new Task();
        try {
            PreparedStatement pStatement;
            pStatement = connection.prepareStatement("select * from tasks where USEREMAIL=? AND LISTNAME=? AND TASKNAME=?");
            pStatement.setString(1, u.getEmail());
            pStatement.setString(2, listName);
            pStatement.setString(3, taskname);

            ResultSet rs = pStatement.executeQuery();// tbl res

            if (rs.next()) {
                tl.setListName(rs.getString("Listname"));
                tl.setTaskDesctiption(rs.getString("TASKDESCRIPTION"));
                tl.setTaskPriority(rs.getString("TASKPRIORITY"));
                tl.setFinishedDate(rs.getDate("FINISHEDDATE"));
                tl.setTaskName(rs.getString("TASKNAME"));
                tl.setUserMail(rs.getString("USEREMAIL"));
                tl.setFlag(rs.getBoolean("FLAG"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return tl;
    }

    public LinkedList<Task> getAllTask(String listName, User u) {
        LinkedList<Task> tlist = new LinkedList<Task>();

        try {
            PreparedStatement pStatement;
            pStatement = connection.prepareStatement("select * from tasks where USEREMAIL=? AND LISTNAME=?");
            pStatement.setString(1, u.getEmail());
            pStatement.setString(2, listName);
            ResultSet rs = pStatement.executeQuery();// tbl res

            while (rs.next()) {
                Task tl = new Task();
                tl.setListName(rs.getString("Listname"));
                tl.setTaskDesctiption(rs.getString("TASKDESCRIPTION"));
                tl.setTaskPriority(rs.getString("TASKPRIORITY"));
                tl.setFinishedDate(rs.getDate("FINISHEDDATE"));
                tl.setTaskName(rs.getString("TASKNAME"));
                tl.setUserMail(rs.getString("USEREMAIL"));
                tl.setFlag(rs.getBoolean("FLAG"));
                tlist.add(tl);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        if (!tlist.isEmpty()) {
            Collections.sort(tlist, (t1, t2) -> Integer.parseInt(t1.getTaskPriority()) - Integer.parseInt(t2.getTaskPriority()));
        }

        return tlist;
    }

    public void DeleteTask(String listName, String taskname, User u) {
        try {
            PreparedStatement pStatement;
            pStatement = connection.prepareStatement("DELETE FROM TASKS WHERE LISTNAME=? AND USEREMAIL=? AND taskname=?");
            pStatement.setString(1, listName);
            pStatement.setString(2, u.getEmail());
            pStatement.setString(3, taskname);

            pStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void UpdateSingleTaskDoneToTrue(TaskList tl, String taskname) {
        try {
            PreparedStatement s = connection.prepareStatement("update Tasks set flag = true where USEREMAIL=? AND LISTNAME=? AND TASKNAME=?");
            s.setString(1, tl.getEmail());
            s.setString(2, tl.getListName());
            s.setString(3, taskname);
            s.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
