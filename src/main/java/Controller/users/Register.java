/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.users;

import DB.Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kcrdi
 */
public class Register extends HttpServlet {

   
Connection conn=Conn.getConnection();
PrintWriter out;
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        out=response.getWriter();
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String email=request.getParameter("email");
        String uname=request.getParameter("uname");
        String pass=request.getParameter("pass");
        String address=request.getParameter("address");
        
        //for debugin
      //  out.print(fname+"\n"+lname+"\n"+email+"\n"+uname+"\n"+pass+"\n"+address);
        
        AddUser(fname,lname,email,uname,pass,address,request,response);
       
    }

    private void AddUser(String fname, String lname, String email, String uname, String pass, String address, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      try{
          
       String insert="INSERT INTO `users` (`uid`, `uname`, `fname`, `lname`, `pass`, `email`, `address`, `role`, `status`) VALUES (NULL, '"+uname+"', '"+fname+"', '"+lname+"', '"+pass+"', '"+email+"', '"+address+"', 'client', 'active');";
       Statement st=conn.createStatement();
      
    
       st.executeUpdate(insert);
       
       
       //sucess notification
       out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'WELCOME' ,  'Register successfull !' ,  'success' );");
			out.println("});");
			out.println("</script>");
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
       
      
      }
      catch(Exception ex){
          System.out.println(ex.toString());
          
          	out.println("<script src='js/sweetalert2.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Ops' ,  ' Something went wrong!' ,  'error' );");
			out.println("});");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
			rd.include(request, response);
      }
    }
}
