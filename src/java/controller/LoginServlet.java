/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Lessor;
import model.Rental;

/**
 *
 * @author Asus
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            int check = 0;
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            HttpSession session = request.getSession();
            try {
                Statement stmt = conn.createStatement();
                String sql = "SELECT * from member where username='" + username + "'";
                ResultSet rs = stmt.executeQuery(sql);
                if (rs.next()) {
                    if (password.equals(rs.getString("password"))) {
                        if (rs.getInt("idtype_member") == 2) {
                            Rental rental = new Rental(conn);
                            rental.importData(username, password);
                            session.setAttribute("member", rental);
                        } else if (rs.getInt("idtype_member") == 1) {
                            Lessor lessor = new Lessor(conn);
                            lessor.importData(username, password);
                            session.setAttribute("member", lessor);
                        }
                        check = 1;
                        session.setAttribute("check", check);
                        RequestDispatcher pg = request.getRequestDispatcher("landing.jsp");
                        pg.forward(request, response);
                    } else {
                        check = 2;
                        request.setAttribute("check", check);
                        RequestDispatcher pg = request.getRequestDispatcher("index.jsp");
                        pg.forward(request, response);
                    }

                } else {
                    check = 3;
                    request.setAttribute("check", check);
                    RequestDispatcher pg = request.getRequestDispatcher("index.jsp");
                    pg.forward(request, response);
                }

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
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
        processRequest(request, response);
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
