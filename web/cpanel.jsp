<%-- 
    Document   : cpanel
    Created on : Jul 25, 2019, 10:24:30 AM
    Author     : Rasel
--%>

<%@page import="model.Question"%>
<%@page import="java.util.List"%>
<%@page import="service.Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> CPANEL </title>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <style>
            @import url(https://fonts.googleapis.com/css?family=Raleway:300,400,600);


            body{
                margin: 0;
                
                font-weight: 400;
                line-height: 1.6;
                color: #212529;
                text-align: left;
                background-color: #f5f8fa;
            }

            .navbar-laravel
            {
                box-shadow: 0 2px 4px rgba(0,0,0,.04);
            }

            .navbar-brand , .nav-link, .my-form, .login-form
            {
                font-family: Raleway, sans-serif;
            }

            .my-form
            {
                padding-top: 1.5rem;
                padding-bottom: 1.5rem;
            }

            .my-form .row
            {
                margin-left: 0;
                margin-right: 0;
            }

            .login-form
            {
                padding-top: 1.5rem;
                padding-bottom: 1.5rem;
            }

            .login-form .row
            {
                margin-left: 0;
                margin-right: 0;
            }
        </style>
        <script>

            /*
             function deleteQuestion(del_id){
             
             //alert("Delete id : "+del_id);
             
             $.post("CpanelControler",{
             opt_type: 'DELETE_DATA',
             del_id: del_id
             }, function(data, status){
             // alert("Data "+data+", Status : "+status);
             
             request.getRequestDispatcher("cpanel.jsp").forward(request, response);
             });
             
             }
             */



        </script>








    </head>
    <body>
        <main class="login-form">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-10">
                        <form  action="CpanelControler" method="post">
                            <div class="card">
                                <div class="card-header">Add Question</div>
                                <input type="hidden" name="opt_type" value="SAVE_DATA"/>
                                <table class="card-body">
                                    <tr class="form-group row">
                                        <td class="col-md-4 col-form-label text-md-right">Question</td>
                                        <td class="col-md-6"> <input class="form-control" type="text" name="ques" required/> </td>
                                    </tr>
                                    <tr class="form-group row">
                                        <td class="col-md-4 col-form-label text-md-right">Option A : </td>
                                        <td class="col-md-6"> <input class="form-control" type="text" name="a" required/> </td>
                                    </tr>
                                    <tr class="form-group row">
                                        <td class="col-md-4 col-form-label text-md-right">Option B : </td>
                                        <td class="col-md-6"> <input class="form-control" type="text" name="b" required/> </td>
                                    </tr>
                                    <tr class="form-group row">
                                        <td class="col-md-4 col-form-label text-md-right">Option C : </td>
                                        <td class="col-md-6"> <input class="form-control" type="text" name="c" required/> </td>
                                    </tr>
                                    <tr class="form-group row">
                                        <td class="col-md-4 col-form-label text-md-right">Option D : </td>
                                        <td class="col-md-6"> <input class="form-control" type="text" name="d" required/> </td>
                                    </tr>
                                    <tr class="form-group row">
                                        <td class="col-md-4 col-form-label text-md-right">Select Answer : </td>
                                        <td class="col-md-6"> 

                                            <!--                        <input type="text" name="ans" required/> -->


                                            <label class="radio-inline">
                                                <input type="radio" name="optradio" checked value="a">Option A
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optradio" value="b">Option B
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optradio" value="c">Option C
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optradio" value="d">Option D
                                            </label>

                                        </td>
                                    </tr>
                                    <div class="col-md-6 offset-md-4">
                                        <td><input class="btn btn-success" type="submit" value="Save Question"/> </td>
                                    </div>

                                </table>
                            </div>
                        </form>
                    </div>
                </div>


                <table class="table table-striped">

                    <tr>
                        <th>SL No.</th>
                        <th>Question</th>
                        <th>Option A</th>
                        <th>Option B</th>
                        <th>Option C</th>
                        <th>Option D</th>
                        <th>Answer</th>
                        <th>Delete</th>
                    </tr>

                    <%
                        Service s = new Service();

                        List<Question> datalist = (List<Question>) s.getData();

                        for (int i = 0; i < datalist.size(); i++) {

                            Question data = datalist.get(i);
                    %>
                    <tr>
                        <td><%=(i+1)%></td>
                        <td><%=data.getQues()%></td>
                        <td><%=data.getA()%></td>
                        <td><%=data.getB()%></td>
                        <td><%=data.getC()%></td>
                        <td><%=data.getD()%></td>
                        <td><%=data.getAns()%></td>

                        <td> 
                            <form   action="CpanelControler" method="post" >
                                <input type="hidden" name="opt_type" value="DELETE_DATA"/>
                                <input type="hidden" name="del_id" value="<%=data.getId()%>"/>
                                <input type="submit" class="btn btn-danger"  value="Delete">

                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>

                </table>

            </div>
        </main>
    </body>
</html>
