
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
@WebServlet(name = "LoadingFoods", urlPatterns = {"/LoadingFoods"})
public class LoadingFoods extends HttpServlet {
    
    //Conection decaleration 
    Connection conn=Conn.getConnection();;
    
    PrintWriter out ;
    
    //items model object createing 
    
    
    //items List decleration
    //model ad as list
    List<items> itemList = new ArrayList<>();
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      //for debuging-----  
      out = response.getWriter();
       //for debuging-----  
        
       
      itemList.clear();
      String period=request.getParameter("period") != null ? request.getParameter("period"):"false";
    
      if( period.equals("false")){
        //out.print("waitng naviate!");
        getItems(request,response);
      
      }
     
      else{
         getItems(period,request,response);
      }           
      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doGet(request,response);
    }

 
    
    
   
//method overreding we using there    
 //methode for index.jsp  
 public void getItems(HttpServletRequest request,HttpServletResponse response)  {
 //itemList.clear();
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
                
//                  for(items it : itemList){
//                      out.print( it.getName()+"\n" );
//                   
//                  }
                //set attributes
               request.setAttribute("items", itemList);
                
                //set naviagtions 
               RequestDispatcher rd=request.getRequestDispatcher("foods.jsp");  
               rd.forward(request, response);
     }//
     catch(SQLException|ServletException|IOException ex){
         
         System.err.println(ex.toString());
     }
 
 
 }
 //method for foods.jsp
 public void getItems(String period ,HttpServletRequest request,HttpServletResponse response)  {
 
   try{
       
       
            String query="SELECT * FROM `foods` WHERE `period`='"+period+"' OR `period`='any' "; 
          //  out.print(query);
            Statement st = conn.createStatement();          
            ResultSet rs = st.executeQuery(query);
            
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
                
                //set attributes
                request.setAttribute("items", itemList);
                
                //set naviagtions 
                RequestDispatcher rd=request.getRequestDispatcher("foods.jsp");  
                rd.forward(request, response);
                
     }
     catch(SQLException |ServletException| IOException ex){
         
         System.err.println(ex.toString());
     }
 
 }
}
