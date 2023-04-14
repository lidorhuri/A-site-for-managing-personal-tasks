<%-- 
    Document   : RegisterPage
    Created on : 16 בפבר׳ 2023, 16:51:31
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
        <title>To Do List - Register</title>
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
                    <h4 class="TextIndex" style="top: 3%; left: 38%">Register</h4>
                    <h5 class="underTextIndex" style="top: 13%; left: 32%; ">Please enter your details:</h5>
                    <form method="post" action="RegisterServ">
                        <div class="RegularText" style="top: 30%; left: 33%;">* Email: <input type="email" name="registerInfo" id="email" style=" width:  155px" required></div> 
                        <div class="RegularText" style="top: 35%; left: 33%;">* Password: <input type="password" name="registerInfo" id="passwordtext" style=" width:  130px" required></div> 
                        <div class="RegularText" style="top: 40%; left: 33%;">First Name: <input type="text" name="registerInfo" id="fname" style=" width:  133px"></div> 
                        <div class="RegularText" style="top: 45%; left: 33%;">Last Name: <input type="text" name="registerInfo" id="lname" style=" width:  134px"></div> 
                        <div class="RegularText" style="top: 50%; left: 33%;">  <label>Birth date: </label>
                            <input type="date" name="registerInfo" id="bdate" style=" width:  137px;"></div> 
                        <div class="RegularText" style="top: 55%; left: 33%;">Age: <input type="number" name="age" id="age"  min="10" max="120"  style=" width:171px"></div> 
                        <div class="RegularText" style="top: 60%; left: 33%;">Gender:</div> 
                        <div style="display:flex">  
                            <label for="gender" class="RegularText" style="top: 60%; left: 45%;"> <input type="radio" id="gen1" name="gender" value="1" checked="Checked" > Male</label> 
                            <label for="gender" class="RegularText" style="top: 60%; left:55%;"><input type="radio" id="gen2" name="gender" value="0"> Female</label> 
                        </div>

                        <div class="RegularText" style="top: 70%; left: 33%;"><input type="checkbox" id="rules" name="rules" value="Rules" onchange="isChecked()"> I agree the rules and regulations</div>
                        <div style="margin: 370px 240px"> 
                            <input type="submit" class="buttonHo2" value="Register" id="RegButt" name="register_submit">
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

        <script>
            function isChecked() {
                let checkRules = document.getElementById("rules");
                if (checkRules.checked) {
                    tmpButt.disabled = false;

                } else {
                    tmpButt.disabled = true;

                }

            }





        </script>    
 
    </body>
</html>