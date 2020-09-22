/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin;

import DB.Conn;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)
public class EditUsers extends HttpServlet {

 Connection conn=Conn.getConnection();
PrintWriter out;  

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        out=response.getWriter();
        
        String uid=request.getParameter("uid");
        String uname=request.getParameter("uname");
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
         String status=request.getParameter("status");
        
         out.println(uid);
         out.println(uname);
         out.println(fname);
          out.println(lname);
          out.println(email);
        out.println(address);
        out.println(status);
        
        
         updateProfile(uid,uname,fname,lname,email,address,status,request,response);
    }

    private void updateProfile(String uid, String uname, String fname, String lname, String email, String address, String status, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession(false);
         
            try{
          
       String update="UPDATE `users` SET `uname`='"+uname+"',`fname`='"+fname+"',`lname`='"+lname+"',`email`='"+email+"',`address`='"+address+"',`status`='"+status+"' WHERE `uid`='"+uid+"'; ;";
       Statement st=conn.createStatement();
      
    
       st.executeUpdate(update);
       updateImage(uid,request);
       
       //sucess notification
    out.println("Sucess");
    session.setAttribute("error","false");
  request.getRequestDispatcher("LoadUser").forward(request, response);
		
		
       
      
      }
      catch(Exception ex){
          System.out.println(ex.toString());
                 session.setAttribute("error","true");
          	out.println("error");
               request.getRequestDispatcher("LoadUser").forward(request, response);
                 
                // response.sendRedirect("LoadProfile");
               
		
      }
    }

    private void updateImage(String uid, HttpServletRequest request) throws IOException, ServletException {
       //file uploading part start     
      
        String appPath = request.getServletContext().getInitParameter("file-upload");
        // constructs path of the directory to save uploaded file
        String savePath = appPath;
      //  out.print(savePath);
       //+File.separator
        
        
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        
           for (Part part : request.getParts()) {
               
            //user ud give as file nama reduce the reaprt and limated storage   
            String fileName = uid;
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();
            part.write(savePath + File.separator + fileName+".png");
        }
           
      //file uploading part end   
    }

   
}
