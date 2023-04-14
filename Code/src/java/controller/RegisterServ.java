/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DB.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import model.*;

/**
 *
 * @author לידור
 */
public class RegisterServ extends HttpServlet {

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
            out.println("<title>Servlet RegisterServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServ at " + request.getContextPath() + "</h1>");
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
        PrintWriter o = response.getWriter();
        String mail = "";
        String pass = "";
        String gen = "";
        String fname = "";
        String lname = "";
        int age = 0;
        Date date = null;
        String arr_reg[] = request.getParameterValues("registerInfo");
        String arr_age[] = request.getParameterValues("age");
        mail = arr_reg[0];
        pass = arr_reg[1];
        fname = arr_reg[2];
        lname = arr_reg[3];
        String s = arr_reg[4];
        LocalDate localDate = LocalDate.parse(s);
        Date sqlDate = java.sql.Date.valueOf(localDate);
        date = sqlDate;

        age = Integer.parseInt(arr_age[0]);
        String arr_gen[] = request.getParameterValues("gender");

        if (arr_gen[0].equals("1")) {
            gen = "male";
        } else {
            gen = "female";
        }

        //sql check if there is user
        UsersDB ub = new UsersDB();
        User u = ub.getUser(mail);
             
        if (u == null) {
            //u is not user
            HttpSession session = request.getSession();
              //o.println(u.getEmail());
            request.getSession().setAttribute("Msg", "User successfuly connected.");
            u = new User (fname, lname, mail, pass, date, age, gen);
            ub.addUser(u);
            session.setAttribute("UserObj", u);

            
            RequestDispatcher rd = request.getRequestDispatcher("controlMessages.jsp");
            rd.forward(request, response);

        } else {
            request.getSession().setAttribute("Msg", "User is exist.");
            RequestDispatcher rd = request.getRequestDispatcher("controlMessages.jsp");
            rd.forward(request, response);
        }

        //sql call
        //
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
