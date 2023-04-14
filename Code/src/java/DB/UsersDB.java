/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import java.sql.*;
import Util.*;
import model.*;

/**
 *
 * @author לידור
 */
public class UsersDB {

    private Connection connection;

    public UsersDB() {
        connection = DBUtil.getConnection();
    }

    public void addUser(User user) {
        try {


            PreparedStatement pStatement;
            pStatement = connection.prepareStatement("insert into users values (?,?,?,?,?,?,?)");
            pStatement.setString(1, user.getFname());
            pStatement.setString(2, user.getLname());
            pStatement.setString(3, user.getEmail());
            pStatement.setString(4, user.getPassword());
            pStatement.setDate(5, user.getBDate());
            pStatement.setInt(6, user.getAge());
            pStatement.setString(7, user.getGender());

            pStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User getUser(String mail) {
        User u = null;

        try {

            PreparedStatement pStatement;
            pStatement = connection.prepareStatement("select * from users where Email=?");
            pStatement.setString(1, mail);

            ResultSet rs = pStatement.executeQuery();// tbl res
              

            if (rs.next()) {
                u = new User();
                u.setFname(rs.getString("Fname"));
                u.setLname(rs.getString("Lname"));
                u.setEmail(rs.getString("Email"));
                u.setPassword(rs.getString("Password"));
                u.setBDate(rs.getDate("BDATE"));
                u.setAge(rs.getInt("Age"));
                u.setGender(rs.getString("Gender"));

            } else {
                return null;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;

    }

}
