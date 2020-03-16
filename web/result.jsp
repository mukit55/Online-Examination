<%-- 
    Document   : result
    Created on : Feb 20, 2020, 12:14:34 PM
    Author     : MCJ
--%>

<%@page import="java.util.List"%>
<%@page import="model.AppUser"%>
<%@page import="service.Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>
    <center>
        
        <h1 style="margin-top:50px">Result Sheet</h1>
        
        <div class="container" >
            
         <table class="table table-striped">

                    <tr>
                        <th>Name</th>
                        <th>Email Address</th>
                        <th>Total Question</th>
                        <th>Right Answer</th>
                        <th>Wrong Answer</th>
                        <th>No Answer</th>         
                    </tr>

                    <%
                        Service s = new Service();
                        List<AppUser> list = (List<AppUser>) s.fetchAppUser();
                        System.out.println(list);
                        for(AppUser u : list)
                        {
                            String[] rs = u.getResult().split(",");
                            String ra = rs[0];
                            String wa = rs[1];
                            String na = rs[2];
                            String ta = rs[3];
                            
                            %>
                            <tr>
                                <td><%=u.getName()%></td>
                                <td><%=u.getEmail()%></td>
                                <td><%=ta%></td>
                                <td><%=ra%></td>
                                <td><%=wa%></td>
                                <td><%=na%></td>
                            </tr>
                            <%
                        }
                    %>
                    
                    

                </table>
        </div>
        
    </center>
    </body>
</html>
