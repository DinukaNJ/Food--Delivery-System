/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin;

import DB.Conn;
import Model.Admin.Order;
import Model.users.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kcrdi
 */
public class LoadOrders extends HttpServlet {

    
Connection conn=Conn.getConnection();
PrintWriter out;
   
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
       out=response.getWriter();
        loadingOders(request);
        
        
        
         request.getRequestDispatcher("Admin/ordertable.jsp").forward(request, response);
    }

    private void loadingOders(HttpServletRequest request) {
        
          List<Order> OrderList = new ArrayList<>();

     try{
            String query1="SELECT * FROM `orders`"; 
            //out.print(query1);
            
            Statement st = conn.createStatement();          
            ResultSet rs = st.executeQuery(query1);
                while(rs.next()){
                 Order od= new Order();
                  od.setId(rs.getString("id"));
                  od.setDes(rs.getString("des"));
                  od.setOduser(rs.getString("oduser"));
                  od.setTime(rs.getString("time"));
                   
                  OrderList.add(od);

               }
                
                  for(Order od : OrderList){
                    
                   out.println(od.getId());
                   out.println(od.getDes());
                   out.println(od.getOduser());
                   out.println(od.getTime());
                  }
                //set attributes
               
                
                
              request.setAttribute("OrderList", OrderList);
                
                //set naviagtions 
             
     }//
     catch(SQLException ex){
         
         System.err.println(ex.toString());
     }
 
       
    }

 
    }
    
    

 


