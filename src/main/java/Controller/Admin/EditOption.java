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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kcrdi
 */
public class EditOption extends HttpServlet {

 Connection conn=Conn.getConnection();
PrintWriter out; 
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        
        
        out=response.getWriter();
           String fdoption=request.getParameter("fdoption");
        String fdtype=request.getParameter("fdtype");
         String fdprice=request.getParameter("fdprice");
         
         
         String id=request.getParameter("id");
        
//                out.println(id);
//        out.println(fdoption);
//        out.println(fdtype);
//          out.println(fdprice);



updateoption(id,fdtype,fdprice,fdoption,request,response);
        
    }

    private void updateoption(String id, String fdtype, String fdprice, String fdoption, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
          HttpSession session=request.getSession(false);
         try{
          
       String insert="UPDATE `options` SET `type`='"+fdtype+"',`options`='"+fdoption+"',`price`='"+fdprice+"' WHERE id='"+id+"'";
     
       Statement st=conn.createStatement();
        st.executeUpdate(insert);
  
          
             
    
       //sucess notification

 
       
       out.println("Sucess !");
    
     
     
           session.setAttribute("error","false");
          
      
           
          response.sendRedirect("OptionsLoadTables");
       
      
      }
      catch(Exception ex){
          System.out.println(ex.toString());
          out.print(ex.toString());
          
           session.setAttribute("error","true");
         
           

          out.println("error");
            
              
               response.sendRedirect("OptionsLoadTables");
      }
       
    }

}
