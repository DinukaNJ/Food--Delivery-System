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
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kcrdi
 */
public class AddOption extends HttpServlet {
 Connection conn=Conn.getConnection();
PrintWriter out; 
   
  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     out=response.getWriter();
           String fdoption=request.getParameter("fdoption");
        String fdtype=request.getParameter("fdtype");
         String fdprice=request.getParameter("fdprice");
         
         

        
       
        out.println(fdoption);
        out.println(fdtype);
          out.println(fdprice);
          
          
         insertOption(fdtype,fdoption,fdprice,request,response);
          
    }

    private void insertOption(String fdtype, String fdoption, String fdprice, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
               HttpSession session=request.getSession(false);

        
        try{
          
       String insert="INSERT INTO `options` (`id`, `type`, `options`, `price`) VALUES (NULL, '"+fdtype+"', '"+fdoption+"', '"+fdprice+"');";
       
       //get the last id for upadate the food items     
    out.println(insert);
       Statement st=conn.createStatement();
        st.executeUpdate(insert);
           
       
       out.println("Sucess !");
   
           session.setAttribute("error","false");
        
           
    response.sendRedirect("OptionsLoadTables");       
      
      }
      catch(Exception ex){
          System.out.println(ex.toString());
          out.print(ex.toString());
            out.println("error");
           session.setAttribute("error","true");
         response.sendRedirect("OptionsLoadTables");
         
         
         
         
    //  response.sendRedirect("LoadFoodsTables");
              //   request.getRequestDispatcher("../LoadFoodsTablee").forward(request, response);

      }
        
        
        
        
        
        
        
    }

   

}
