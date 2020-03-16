/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;
import service.Service;

/**
 *
 * @author Rasel
 */
public class CpanelControler extends HttpServlet {

    private static final String SAVE = "SAVE_DATA", DELETE = "DELETE_DATA";
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("opt_type");
       

        if (type.equals(SAVE)) {

            String ques = request.getParameter("ques");
            String a = request.getParameter("a");
            String b = request.getParameter("b");
            String c = request.getParameter("c");
            String d = request.getParameter("d");
            String ans = request.getParameter("optradio");

            Question q = new Question();
            q.setQues(ques);
            q.setA(a);
            q.setB(b);
            q.setC(c);
            q.setD(d);
            q.setAns(ans);

            System.out.println("Ques : " + q.toString());

            Service s = new Service();
            s.addQuestion(q);

           
            
        }else if(type.equals(DELETE)){
            
            String deleteId = request.getParameter("del_id");
            
            System.out.println(deleteId);
            
            Service s = new Service();
            s.deleteQuestion(Integer.parseInt(deleteId));
            
           // request.getRequestDispatcher("cpanel.jsp").forward(request, response);
                    
        }
        
         request.getRequestDispatcher("cpanel.jsp").forward(request, response);

    }

}
