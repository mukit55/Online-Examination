<%-- 
    Document   : index
    Created on : Jul 4, 2019, 9:15:12 PM
    Author     : Rasel
--%>

<%@page import="service.Service"%>
<%@page import="java.util.*"%>
<%@page import="model.Question"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title

        <link   rel="style.css"/>


    </head>
    <body>

    

        <div class="ques-holder">

            
            <% 
                Service s = new Service();
                List<Question> dl = (List<Question>) s.getData();
            %>
            <div class="container"> 
            <form action="/HomeControler" >
                
                <% for(int i=0;i<dl.size();i++){  
                    Question q = dl.get(i);
                %>
                    
                    <table style="margin-left:100px;">
                    <tr>
                        <td><p text-align="center"><%=q.getId()+"."+q.getQues()%></p></td>
                    </tr>
                    <tr>
                        <td> 
                            <label> <input type="radio" name="opt" value="opt-a" checked> <%=q.getA()%> </label> 
                        </td>
                    </tr>

                    <tr>
                        <td> 
                             <label> <input type="radio" name="opt" value="opt-b" > <%=q.getB()%> </label>  
                        </td>
                    </tr>

                    <tr>
                        <td> 
                             <label> <input type="radio" name="opt" value="opt-c" > <%=q.getC()%> </label> 
                        </td>
                    </tr>

                    <tr>
                        <td> 
                            <label> <input type="radio" name="opt" value="opt-d" > <%=q.getD()%> </label> 
                        </td>
                    </tr>

                    <%}%>
                    
                    <tr>
                        <td>
                            <input type="submit" value="Submit" />
                        </td>
                    </tr>

                </table>
                    
                
            </form>


            </div>

        </div>

    


</body>
</html>
