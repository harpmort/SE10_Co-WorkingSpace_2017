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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Space;

/**
 *
 * @author Asus
 */
@WebServlet(name = "AddspaceServlet", urlPatterns = {"/AddspaceServlet"})
@MultipartConfig(location = "C:/Users/Asus/Documents/NetBeansProjects/CoWorkingSpace/web/img", maxFileSize = 16177215)
public class AddspaceServlet extends HttpServlet {

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
            String name = request.getParameter("name");
            String location = request.getParameter("location");
            String amountdesk = request.getParameter("amountdesk");
            String people = request.getParameter("people");
            String roomsize = request.getParameter("roomsize");
            String typedesk = request.getParameter("typedesk");
            String typeroom = request.getParameter("typeroom");
            String open = request.getParameter("open");
            String close = request.getParameter("close");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String img[] = request.getParameterValues("img");
            PictureManager save_img = new PictureManager();
                String path_img = "";
            if (!img[0].equals("")) {
                int count = img.length;
                for (int i = 0; i < count; i++) {
                    System.out.println("count loop : "+ count);
                    System.out.println("path_img be if: "+path_img);
                    
                    String[] path = img[i].split("");
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

                    save_img.savePicture("space", name+"_" + (i), file_type, img[i]);
                    path_img += save_img.getUrlImage("space", name+"_" + (i), file_type);
                    System.out.println("path_img af if af path: " + path_img);
                    if (i >= 0 && i != count-1) {
                        path_img += ",";
                        System.out.println("path_img in if: "+path_img);
                        
                    }
                }
            }
            System.out.println("pi:"+path_img);
            
            
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            HttpSession session = request.getSession();
            Space new_space = new Space(conn);
            new_space.addSpace(name,location,typeroom,typedesk,amountdesk,amountdesk,description,roomsize,open,close,people,price,path_img,username);
            
            RequestDispatcher pg = request.getRequestDispatcher("insertcws.jsp");
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
