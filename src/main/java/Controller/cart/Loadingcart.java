/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.cart;

import DB.Conn;
import Model.cart;
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
public class Loadingcart extends HttpServlet {
    
        Connection conn=Conn.getConnection();

  
       
   
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String pid = (String) request.getSession().getAttribute("pid");
        String uid = (String) request.getSession().getAttribute("uid");
        
        loadcart(uid,request);
       // request.getSession().removeAttribute("pid");
        request.getRequestDispatcher("cart.jsp").forward(request, response);
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       
        
       // request.getRequestDispatcher("cart.jsp").forward(request, response);
      
    }


    
     private void loadcart(String uid, HttpServletRequest request) {
        
          String query="SELECT * FROM `cart` WHERE  `uid`='"+uid+"'"; 
          
           List<cart> cartList= new  ArrayList<>();
        try{
        Statement st = conn.createStatement();          
        ResultSet rs = st.executeQuery(query);
        while(rs.next()){
         cart c= new cart();
         c.setPname(rs.getString("pname"));
         c.setPid(rs.getInt("pid2"));
         c.setOdis(rs.getString("odis"));
         c.setUid(rs.getInt("uid"));
         c.setTotal(Double.parseDouble(rs.getString("total")));
         
        cartList.add(c);
//       optionList.add(op);
       
        }
        
         for(cart c : cartList){
                    
                   
                  }


        
 request.setAttribute("cartlist", cartList);
        }catch(SQLException ex){
            System.out.println(ex.toString());
        }
        
    }



}


