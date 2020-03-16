/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;
import org.json.JSONObject;
import service.Service;


public class ExamController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Service s = new Service();

        String n = request.getParameter("num_of_ques");
        List<Question> qlist = s.getExamQuestionSet(Integer.parseInt(n));

        JSONObject kv = new JSONObject();
        for (int i = 0; i < qlist.size(); i++) {
            
            Question q = qlist.get(i);
            JSONObject v = new JSONObject();
            v.put("id", q.getId());
            v.put("ques", q.getQues());
            v.put("a", q.getA());
            v.put("b", q.getB());
            v.put("c", q.getC());
            v.put("d", q.getD());
            v.put("ans", q.getAns());
            kv.put(""+i, v);
            
        }

        System.out.println(kv.toString());
        response.setContentType("application/json");
        response.getWriter().write(kv.toString());
        
        
    }

}
