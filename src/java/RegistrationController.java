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
import model.AppUser;
import service.Service;

/**
 *
 * @author Rasel
 */
public class RegistrationController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String confirm = request.getParameter("confirm");

        if (password.equals(confirm)) {

            AppUser appUser = new AppUser();
            appUser.setEmail(email);
            appUser.setPasword(password);
            appUser.setName(name);
            appUser.setAddress(address);
            appUser.setType("USER");

            //System.out.println(appUser.toString());
            
            Service service = new Service();
            if(service.AppUserRegistration(appUser)){
                request.setAttribute("mgs", "Registration Success");
//                response.sendRedirect("index.jsp");
             request.getRequestDispatcher("login.jsp").include(request, response);
            }else{
               request.setAttribute("mgs", "User allready exist please try with another emaill address.");
            }
            
            
            request.getRequestDispatcher("registration.jsp").include(request, response);
            
        }else{
            request.setAttribute("mgs", "Please check your confirm password.");
            request.getRequestDispatcher("registration.jsp").include(request, response);
        }

    }

}
