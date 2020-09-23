/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin;

import DB.Conn;
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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kcrdi
 */
public class OptionsLoadTables extends HttpServlet {

Connection conn=Conn.getConnection();
PrintWriter out;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  out=response.getWriter();
          loadOptions(request);  
    request.getRequestDispatcher("Admin/optiontable.jsp").forward(request, response);

    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     doGet(request,response);
    }

    private void loadOptions(HttpServletRequest request) {
        
          

     
        try{
            
            
     String select="SELECT * FROM `options`"; 
     
      List<option> optionList= new ArrayList<>();
        Statement st = conn.createStatement();          
        ResultSet rs = st.executeQuery(select);
        while(rs.next()){
       // out.print(rs.getString("price"));
       
       option op= new option();
       
       
       op.setId(rs.getString("id"));
       op.setType(rs.getString("type"));
       op.setOptions(rs.getString("options"));
       
       op.setPrice(rs.getString("price"));
       
       
       
       optionList.add(op);
       
        }
             
        
         for(option op : optionList){
                      out.print( op.getType()+"\n" );
                    out.print( op.getId()+"\n" );
                  }
        
        
        
         request.setAttribute("optionList", optionList);
             
     }//
     catch(SQLException ex){
         
         System.err.println(ex.toString());
     }
        
        
      
    }


}
