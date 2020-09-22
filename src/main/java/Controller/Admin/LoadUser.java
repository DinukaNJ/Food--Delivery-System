/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin;

import DB.Conn;
import Model.items;
import Model.users.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kcrdi
 */
public class LoadUser extends HttpServlet {
Connection conn=Conn.getConnection();
PrintWriter out;
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        out=response.getWriter();
        
          loadingUser(request);        
        
        
        
       request.getRequestDispatcher("Admin/viewuser.jsp").forward(request, response);

      
    }

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      doGet(request,response);
       }
    
    
    private void loadingUser(HttpServletRequest request) {
        
         List<user> userList = new ArrayList<>();

     try{
            String query1="SELECT * FROM `users` WHERE `role`='client'"; 
            //out.print(query1);
            
            Statement st = conn.createStatement();          
            ResultSet rs = st.executeQuery(query1);
                while(rs.next()){
                 user u= new user();
                 u.setUid(rs.getString("uid"));
                 u.setUname(rs.getString("uname"));
                 u.setFname(rs.getString("fname"));
                 u.setLname(rs.getString("lname"));
                 u.setPass(rs.getString("pass"));
                 u.setEmail(rs.getString("email"));
                 u.setAddress(rs.getString("address"));
                 u.setRole(rs.getString("role"));
                 u.setStatus(rs.getString("status"));
                 
                  userList.add(u);

               }
                
                  for(user u : userList){
                      out.println( u.getUname()+"\n" );
                       out.println( u.getAddress()+"\n" );
                   
                  }
                //set attributes
               
                
                
              request.setAttribute("userList", userList);
                
                //set naviagtions 
             
     }//
     catch(SQLException ex){
         
         System.err.println(ex.toString());
     }
 
       
    }

 
  
 
    

}
