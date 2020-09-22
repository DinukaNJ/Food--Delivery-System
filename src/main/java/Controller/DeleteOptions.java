/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "DeleteOptions", urlPatterns = {"/DeleteOptions"})
public class DeleteOptions extends HttpServlet {

Connection conn=Conn.getConnection();
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String uid=(String) request.getSession().getAttribute("uid");
        String cuitemid=request.getParameter("itemid");
      deleteoption(cuitemid,response);
        
       
      out.print(request.getParameter("itemid"));
      
      request.setAttribute("itemid",request.getParameter("itemid"));

      
        RequestDispatcher rd=request.getRequestDispatcher("CustomizeServlet");
        rd.forward(request,response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void deleteoption(String itemid, HttpServletResponse response) throws IOException {
    PrintWriter out=response.getWriter() ;

         try{
          String insert="DELETE FROM `customize` WHERE `id`='"+itemid+"';";          
          Statement  st = conn.createStatement();          

           st.executeUpdate(insert);  
       out.print("deleted !"); 
         }catch(SQLException ex){
             out.print(ex.toString());
         
         }

    }

}
