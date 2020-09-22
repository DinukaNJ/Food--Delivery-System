/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.Conn;
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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kcrdi
 */
public class CustomizeServlet extends HttpServlet {

    Connection conn=Conn.getConnection();
    List<items> itemList = new ArrayList<>();
    
    List<option> optionList= new ArrayList<>();
    
    List<cutomize> cutomizeList= new  ArrayList<>();
    
    
    String type;
  
    PrintWriter out;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        out = response.getWriter();
 
        String uid=(String) request.getSession().getAttribute("uid");
        
        
        
        String itemid=request.getParameter("itemid");
        
        itemList.clear();
        
        LoadingCustomize(itemid, request,response);
        
        
        optionList.clear();
        LoadingOptions(type,request,response);
        
        request.setAttribute("coutomizeitems", cutomizeList);

        
        
        try {
            LoadingoptionsTable(request.getParameter("itemid"),uid,request);
        } catch (SQLException ex) {
            Logger.getLogger(CustomizeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
      
        
        
            RequestDispatcher rd=request.getRequestDispatcher("customize.jsp");
           rd.forward(request, response);
       
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         out=response.getWriter();
         
         
   String uid = (String) (request.getSession().getAttribute("uid") != null ? request.getSession().getAttribute("uid"):"");
        if(uid.equals("")) {                 
        
            request.getRequestDispatcher("Login.jsp").forward(request, response);
                      
        }
         
         
        
//when we are recalling the post method we didint get the get method so i decide to that declered get machanisum in post method 


   

        itemList.clear();
        LoadingCustomize(request.getParameter("pid1"), request,response);
        optionList.clear();
        LoadingOptions(request.getParameter("ptype"),request,response);
        
      //  request.setAttribute("coutomizeitems", cutomizeList);

      
       String pid=request.getParameter("pid1");
       String pname=request.getParameter("pname");
       String option=request.getParameter("option");
       String oprice=request.getParameter("oprice");
       String noptions=request.getParameter("noptions");
       
            //--------------------------------------------------------------------------------------------------------------
        try {
            addANDget(pid,pname,option,oprice,noptions,uid,request,response);
            
            
        } catch (SQLException ex) {
            Logger.getLogger(CustomizeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
         RequestDispatcher rd=request.getRequestDispatcher("customize.jsp");
         rd.forward(request, response);
    }

  
private void LoadingCustomize(String id, HttpServletRequest request, HttpServletResponse response) {
        try{
       
       
            String query="SELECT * FROM `foods` WHERE `id`='"+id+"'"; 
          //  out.print(query);
            Statement st = conn.createStatement();          
            ResultSet rs = st.executeQuery(query);
            
                while(rs.next()){
                  //to set type for loading options  
                  type=rs.getString("type");
                  
                  
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
               
                
     }
     catch(SQLException  ex){
         
         System.err.println(ex.toString());
     }
        
    }
private void LoadingOptions(String type, HttpServletRequest request, HttpServletResponse response) {
      //  out.print(type);
        String query="SELECT * FROM `options` WHERE `type`='"+type+"'"; 
        try{
        Statement st = conn.createStatement();          
        ResultSet rs = st.executeQuery(query);
        while(rs.next()){
       // out.print(rs.getString("price"));
       
       option op= new option();
       
       op.setOptions(rs.getString("options"));
       
       op.setPrice(rs.getString("price"));
       optionList.add(op);
       
        }
        
//         for(option op : optionList){
//                      out.print( op.getOptions()+"\n" );
//                   
//                  }


        
     request.setAttribute("options", optionList);
        }catch(SQLException ex){
            System.out.println(ex.toString());
        }
    }
private void LoadingoptionsTable(String pid1, String uid, HttpServletRequest request) throws SQLException {
   String query="SELECT * FROM `customize` WHERE `pid`="+pid1+" AND `uid`="+uid+" AND `added`='false'"; 
      cutomizeList.clear();
        Statement st = conn.createStatement();          
        ResultSet rs = st.executeQuery(query);
        while(rs.next()){
       // out.print(rs.getString("price"));
       
     cutomize cum= new cutomize();
     cum.setId(Integer.parseInt(rs.getString("id")));
     cum.setPname(rs.getString("pname"));
     cum.setPid(rs.getInt("pid"));
     cum.setOptions(rs.getString("options"));
     cum.setNoptions(rs.getInt("noptions"));
     cum.setTotal(rs.getDouble("total"));
    
     cutomizeList.add(cum);
       
     
        }

       
      
  request.setAttribute("coutomizeitems", cutomizeList);      
//         for(cutomize cutomizeList : cutomizeList){
//                      out.print( cutomizeList.getOptions()+"\n" );
//                   
//                  }  
  
    }
   
private void addANDget(String pid1, String pname, String option, String oprice, String noptions,String uid, HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException, SQLException  {
    int nop =Integer.parseInt(noptions);

   double total=nop*Double.parseDouble(oprice);
   
   out.print(total);
        if(nop>0){
        try{
       String insert="INSERT INTO `customize` (`id`, `pname`, `pid`, `options`, `noptions`, `total`, `uid`, `added`)"
                    + " VALUES "
                    + "(NULL, '"+pname+"', '"+pid1+"', '"+option+"', '"+noptions+"', '"+total+"', '"+uid+"', 'false');"; 
        Statement  st = conn.createStatement();          
         //         
        //out.print(insert);
            st.executeUpdate(insert);  
       out.print("added !"); 
      
       //user id must be adde after you added th sessions 
        }catch(SQLException ex){
        
         out.print(ex.toString()); 
      
        }
        
        }        

           
     LoadingoptionsTable(pid1,uid,request); 
              
        
        
   }
}
