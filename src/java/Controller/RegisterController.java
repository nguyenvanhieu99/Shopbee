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
 * @author ASUS
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterForm</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterForm at " + request.getContextPath() + "</h1>");
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
        String name = request.getParameter("create-name");
        String email = request.getParameter("create-email");
        String phone = request.getParameter("create-phone");
        String tk = request.getParameter("create-account");
        String mk = request.getParameter("create-pass");
        String remk = request.getParameter("create-repass");
        
        Thanhvien tv = new Thanhvien();
        tv.setTaikhoan(tk);
        tv.setMatkhau(mk);
        tv.setEmail(email);
        tv.setSdt(phone);
        tv.setHoten(name);
        tv.setChucvu("user");
        ThanhvienDAO tvd = new ThanhvienDAO();
        
        boolean check;
        check = tvd.Register(tv);
        HttpSession ses = request.getSession();
        ses.setAttribute("ten", mk);
        if(check)
        {
            Cookie cookie1 = new Cookie("tk",tk);
            Cookie cookie2 = new Cookie("mk",mk);
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
