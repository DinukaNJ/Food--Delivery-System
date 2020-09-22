/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.users;

import DB.Conn;
import Model.cart;
import Model.users.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kcrdi
 */
public class Authentication extends HttpServlet {

Connection conn=Conn.getConnection();
PrintWriter out;
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //when user access this servelt always running only do poast method
        doPost(request,response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        out=response.getWriter();
        String username = request.getParameter("uname");
        String password = request.getParameter("password");
        
        
        Auth(username,password,request,response);
        
 //       String id = "2";
//        HttpSession session = request.getSession();
//        
//       // <!-- 24hours -->
//        session.setMaxInactiveInterval(1440);
//        session.setAttribute("uid", id);
//        request.getRequestDispatcher("/LoadingFoods").forward(request, response);
        //request.getSession().invalidate();
        //For logout with remove and invalidate session.
        
        
        
    }



    private void Auth(String username, String password, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        PrintWriter out =response.getWriter();
        
        
        //List<user> userList= new  ArrayList<>();
        String query="SELECT * FROM `users` WHERE `uname`='"+username+"' AND `pass`='"+password+"';";
        
        try{
        Statement st=conn.createStatement();
       ResultSet rs = st.executeQuery(query);
        while(rs.next()){
            
            HttpSession session = request.getSession();
            
            if(rs.getString("status").equals("active")){
                        if(rs.getString("role").equals("admin")){
                            
                            
                            String id = rs.getString("uid");
                            String uname = rs.getString("uname");
                             session.setMaxInactiveInterval(1440);
                               session.setAttribute("uid", id);
                                session.setAttribute("uname", uname);
                                
                             out.print("Login Scucess !");

                            request.getRequestDispatcher("Admin").forward(request, response);
                            
                            
                        }else{
                            String id = rs.getString("uid");
                            String uname = rs.getString("uname");
                             
                          
                       
                                 // <!-- 24hours -->
                                session.setMaxInactiveInterval(1440);
                                session.setAttribute("uid", id);
                                session.setAttribute("uname", uname);
                                session.setAttribute("status", "active");
                                
                                
                                //try to pass java class object but it gives some error----problems is in the null chceacking
                              //  session.setAttribute("userobj", us);
                      
                         request.getRequestDispatcher("/LoadingFoods").forward(request, response);
                        }                       
            }     
        
        }
        
        
                    
                     	out.println("<script src='js/sweetalert2.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'incorrect User Name or password !' ,  ' ' ,  'error' );");
			out.println("});");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.include(request, response);
//                
                
        }
        catch(SQLException ex){
            System.out.println(ex.toString());
        }
        
        
    }

    

   

}
