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
import java.sql.ResultSet;
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
public class EditFoods extends HttpServlet {
 Connection conn=Conn.getConnection();
PrintWriter out; 

  
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          out=response.getWriter();
           String id=request.getParameter("id");
        String fdname=request.getParameter("fdname");
         String fddes=request.getParameter("fddes");
          String fdprice=request.getParameter("fdprice");
          String fdtype=request.getParameter("fdtype");
         String fdcat=request.getParameter("fdcat");
        String fdperiod=request.getParameter("fdperiod");
                

//        out.println(id);
//        out.println(fdname);
//        out.println(fdname);
//          out.println(fddes);
//           out.println(fdprice);
//            out.println(fdtype);
//        out.println(fdcat);
//        out.println(fdperiod);
        
                   
            
        
//        
 UpdateFoods(id,fdname,fddes,fdprice,fdtype,fdcat,fdperiod,request,response);
       
    }

    private void UpdateFoods(String id, String fdname, String fddes, String fdprice, String fdtype, String fdcat, String fdperiod, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        
        
        
                  HttpSession session=request.getSession(false);

        
        try{
          
       String insert="UPDATE `foods` SET `name`='"+fdname+"',`des`='"+fddes+"',`price`='"+fdprice+"',`type`='"+fdtype+"',`cat`='"+fdcat+"',`period`='"+fdperiod+"'WHERE id='"+id+"';;";
       
     
       Statement st=conn.createStatement();
        st.executeUpdate(insert);
  
          
              uploadImge(id,request); 
    
       //sucess notification

 
       
       out.println("Sucess !");
     // request.getRequestDispatcher("LoadFoodsTable").forward(request, response);
     
     
           session.setAttribute("error","false");
           //request.getRequestDispatcher("LoadFoodsTables").forward(request, response);
       response.sendRedirect("LoadFoodsTables");
       
      
      }
      catch(Exception ex){
          System.out.println(ex.toString());
          out.print(ex.toString());
          
           session.setAttribute("error","true");
         request.getRequestDispatcher("LoadFoodsTables").forward(request, response);
    //  response.sendRedirect("LoadFoodsTables");
          out.println("error");
              //   request.getRequestDispatcher("../LoadFoodsTablee").forward(request, response);

      }
        
        
        
    }

    private void uploadImge(String id, HttpServletRequest request) throws IOException, ServletException {
       //file uploading part start     
      
        String appPath = request.getServletContext().getInitParameter("product-upload");
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
            String fileName = id;
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();
            part.write(savePath + File.separator + fileName+".png");
        }
           
      //file uploading part end    
        
    }

   

}
