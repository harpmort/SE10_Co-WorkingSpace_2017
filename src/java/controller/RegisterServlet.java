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
import model.Member;

/**
 *
 * @author Asus
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String img = request.getParameter("profileimg");
            String idcard = request.getParameter("idcardfile");
            int type = Integer.parseInt(request.getParameter("who-selector"));
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
            boolean isEmailExisted = false;
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            HttpSession session = request.getSession();
            int check = 0;
            PictureManager save_img = new PictureManager();
            String path_img = "";
            String[] path = img.split("");
            int count_path = path.length;
            String filetype_revert = "";
            for (int j = 0; count_path - 1 >= j; count_path--) {
                if (!path[count_path - 1].equals(".")) {
                    filetype_revert += path[count_path - 1];
                } else if (path[count_path - 1].equals(".")) {
                    break;
                }
            }
            int count_revert = filetype_revert.length();
            String file_type = "";
            for (int k = 0; count_revert - 1 >= k; count_revert--) {
                file_type += filetype_revert.charAt(count_revert - 1);
            }

            save_img.savePicture("space", firstname+"_" +lastname, file_type, img);
            path_img += save_img.getUrlImage("space", firstname+"_" +lastname, file_type);
            
            PictureManager save_idcard = new PictureManager();
            String path_idcard = "";
            String[] path_card = idcard.split("");
            int count_path_card = path_card.length;
            String revert = "";
            for (int j = 0; count_path_card - 1 >= j; count_path_card--) {
                if (!path_card[count_path_card - 1].equals(".")) {
                    revert += path_card[count_path_card - 1];
                } else if (path_card[count_path_card - 1].equals(".")) {
                    break;
                }
            }
            int count_revert_card = revert.length();
            String file_type_card = "";
            for (int k = 0; count_revert_card - 1 >= k; count_revert_card--) {
                file_type_card += revert.charAt(count_revert_card - 1);
            }

            save_idcard.savePicture("space", username+"_"+firstname+"_" +lastname, file_type_card, idcard);
            path_idcard += save_idcard.getUrlImage("space", username+"_"+firstname+"_" +lastname, file_type_card);
            if (verify) {
                Member member = new Member(conn);
                member.register(firstname, lastname, username, password, email, phone, type, path_img, path_idcard);
                if (member.getCheckemail().equals("isEmailUnused")) {
                    check = 4;

                } else {
                    check = 8;
                }
            } else {
                check = 16;
            }
            request.setAttribute("check", check);
            RequestDispatcher pg = request.getRequestDispatcher("index.jsp");
            pg.forward(request, response);

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
