/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin;

import DB.Conn;
import Model.items;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
 out= response.getWriter();
      
    loadFoods(request);  
    
    // out.print("hello");
    
//                    RequestDispatcher rd = request.getRequestDispatcher("Admin/foodtable.jsp");
//	            rd.forward(request, response);

request.getRequestDispatcher("Admin/foodtable.jsp").forward(request, response);
    
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      doGet(request,response);

       
       
       
       
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
