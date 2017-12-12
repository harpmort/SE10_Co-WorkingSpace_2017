/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Member;
import model.Message;

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
            if (verify) {
                Member member = new Member(conn);
                member.register(firstname, lastname, username, password, email, phone, type, path_img, path_card);
                if (type == 1 && idcard != null && !idcard.equals("")) {
                    DateFormat dateFormat_date = new SimpleDateFormat("dd/MM/yyyy");
                    DateFormat dateFormat_time = new SimpleDateFormat("HH:mm");
                    Date date = new Date();
                    Message message = new Message();
                    message.setDate(dateFormat_date.format(date));
                    message.setTime(dateFormat_time.format(date));
                    message.setSender(username);
                    message.setReceiver("admin");
                    message.setMessage("รอการยืนยันจาก Admin: " +username + " ได้ทำการสมัครสมาชิกและส่ง Id card แล้ว");
                    member.sentMessage(message);
                }
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
