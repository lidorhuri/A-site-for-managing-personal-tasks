<%-- 
    Document   : LoginPage
    Created on : 16 בפבר׳ 2023, 19:55:05
    Author     : לידור
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>To Do List - Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="PageStyle.css">
       <script src="JS_Util.js"></script>

    </head>

    <body>
        <div class="page">
            <div class="header" style="display:flex">  

                <div style="width: 20%; text-align: left">
                    <a href="index.html" target="_self">
                        <img class="logoImg" style="margin: 7px 10px" src="https://i.postimg.cc/QdxF6f7H/pngwing-com.png">
                    </a>
                </div>

                <div style="width: 60%; text-align: center;">
                    <h1 class="headerText" style="margin: 12px 0px;">To Do List</h1> 
                </div>

                <div style="width: 20%; text-align: right;">
                    <h2 class="UserTextHello">Hello Guest</h2> 
                </div>

            </div>


            <div class="middle">
                <img class="middleImg" src="https://i.postimg.cc/8PhvXyCS/getty-514914078-200013332000928076-167571.jpg">            
                <div class="LogRegBlock">    

                    <div class="LogRegFrame">
                    </div> 

                    <h4 class="TextIndex" style="top: 3%; left: 40%">Login</h4>
                    <h5 class="underTextIndex" style="top: 13%; left: 31%">Please enter your details:</h5>
                    <form method="post" action="LoginServ">

                        <div class="RegularText" style="top: 30%; left: 33%;">Email: <input type="email" name="loginInfo" id="login_email" required> <br><br>Password:</div> 
                        <div class="RegularText" style="top: 36%; left: 44%;"><input type="password" name="loginInfo" id="login_password" style=" width:  137px" required></div> 
                        <div class="RegularText" style="top: 42%; left: 33%;"><a href="index.html" title="Back to the main page">Forgot password?</a></div> 
                        <div style="margin: 230px 250px"> 
                            <input type="submit" class="buttonHo2" value="Login" id="login_submit" name="loginInfo">
                        </div>
                    </form>


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