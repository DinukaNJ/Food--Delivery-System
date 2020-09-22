/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.users;

import DB.Conn;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author kcrdi
 */
@WebServlet(name = "EditProfile", urlPatterns = {"/EditProfile"})



@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)  
public class EditProfile extends HttpServlet {
//private static final String SAVE_DIR = "img";
Connection conn=Conn.getConnection();
PrintWriter out;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          out=response.getWriter();
          
        String uid = (String) (request.getSession().getAttribute("uid") != null ? request.getSession().getAttribute("uid"):"");
        
   //file uploading part start     
      
        String appPath = request.getServletContext().getInitParameter("file-upload");
        // constructs path of the directory to save uploaded file
        String savePath = appPath;
      //  out.print(savePath);
       //+File.separator
        
        
//        File fileSaveDir = new File(savePath);
//        if (!fileSaveDir.exists()) {
//            fileSaveDir.mkdir();
//        }
//        
//           for (Part part : request.getParts()) {
//               
//            //user ud give as file nama reduce the reaprt and limated storage   
//            String fileName = uid;
//            // refines the fileName in case it is an absolute path
//            fileName = new File(fileName).getName();
//            part.write(savePath + File.separator + fileName+".png");
//        }
//           
      //file uploading part end      
           
        String uname=request.getParameter("uname");
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        
//debuging for        
//        out.println(uname);
//         out.println(fname);
//          out.println(lname);
//          out.println(email);
//        out.println(address);
           updateProfile(uid,uname,fname,lname,email,address,request,response);
           
    }

    private void updateProfile(String uid, String uname, String fname, String lname, String email, String address, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
          HttpSession session=request.getSession(false);
         
            try{
          
       String update="UPDATE `users` SET `uname`='"+uname+"',`fname`='"+fname+"',`lname`='"+lname+"',`email`='"+email+"',`address`='"+address+"' WHERE `uid`='"+uid+"'; ;";
       Statement st=conn.createStatement();
      
    
       st.executeUpdate(update);
      
       
       //sucess notification
    out.println("Sucess");
    session.setAttribute("error","false");
   request.getRequestDispatcher("LoadProfile").forward(request, response);
		
		
       
      
      }
      catch(IOException | SQLException | ServletException ex){
          System.out.println(ex.toString());
                 session.setAttribute("error","true");
          	out.println("error");
                 request.getRequestDispatcher("LoadProfile").forward(request, response);
                 
                // response.sendRedirect("LoadProfile");
               
		
      }
    
           
    }

    

  

    

}
