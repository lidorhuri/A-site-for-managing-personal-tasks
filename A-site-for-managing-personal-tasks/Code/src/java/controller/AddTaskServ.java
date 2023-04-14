/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DB.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 *
 * @author לידור
 */
public class AddTaskServ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddTaskServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddTaskServ at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String arr_Task[] = request.getParameterValues("TaskInfo");
        String listname = arr_Task[0].trim();//1
        String NameOfTask = arr_Task[1].trim();//5
        String TaskDecsription = arr_Task[2].trim();//2
        String TaskPriority = arr_Task[3].trim();//3
        String DateOfTask = arr_Task[4].trim();
        LocalDate localDate = LocalDate.parse(DateOfTask);
        Date sqlDate = java.sql.Date.valueOf(localDate);
        Date FinishedDate = sqlDate;//4
        User u = (User) request.getSession().getAttribute("UserObj");
        String mail = u.getEmail();//6
        boolean flag = false;//7

        //check if list is exist and add- if not> add list and then add task
        ListDB tl = new ListDB();
        TaskDB ta = new TaskDB();

        TaskList tmp = new TaskList(listname, mail);
        boolean f = tl.getList(tmp);
        Task t;
        if (f) {
            t = new Task(listname, TaskDecsription, TaskPriority, FinishedDate, NameOfTask, mail, flag);
            ta.addTask(t);

        } else {
            TaskList t_lis = new TaskList(listname, mail);
            tl.addList(t_lis);
            t = new Task(listname, TaskDecsription, TaskPriority, FinishedDate, NameOfTask, mail, flag);
            ta.addTask(t);
        }
        request.getSession().setAttribute("Msg", "Task successfully added.");
        RequestDispatcher rd = request.getRequestDispatcher("controlMessages.jsp");
        rd.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
