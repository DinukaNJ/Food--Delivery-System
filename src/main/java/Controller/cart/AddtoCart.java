/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.cart;

import DB.Conn;
import Model.cart;
import Model.cutomize;
import Model.items;
import Model.option;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddtoCart", urlPatterns = {"/AddtoCart"})
public class AddtoCart extends HttpServlet {
  Connection conn=Conn.getConnection();

  
 
 
    PrintWriter out;
 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    out=response.getWriter();
    

        //User validations
        String uid = (String) (request.getSession().getAttribute("uid") != null ? request.getSession().getAttribute("uid"):"");
        if(uid.equals("")) {
            
            
          //  response.sendRedirect("Login.jsp");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            
            
        }
        String pid =request.getParameter("pid2");
        String pname =request.getParameter("pname");
      
        String odis =request.getParameter("odis");
        String total =request.getParameter("total");
        addcart(pid,uid,pname,odis,total);
       request.getSession().setAttribute("pid", pid);
       response.sendRedirect("Loadingcart");
        
    }


    private void addcart(String pid, String uid, String pname, String odis, String total) {
       try{
       Statement st=conn.createStatement();
       String insert="INSERT INTO `cart` (`tb_id`, `pname`, `pid2`, `uid`, `odis`, `total`) VALUES (NULL, '"+pname+"', '"+pid+"', '"+uid+"', '"+odis+"', '"+total+"');";
       
       st.executeUpdate(insert);
       String update="UPDATE `customize` SET `added`='true' WHERE `pid`='"+pid+"' AND `uid`='"+uid+"';";
       st.executeUpdate(update);
       out.print("Added !");}
       catch(SQLException ex){
        out.print(ex.toString());
       
       }
    }

   }
