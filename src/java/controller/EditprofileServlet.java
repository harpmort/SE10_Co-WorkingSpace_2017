/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Lessor;
import model.Member;
import model.Rental;
import model.Space;

/**
 *
 * @author Asus
 */
@WebServlet(name = "EditprofileServlet", urlPatterns = {"/EditprofileServlet"})
public class EditprofileServlet extends HttpServlet {

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
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String img = request.getParameter("profileimg");
            String idcard = request.getParameter("idcardimg");
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            HttpSession session = request.getSession();
            Member member = (Member) session.getAttribute("member");
            String username = member.getUsername();
            String password = member.getPassword();
            PictureManager save = new PictureManager();
            int count;
            String filetype_revert;
            int count_revert;
            String file_type;
            String path_img = "";
            if (img != null && !img.equals("")) {
                String[] path_i = img.split("");
                count = path_i.length;
                filetype_revert = "";
                for (int j = 0; count - 1 >= j; count--) {
                    if (!path_i[count - 1].equals(".")) {
                        filetype_revert += path_i[count - 1];
                    } else if (path_i[count - 1].equals(".")) {
                        break;
                    }
                }

                count_revert = filetype_revert.length();
                file_type = "";

                for (int k = 0; count_revert - 1 >= k; count_revert--) {
                    file_type += filetype_revert.charAt(count_revert - 1);
                }
                save.savePicture("space", "profileimg" + username, file_type, img);
                path_img += save.getUrlImage("space", "profileimg" + username, file_type);
            }
            String path_card = "";
            if (idcard != null && !idcard.equals("")) {

                String[] path_c = idcard.split("");
                count = path_c.length;
                filetype_revert = "";

                for (int j = 0; count - 1 >= j; count--) {
                    if (!path_c[count - 1].equals(".")) {
                        filetype_revert += path_c[count - 1];
                    } else if (path_c[count - 1].equals(".")) {
                        break;
                    }
                }

                count_revert = filetype_revert.length();
                file_type = "";

                for (int k = 0; count_revert - 1 >= k; count_revert--) {
                    file_type += filetype_revert.charAt(count_revert - 1);
                }
                save.savePicture("space", "idcardimg" + username, file_type, idcard);
                path_card += save.getUrlImage("space", "idcardimg" + username, file_type);
            }
            Member edit_member = new Member(conn);
            edit_member.editProfile(firstname, lastname, email, phone, path_img, path_card, username);
            if (member.getType() == 2) {
                Rental rental = new Rental(conn);
                rental.importData(username, password);
                session.setAttribute("member", rental);
            } else if (member.getType() == 1) {
                Lessor lessor = new Lessor(conn);
                lessor.importData(username, password);
                session.setAttribute("member", lessor);
            }
            RequestDispatcher pg = request.getRequestDispatcher("Profile.jsp");
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
