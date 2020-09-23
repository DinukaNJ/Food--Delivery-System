/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin;

import DB.Conn;
import Model.Admin.Order;
import Model.items;
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
public class LoadAllTables extends HttpServlet {

Connection conn=Conn.getConnection();
PrintWriter out;

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
          out=response.getWriter();
          
         loadingOders(request);
         loadingUser(request);        
         loadFoods(request);
         
         
         
         request.getRequestDispatcher("Admin/tables.jsp").forward(request, response);

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
   private void loadingUser(HttpServletRequest request) {
        
         List<user> userList = new ArrayList<>();

     try{
            String query1="SELECT * FROM `users`"; 
            //out.print(query1);
            
            Statement st = conn.createStatement();          
            ResultSet rs = st.executeQuery(query1);
                while(rs.next()){
                 user u= new user();
                 u.setUid(rs.getString("uid"));
                 u.setUname(rs.getString("uname"));
                 u.setFname(rs.getString("fname"));
                 u.setLname(rs.getString("lname"));
                 u.setPass(rs.getString("pass"));
                 u.setEmail(rs.getString("email"));
                 u.setAddress(rs.getString("address"));
                 u.setRole(rs.getString("role"));
                 u.setStatus(rs.getString("status"));
                 
                  userList.add(u);

               }
                
                  for(user u : userList){
                      out.println( u.getUname()+"\n" );
                       out.println( u.getAddress()+"\n" );
                   
                  }
                //set attributes
               
                
                
              request.setAttribute("userList", userList);
                
                //set naviagtions 
             
     }//
     catch(SQLException ex){
         
         System.err.println(ex.toString());
     }
 
       
    }   
    public void loadFoods(HttpServletRequest request)  {
 //itemList.clear();
 
     List<items> itemList = new ArrayList<>();

     try{
            String query1="SELECT * FROM `foods`"; 
            //out.print(query1);
            
            Statement st = conn.createStatement();          
            ResultSet rs = st.executeQuery(query1);
                while(rs.next()){
                  items itemObj= new items();
                  itemObj.setName(rs.getString("name"));
                  itemObj.setDes(rs.getString("des"));
                  itemObj.setPrice(Double.parseDouble(rs.getString("price")));
                  itemObj.setType(rs.getString("type"));
                  itemObj.setCat(rs.getString("cat"));
                  itemObj.setPeriod(rs.getString("period"));
                  itemObj.setPimgpath(rs.getString("pimg"));
                  itemObj.setId(rs.getString("id"));

                  
                  itemList.add(itemObj);
 //                  out.print(rs.getString("name")+"\t"+rs.getString("des")+"\t"+rs.getString("price")+"\t"+rs.getString("type")+"\t"+rs.getString("cat")+"\t"+rs.getString("period"));
//                  out.print("\n");
               }
                
                  for(items it : itemList){
                      out.print( it.getName()+"\n" );
                   
                  }
                //set attributes
               request.setAttribute("itemslist", itemList);
                
                //set naviagtions 
             
     }//
     catch(SQLException ex){
         
         System.err.println(ex.toString());
     }
 
  }
}
