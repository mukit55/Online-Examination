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
 * @author Rasel
 */
public class LoginController extends HttpServlet {

  /*
    
    create table APP.QUESTION (id INTEGER NOT NULL 
                PRIMARY KEY GENERATED ALWAYS AS IDENTITY 
                (START WITH 1, INCREMENT BY 1), a varchar(255), b varchar(255), c varchar(255), d varchar(225), ans varchar(1));

    */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        //System.out.println("Email : "+email+", Password : "+password);
        
        Service service  = new Service();
        int check = service.loginUser(email, password);
        if(check!=0){
            
            if(check==1){
            request.getRequestDispatcher("exam.jsp").include(request, response);
            request.getSession().setAttribute("email", email);
            
            }else{
                request.getRequestDispatcher("cpanel.jsp").include(request, response);
            }
            
            
        }else{
            request.setAttribute("mgs", "Email or password is wrong");
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
        
        
    }

   
}
