<%-- 
    Document   : controlMessages
    Created on : 16 בפבר׳ 2023, 19:57:56
    Author     : לידור
--%>
<%@page import="model.User"%>
<%
%>
<%
    boolean flag = false;
    String MSG = (String) session.getAttribute("Msg");
    String color = "";
    String Gcolor = "";
    String Name = "";
    String link = "index.html";
    String link2 = "";
    HttpSession s = request.getSession(false);
    User u;
    if (s == null || s.isNew() || !request.isRequestedSessionIdValid()) {
        MSG = "No permission";
    }
    if (MSG == "User is exist.") {
        color = "red";
    } else if (MSG == "User successfuly connected.") {
        color = "green";
        link = "MenuAfterLog.jsp";
        flag = true;
        u = (User) s.getAttribute("UserObj");
        Name = u.getFname();
        if (u.getGender().equals("male")) {
            Gcolor = "blue";
        } else {
            Gcolor = "pink";

        }
%>
<%
    } else if (MSG == "Wrong password." || MSG == "User is no exist.") {
        color = "red";
        link = "index.html";
    } else if (MSG.equals("List successfully added.") || MSG.equals("Task successfully added.")) {
        color = "green";
        link = "MenuAfterLog.jsp";
        link2 = "AddTask.jsp";
    }else if (MSG.equals("List already exist.")) {
        color = "red";
        link = "MenuAfterLog.jsp";
        link2 = "AddTask.jsp";
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
        <title>To Do List - New List</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="PageStyle.css">
        <script src="JS_Util.js"></script>

    </head>


    <body>
        <div class="page">
            <div class="header" style="display:flex">  

                <div style="width: 20%; text-align: left">
                    <a href=<%= link%> target="_self" id="logolink">
                        <img class="logoImg" style="margin: 7px 10px" src="https://i.postimg.cc/QdxF6f7H/pngwing-com.png">
                    </a>
                </div>

                <div style="width: 60%; text-align: center;">
                    <h1 class="headerText" style="margin: 12px 0px;">To Do List</h1> 
                </div>

                <div style="width: 20%; text-align: right;">
                    <h2 id="helloname" class="UserTextHello"></h2> 
                    <%
                        if (flag) {%>
                    <p id="logoutcontainer" class="LogOutText" ><a id="logout" href="Log_out_Servlet" title="Back to the menu">Log out</a></p>
                    <h3 class="UserTextHello" style="color:<%= Gcolor%>"><%= Name%>                    </h3> 

                    <%

                        }
                    %>
                </div>

            </div>


            <div class="middle">
                <img class="middleImg" src="https://i.postimg.cc/8PhvXyCS/getty-514914078-200013332000928076-167571.jpg">            
                <div class="LogRegBlock">    

                    <div class="LogRegFrame">
                    </div>

                    <h4 class="TextIndex" style="top: 3%; left: 22%">Control Messages</h4>
                    <h5 class="underTextIndex" style="top: 13%; left: 33%">Messages from now:</h5>
                    <h6 class="underTextIndex" style="top: 50%; left: 40%; color:<%= color%>"> <%= MSG%> </h6>
                    <%
                        if (flag) {%>
                    <h7 class="underTextIndex" style="top: 70%; left: 40%; color:<%= color%>"><a href=<%= link%> target="_self">To the menu</a></h7>

                    <%
                    } else if (MSG == "Wrong password." || MSG == "User is no exist.") {%>
                    <h7 class="underTextIndex" style="top: 70%; left: 40%; color:<%= color%>"><a href=<%= link%> target="_self">To Main page</a></h7>
                        <%
                        } else if (MSG == "List successfully added." || MSG == "List already exist.") {%>
                    <h7 class="underTextIndex" style="top: 70%; left: 40%; color:<%= color%>"><a href=<%= link%> target="_self">To menu</a></h7>
                    <h8 class="underTextIndex" style="top: 80%; left: 40%; color:<%= color%>"><a href=<%= link2%> target="_self">Add task</a></h8>

                    <%
                        }else if (MSG == "Task successfully added.") {%>
                    <h7 class="underTextIndex" style="top: 70%; left: 40%; color:<%= color%>"><a href=<%= link%> target="_self">To menu</a></h7>
                    <h8 class="underTextIndex" style="top: 80%; left: 40%; color:<%= color%>"><a href=<%= link2%> target="_self">Add more task</a></h8>

                    <%
                        }
                    %>







                    <div id="ErrPos" class="underTextIndexMain" style="margin: 50px 220px; font-size: 11px"> </div>
                    <div id="ErrPosLink" class="underTextIndexMain" style="margin: 100px 220px; color: blue; font-size: 10px"> </div>
                    <div id="ErrPosLink2" class="underTextIndexMain" style="margin: 130px 240px; color: blue; font-size: 10px"> </div>


                </div> 
            </div> 


            <div class="footer" style="display:flex">
                <div style="width: 100%; text-align: center;" >
                    <h3 class="FooterText" style="margin: 12px 0px;">Lidor Huri & Ido Bueno - <a href="https://netanya.ac.il/s" target="_blank">Netanya College</a></h3> 
                </div>

            </div>
        </div>



    </body>
</html>
