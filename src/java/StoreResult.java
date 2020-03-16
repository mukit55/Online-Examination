/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.Service;

/**
 *
 * @author MCJ
 */
public class StoreResult extends HttpServlet {

   
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String result = request.getParameter("result");
        System.out.println("#Result : "+result);
        
        String email = request.getSession().getAttribute("email").toString();
        System.out.println("#Email : "+email);
        
        Service s = new Service();
        s.updateResult(result, email);
        
    }

  
}
