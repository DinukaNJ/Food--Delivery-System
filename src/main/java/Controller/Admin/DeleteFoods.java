/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kcrdi
 */
public class DeleteFoods extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      //  processRequest(request, response);
         PrintWriter out =response.getWriter();
         String id=request.getParameter("id") != null ? request.getParameter("id"):"";
         
         out.print(id);
         
         deleteFoods(id,request,response);
    }

    private void deleteFoods(String id, HttpServletRequest request, HttpServletResponse response) {
      
    }

    

}
