/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ThanhvienDAO;
import Model.Thanhvien;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author Hiep Le
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
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
        String tk = request.getParameter("taikhoan");
        String mk = request.getParameter("matkhau");

        String matkhau = DigestUtils.md5Hex(mk);
        
        Thanhvien tv = new Thanhvien();
        tv.setTaikhoan(tk);
        tv.setMatkhau(mk);
        ThanhvienDAO tvd = new ThanhvienDAO();
        
        boolean check;
        check = tvd.checkLogin(tv);
        HttpSession ses = request.getSession();
        ses.setAttribute("ten", matkhau);
        if(check)
        {
            Cookie cookie1 = new Cookie("tk",tk);
            Cookie cookie2 = new Cookie("mk",matkhau);
            cookie1.setMaxAge(60*60*24);
            cookie2.setMaxAge(60*60*24);
            response.addCookie(cookie1);
            response.addCookie(cookie2);
            
            ses.setAttribute("thanhvien", tv);
            
            RequestDispatcher dis = request.getRequestDispatcher("/View/trangchu.jsp");
            dis.forward(request, response);
        }
        else
        {
            RequestDispatcher dis = request.getRequestDispatcher("/View/dangki.jsp");
            dis.forward(request, response);
        }
        
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
