<%-- 
    Document   : AddListPage
    Created on : 17 בפבר׳ 2023, 14:25:09
    Author     : לידור
--%>
<%@page import="model.*"%>
<%
    //HttpSession s = request.getSession(false);
    String color = "";
    String Name = "";
    boolean flag = false;
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

                    <h4 class="TextIndex" style="top: 3%; left: 30%">Add new list</h4>
                    <h5 class="underTextIndex" style="top: 13%; left: 37%">Fill your details:</h5>
                    <form method="post" action="AddListServ">
                        <div class="RegularText" style="top: 30%; left: 34%">List Name: <input type="text" name="NewListButt" id="tname" style=" width:150px;" required></div>
                        <input type="submit" class="buttonHo2" style="margin: 30% 40%;" value="Add List" id="NewListButt" name="NewListButt">
                    

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