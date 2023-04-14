<%-- 
    Document   : ShowPage
    Created on : 18 בפבר׳ 2023, 11:56:52
    Author     : לידור
--%>
<%@page import="java.util.*"%>
<%@page import="DB.*"%>
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
        <title>To Do List - Show Task</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="PageStyle.css">

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
                    <p id="logoutcontainer" class="LogOutText" ><a id="logout" href="Log_out_Servlet" title="Back to the menu">Log out</a></p>
                    <h3 class="UserTextHello" style="color:<%= color%>"><%= Name%></h3>

                </div>

            </div>


            <div class="middle">
                <img class="middleImg" src="https://i.postimg.cc/8PhvXyCS/getty-514914078-200013332000928076-167571.jpg">
                <div class="LogRegBlock"  >    

                    <div class="LogRegFrame" id="scrollBar" style="overflow: auto;">


                        <h4 class="TextIndex" style="top: 3%; left: 35%">Show Task</h4>
                        <h5 class="underTextIndex" style="top: 13%; left: 33%">This is your tasks of lists:</h5>
                        <div style="width: 500px; height: 1500px;">


                            <div  style="margin: 13% 0%;">
                                <%
                                    User u = (User) session.getAttribute("UserObj");
                                    ListDB lb = new ListDB();
                                    TaskDB tb = new TaskDB();

                                    LinkedList<String> ListofListName = lb.getAllLists(u);
                                    int countList = ListofListName.size();

                                    for (int i = 0; i < countList; i++) {
                                %>

                                <%
                                    String Name_L = ListofListName.get(i);
                                    LinkedList<Task> tmpTaskList = tb.getAllTask(Name_L, u);

                                %>
                                <form method="post" action="DeleteServ" >
                                    <p class="tableDesign" style="margin:90px 290px;">
                                        <%= Name_L%>
                                        <input type="hidden"class="buttonHo2" style="margin:0px -60px;" value="<%= Name_L%>" name="deleteList" >
                                    <input type="submit"class="buttonHo2" style="margin:0px -60px;" value="Delete" name="deleteList" ><p/>
                                </form>

                                <%
                                    //sizetop += 20;
                                %>
                                <table class="tableDesign" id="tableShow" style="margin: -80px 40px;" border="3">
                                    <tr>
                                        <th>Name
                                        </th>
                                        <th>Description</th>
                                        <th>Date</th>
                                        <th>Priority</th>
                                        <th>Is it done?</th>
                                        <th>Delete Task</th>
                                        <th>Already done</th>
                                    </tr>
                                    <%
                                        for (int j = 0; j < tmpTaskList.size(); j++) {
                                            String colorRow = "black";
                                            String ToCheck = "";
                                            String s = tmpTaskList.get(j).getTaskName();
                                            boolean isdone = tmpTaskList.get(j).getFlag();
                                            if (isdone) {
                                                colorRow = "green";
                                                ToCheck = "checked";
                                            }

                                    %>                                  
                                    <tr>
                                        <th style="color: <%=colorRow%>;"><%= tmpTaskList.get(j).getTaskName()%></th>
                                        <th style="color:  <%=colorRow%>;"><%= tmpTaskList.get(j).getTaskDesctiption()%></th>
                                        <th style="color:  <%=colorRow%>;"><%= tmpTaskList.get(j).getFinishedDate()%></th>
                                        <th style="color:  <%=colorRow%>;"><%= tmpTaskList.get(j).getTaskPriority()%></th>
                                        <th style="color:  <%=colorRow%>;"><%= tmpTaskList.get(j).getFlag()%></th>
                                        <th> 
                                            <form method="post" action="DleteTaskServ" >
                                                <input type="submit" style="margin: 35% 30%;" value="Delete" id="<%=Name_L + "___" + s%>" name="deleteList" >
                                                <input type="hidden" style="margin: 35% 30%;" value="<%=Name_L + "___" + s%>" name="deleteList" >
                                            </form>
                                        </th>
                                    <form method="post" action="TaskIsDoneServ" >
                                        <th><input type="checkbox" id="<%=Name_L + "___" + tmpTaskList.get(j).getTaskName()%>" value="<%=Name_L + "___" + tmpTaskList.get(j).getTaskName()%>" name="donetask"  onclick="myclick(this.id)" <%= ToCheck%>></th>
                                        <input type="submit" style="visibility: hidden" value="<%=Name_L + "___" + s%>" id="1" value="<%=Name_L + "___" + tmpTaskList.get(j).getTaskName()%>" name="donetask" >

                                    </form>

                                    </tr>

                                    <%
                                        }
                                    %>
                                </table>  

                                <%
                                    }
                                %>
                            </div>


                        </div>






                    </div>
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

<script>
    function myclick(d) {
        var Button = document.getElementById("1");
        Button.value = d;
        Button.click();
        // alert(d)

    }


</script>