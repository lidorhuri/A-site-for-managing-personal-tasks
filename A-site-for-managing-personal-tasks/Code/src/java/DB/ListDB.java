/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import Util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;
import model.*;

/**
 *
 * @author לידור
 */
public class ListDB {

    private Connection connection;

    public ListDB() {
        connection = DBUtil.getConnection();
    }

    public void addList(TaskList tl) {
        try {
            PreparedStatement pStatement;
            pStatement = connection.prepareStatement("insert into tasktouser values (?,?)");
            pStatement.setString(1, tl.getListName());
            pStatement.setString(2, tl.getEmail());

            pStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean getList(TaskList tl) {
        try {
            PreparedStatement pStatement;
            pStatement = connection.prepareStatement("select * from tasktouser where LISTNAME=? AND EMAIL=?");
            pStatement.setString(1, tl.getListName());
            pStatement.setString(2, tl.getEmail());

            ResultSet rs = pStatement.executeQuery();// tbl res
            if (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }
    
     public LinkedList<String> getAllLists(User u ) {
       LinkedList <String> ls = new LinkedList<>();
         try {
            PreparedStatement pStatement;
            pStatement = connection.prepareStatement("select * from tasktouser where EMAIL=?");
            pStatement.setString(1, u.getEmail());

            ResultSet rs = pStatement.executeQuery();// tbl res
            while (rs.next()) {
                ls.add(rs.getString("ListName"));
               
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ls;

    }
     
         public boolean DeleteList(String listname, User u) {
        try {
            PreparedStatement pStatement;
            pStatement = connection.prepareStatement("DELETE FROM TASKS WHERE LISTNAME=? AND USEREMAIL=?");
            pStatement.setString(1, listname);
            pStatement.setString(2, u.getEmail());
            pStatement.executeUpdate();
            
            pStatement = connection.prepareStatement("DELETE FROM TASKTOUSER WHERE LISTNAME=? AND EMAIL=?");
            pStatement.setString(1, listname);
            pStatement.setString(2, u.getEmail());
            pStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

}
