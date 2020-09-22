/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.Conn;
import Model.items;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kcrdi
 */
@WebServlet(name = "SearchLoading", urlPatterns = {"/SearchLoading"})
public class SearchServelt extends HttpServlet {
    Connection conn=Conn.getConnection();;
    List<items> itemList = new ArrayList<>();
    PrintWriter out ;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   out = response.getWriter();
   itemList.clear();

 String cat=request.getParameter("cat");
   if(!cat.equals("")){ 
   
   getItems(cat,request,response);
   }
  
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        out = response.getWriter();
   
      String serach=request.getParameter("search");
      out.print(request.getParameter("search"));
      getItemsSerach(serach,request,response);      
      
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void getItems(String cat, HttpServletRequest request, HttpServletResponse response)   {
           try{
            String query1="SELECT * FROM `foods` WHERE `cat`='"+cat+"'"; 
            out.print(query1);
            
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
                  itemList.add(itemObj);
 //                  out.print(rs.getString("name")+"\t"+rs.getString("des")+"\t"+rs.getString("price")+"\t"+rs.getString("type")+"\t"+rs.getString("cat")+"\t"+rs.getString("period"));
//                  out.print("\n");
               }
                
//                  for(items it : itemList){
//                      out.print( it.getName()+"\n" );
//                   
//                  }
                 
                  request.setAttribute("items", itemList);
                  RequestDispatcher rd=request.getRequestDispatcher("foods.jsp");  
               rd.forward(request, response);
           }
           catch(SQLException|ServletException|IOException ex){
         
         System.err.println(ex.toString());
     }
 
 
    }

    private void getItemsSerach(String serach, HttpServletRequest request, HttpServletResponse response) {
        itemList.clear();
          try{
            String query1=" SELECT * FROM `foods` WHERE (`name` LIKE '%"+serach+"%'   OR  `cat` LIKE '%"+serach+"%')"; 
            out.print(query1);
            
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
                  itemList.add(itemObj);
 //                  out.print(rs.getString("name")+"\t"+rs.getString("des")+"\t"+rs.getString("price")+"\t"+rs.getString("type")+"\t"+rs.getString("cat")+"\t"+rs.getString("period"));
//                  out.print("\n");
               }
                
//                  for(items it : itemList){
//                      out.print( it.getName()+"\n" );
//                   
//                  }
                 
                  request.setAttribute("items", itemList);
                  RequestDispatcher rd=request.getRequestDispatcher("foods.jsp");  
               rd.forward(request, response);
           }
           catch(SQLException|ServletException|IOException ex){
         
         System.err.println(ex.toString());
     }
    }

   
}
