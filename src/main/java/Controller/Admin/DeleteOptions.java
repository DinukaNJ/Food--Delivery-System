/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin;

import DB.Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kcrdi
 */
@WebServlet(name = "DeleteOptions", urlPatterns = {"/DeleteOptions"})
public class DeleteOptions extends HttpServlet {

PrintWriter out ;
 Connection conn=Conn.getConnection();   

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
           out =response.getWriter();
         String id=request.getParameter("id") != null ? request.getParameter("id"):"";
         
         out.print(id);
         
        
         deleteOptions(id,request,response);
      
    }

    private void deleteOptions(String id, HttpServletRequest request, HttpServletResponse response) throws IOException {
       
                  HttpSession session=request.getSession(false);

        
        try{
          
       String delete="DELETE FROM `options` WHERE `id`='"+id+"';;";
       
      
       Statement st=conn.createStatement();
        st.executeUpdate(delete);
          
       //sucess notification

 
       
       out.println("Sucess !");
     // request.getRequestDispatcher("LoadFoodsTable").forward(request, response);
           session.setAttribute("error","false");
           //request.getRequestDispatcher("LoadFoodsTables").forward(request, response);
       response.sendRedirect("OptionsLoadTables");
       
      
      }
      catch(Exception ex){
          System.out.println(ex.toString());
          out.print(ex.toString());
          
           session.setAttribute("error","true");
        // request.getRequestDispatcher("OptionsLoadTables").forward(request, response);
         
         response.sendRedirect("OptionsLoadTables");
         
    //  response.sendRedirect("LoadFoodsTables");
          out.println("error");
              //   request.getRequestDispatcher("../LoadFoodsTablee").forward(request, response);

      }
        
    }

    

}
