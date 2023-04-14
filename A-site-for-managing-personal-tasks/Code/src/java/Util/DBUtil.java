/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;

import java.sql.*;

/**
 *
 * @author לידור
 */
public class DBUtil {

    private static Connection connection = null;

    public static Connection getConnection() {
        if (connection != null) {
            return connection;
        } else {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                String urlCn = "jdbc:derby://localhost:1527/Matala4";
                connection = DriverManager.getConnection(urlCn, "root", "root");
            } catch (Exception e) {
                e.printStackTrace();
            }
            return connection;
        }
    }

}
