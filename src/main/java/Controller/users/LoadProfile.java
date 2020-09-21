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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kcrdi
 */
@WebServlet(name = "LoadProfile", urlPatterns = {"/LoadProfile"})
public class LoadProfile extends HttpServlet {

    Connection conn=Conn.getConnection();
    PrintWriter out;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        out=response.getWriter();
      
          String uid = (String) (request.getSession().getAttribute("uid") != null ? request.getSession().getAttribute("uid"):"");
          
//          user check
        if(uid.equals("")) {  
          //  response.sendRedirect("Login.jsp");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }

String error = (String) (request.getSession().getAttribute("error") != null ? request.getSession().getAttribute("error"):"");

  if(error.equals("true")){
        request.getSession().removeAttribute("error");
    out.println("<script src='js/sweetalert2.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Ops' ,  ' Something went wrong!' ,  'error' );");
			out.println("});");
			out.println("</script>");
                        loadprofile(uid,request);
			RequestDispatcher rd = request.getRequestDispatcher("LoadProfile");
			rd.include(request, response);
   
  
  }else if(error.equals("false")){
    request.getSession().removeAttribute("error");

  out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Done' ,  'Upadate successfull !' ,  'success' );");
			out.println("});");
			out.println("</script>");
                        
                        loadprofile(uid,request);
			RequestDispatcher rd = request.getRequestDispatcher("LoadProfile");
			rd.include(request, response);
  
  }else {
  
  
  loadprofile(uid,request);
  request.getRequestDispatcher("Profile.jsp").forward(request, response);
  }
         
 
  


    
    }

    private void loadprofile(String uid, HttpServletRequest request) {
        
        
         
          String query="SELECT * FROM `users` WHERE  `uid`='"+uid+"'"; 
          
           List<user> userlist= new  ArrayList<>();
        try{
        Statement st = conn.createStatement();          
        ResultSet rs = st.executeQuery(query);
        while(rs.next()){
        user us=new user();
        us.setUid(rs.getString("uid"));
        us.setUname(rs.getString("uname"));
        us.setFname(rs.getString("fname"));
        us.setLname(rs.getString("lname"));
        us.setEmail(rs.getString("email"));
        us.setPass(rs.getString("pass"));
        us.setAddress(rs.getString("address"));
        us.setRole(rs.getString("role"));
        userlist.add(us);
       
        }
        
         for(user u : userlist){
                    
//                  out.println(u.getUname());
//                   out.println(u.getFname());
//                    out.println(u.getLname());
//                     out.println(u.getEmail());
//                      out.println(u.getPass());
//                       out.println(u.getRole());
         }


        
 request.setAttribute("profilelist", userlist);
        }catch(SQLException ex){
            System.out.println(ex.toString());
        }
        
    }

     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
       doGet(request,response);
    
    }   
        
    

}
