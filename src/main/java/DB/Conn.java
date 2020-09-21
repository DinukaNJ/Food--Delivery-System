/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kcrdi
 */
public class Conn {
//Singlton patters for Datbase Connection 
    private  static Connection conn;


      public static Connection getConnection() {
      
      
      if(conn==null){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost/foodsystem?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

            conn = DriverManager.getConnection(url,"root","");
     
            System.out.println("Connection Suceess !");
           
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, null, ex);
        }   
      }
        return conn;
      
      }
}
