<%-- 
    Document   : exam
    Created on : Jul 31, 2019, 9:17:31 AM
    Author     : razu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EXAM</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>


        <script>




            $(document).ready(function () {



                // alert("hi");

                $("#submitBtn").hide();
                $("#cancelBtn").hide();
                $("#startBtn").click(function () {

                    $("#submitBtn").show();
                    $("#cancelBtn").show();
                    num_of_ques = $("#selectedQues").val();
                    // alert(num_of_ques);

                    $.post("ExamController", {num_of_ques: num_of_ques}, function (data, status) {

                        // alert(data);
                        $("#startBtn").hide(200);

                        keySet = Object.keys(data);
                        valueSet = Object.values(data);

                        //alert(keySet);
                        //alert(valueSet[0]['ques']);
                        createQuesList(valueSet);
                    });
                });



                function createQuesList(data)
                {

                    tblData = "";

                    //alert(data.length);
                    for (i = 0; i < data.length; i++) {

                        //alert(data[i]["id"]);
                        q = data[i];
                        tblData += "<div id=" + i + ">";
                        tblData += "<h4 > "+(1+i)+". "+ q["ques"] + "</h4> ";
                        tblData += " <input type = 'radio' name = " + i + " value='a' > " + q["a"] + "<br/>";

                        tblData += " <input type = 'radio' name =  " + i + " value='b' > " + q['b'] + "<br/>";
                        tblData += "  <input type = 'radio' name =  " + i + " value='c' > " + q['c'] + "<br/>";
                        tblData += " <input type = 'radio' name =  " + i + " value='d' > " + q['d'] + "<br/>";
                        tblData += " </div><br/>";

                        $("#quesHolder").empty();
                        $("#quesHolder").append(tblData);


                    }


                }


                $("#submitBtn").click(function () {

                    
                    child = $("#quesHolder").children("div");

                    wrongAns = 0;
                    rightAns = 0;
                    noAns = 0;

                    for (x of child)
                    {
                        //id = x["id"];
                        id = $(x).attr("id");
                        myans = $("#" + id + " input[name=" + id + "]:checked").val();
                        //alert(id);

                        if (myans === undefined) {
                            noAns++;
                        } else {

                            curans = valueSet[id]["ans"];
                            if (myans === curans) {
                                rightAns++;
                            } else {
                                wrongAns++;
                            }

                            //alert("My ANS : " + myans + ", ANS : ");

                        }

                    }

                    displayResult();

                });


                function displayResult()
                {
                    $("#startBtn").show(200);
                    $("#submitBtn").hide();
                    $("#cancelBtn").hide();
                    $("#quesHolder").empty();

                    alert("Right : " + rightAns + "\nWrong : " + wrongAns + "\nNo Ans : " + noAns);
                }
                
                
                
                $("#cancelBtn").click(function(){
                    
                     $("#startBtn").show(200);
                    $("#submitBtn").hide();
                    $("#cancelBtn").hide();
                    $("#quesHolder").empty();
                    
                });





            });






        </script>




    </head>
    <body>


        <div class="row">

            <div style="padding: 50px;" class="col-sm-3">

               
                <select id="selectedQues"  class="form-control" >
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>15</option>
                    <option>20</option>
                    <option>25</option>
                    <option>30</option>
                    <option>35</option>
                    <option>40</option>
                    <option>45</option>
                </select>


                <button id="startBtn" style="margin-top:20px;"  class="btn btn-primary" >Start Exam</button>
                <br/>
                <button id="submitBtn" style="margin-top:60px;" class="btn btn-success" >Submit</button>
                <button id="cancelBtn" style="margin-top:60px;" class="btn btn-danger" >Cancel</button>

            </div>

            <div style="padding: 50px;" class="col-sm-9">

                <div id="quesHolder">
                </div>
            
            </div>

        </div>


    </body>
</html>
