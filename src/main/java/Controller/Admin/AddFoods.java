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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50) 
@WebServlet(name = "AddFoods", urlPatterns = {"/AddFoods"})
public class AddFoods extends HttpServlet {

    
Connection conn=Conn.getConnection();
PrintWriter out; 
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       out=response.getWriter();
        String fdname=request.getParameter("fdname");
         String fddes=request.getParameter("fddes");
          String fdprice=request.getParameter("fdprice");
          String fdtype=request.getParameter("fdtype");
         String fdcat=request.getParameter("fdcat");
        String fdperiod=request.getParameter("fdperiod");
                

//        out.println(fdname);
//          out.println(fddes);
//           out.println(fdprice);
//            out.println(fdtype);
//        out.println(fdcat);
//        out.println(fdperiod);
//        
        
        
        insertFood(fdname,fddes,fdprice,fdtype,fdcat,fdperiod,request,response);
        
    }

    private void insertFood(String fdname, String fddes, String fdprice, String fdtype, String fdcat, String fdperiod, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
                  HttpSession session=request.getSession(false);

        
        try{
          
       String insert="INSERT INTO `foods` (`id`, `name`, `des`, `price`, `type`, `cat`, `period`, `pimg`) VALUES (NULL, '"+fdname+"', '"+fddes+"', '"+fdprice+"', '"+fdtype+"', '"+fdcat+"', '"+fdperiod+"', '');";
       
       //get the last id for upadate the food items     
       String lastid = null;
       Statement st=conn.createStatement();
        st.executeUpdate(insert, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs= st.getGeneratedKeys();
            if (rs.next()) 
            {
              System.out.println("Last Inserted ID = "+rs.getLong(1));
              lastid=String.valueOf(rs.getLong(1));
              
              //out.println("Last Inserted ID = "+lastid);
            }  
            
            
            String imgpath=lastid+".png";
            //upload image
              uploadImge(lastid,request);            
            
         String update="UPDATE `foods` SET `pimg`='"+imgpath+"' WHERE `id`='"+lastid+"';";  
       
          st.executeUpdate(update);
       
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

    private void uploadImge(String lastid, HttpServletRequest request) throws IOException, ServletException {
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
            String fileName = lastid;
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();
            part.write(savePath + File.separator + fileName+".png");
        }
           
      //file uploading part end   
    }

}
