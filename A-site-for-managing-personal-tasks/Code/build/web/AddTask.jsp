<%-- 
    Document   : AddTask
    Created on : 18 בפבר׳ 2023, 9:57:25
    Author     : לידור
--%>
<%@page import="model.*"%>
<%
    //HttpSession s = request.getSession(false);
    String color = "";
    String Name = "";
    boolean flag = false;
    String list_name = (String) request.getSession().getAttribute("AddTaskToListName");
    if (session == null || session.isNew() || !request.isRequestedSessionIdValid()) {
        session.invalidate();
%>
<jsp:forward page="controlMessages.jsp" />
<%
    } else {
        User u = (User) session.getAttribute("UserObj");
        Name = u.getFname();
        flag = true;
        if (u.getGender().equals("male")) {
            color = "blue";
        } else {
            color = "pink";

        }

    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>To Do List - Add Task</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="PageStyle.css">
        <script src="JS_Util.js"></script>

    </head>

    <body>
        <div class="page">
            <div class="header" style="display:flex">  

                <div style="width: 20%; text-align: left">
                    <a href="MenuAfterLog.jsp" target="_self">
                        <img class="logoImg" style="margin: 7px 10px" src="https://i.postimg.cc/QdxF6f7H/pngwing-com.png">
                    </a>
                </div>

                <div style="width: 60%; text-align: center;">
                    <h1 class="headerText" style="margin: 12px 0px;">To Do List</h1> 
                </div>

                <div style="width: 20%; text-align: right;">
                    <h2 id="helloname" class="UserTextHello"></h2> 
                    <p id="logoutcontainer" class="LogOutText" ><a id="logout" href="Log_out_Servlet" title="Back to the menu">Log out</a></p>
                    <h3 class="UserTextHello" style="color:<%= color%>"><%= Name%></h3> 
                </div>

            </div>


            <div class="middle">
                <img class="middleImg" src="https://i.postimg.cc/8PhvXyCS/getty-514914078-200013332000928076-167571.jpg">            

                <div class="LogRegBlock">    
                    <div class="LogRegFrame"> 
                    </div>
                    <h4 class="TextIndex" style="top: 3%; left: 30%">Add new task</h4>
                    <h5 class="underTextIndex" style="top: 13%; left: 42%;  font-size: 15px;">Fill your details:</h5>
                    <form method="post" action="AddTaskServ">

                        <div class="RegularText" style="top: 25%; left: 33%;">List name:&nbsp&nbsp <input type="text" name="TaskInfo" value="<%= list_name%>" id="listname" style=" width:150px;" required></div>
                            <%     request.getSession().setAttribute("AddTaskToListName", "");
                            %>
                        <div class="RegularText" style="top: 30%; left: 33%;">Task name:&nbsp <input type="text" name="TaskInfo"  id="tname" style=" width:150px;" required>
                            <br><br>Description: <br><br><br><br><br>Priority:<br><br>End date:</div>

                        <div class="RegularText" style="top: 35%; left: 45%; ">
                            <textarea  id="descriptiontext" name="TaskInfo" maxlength="100" rows="4" cols="18"style="min-width: 152px; min-height:62px; max-width: 320px; max-height:62px;" required>            
                            </textarea> 
                            <div class="RegularText" style="top: 110%; left: 0%;">   
                                <div id="Priority" >
                                    <select name="TaskInfo">
                                        <option value="1" >1</option>
                                        <option value="2">2</option>
                                        <option value="3" >3</option>
                                    </select>
                                </div>

                            </div>
                        </div>
                        <div class="RegularText" style="top: 56%; left: 45%;"> <input type="date"  name="TaskInfo" id="enddate" style=" width:  150px;" required></div>
                        <input type="submit" class="buttonHo2" style="margin: 52% 42%;" value="Add Task" id="addTaskButt" name="addTaskButt">
                    </form>

                </div>
            </div>

            <div class="footer" style="display:flex">
                <div style="width: 100%; text-align: center;" >
                    <h3 class="FooterText" style="margin: 12px 0px;">Lidor Huri & Ido Bueno - <a href="https://netanya.ac.il/s" target="_blank">Netanya College</a></h3> 
                </div>

            </div>
        </div>

        <script>


        </script>    


    </body>
</html>
