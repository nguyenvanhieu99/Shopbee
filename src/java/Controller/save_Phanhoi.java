/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.LienheDAO;
import DAO.PhanhoiDAO;
import Model.Lienhe;
import Model.Phanhoi;
import Model.Thanhvien;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hiep Le
 */
@WebServlet(name = "save_Phanhoi", urlPatterns = {"/save_Phanhoi"})
public class save_Phanhoi extends HttpServlet {

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
            out.println("<title>Servlet save_Phanhoi</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet save_Phanhoi at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession ses = request.getSession();
        Thanhvien tv = new Thanhvien();
        tv = (Thanhvien)ses.getAttribute("thanhvien");
        String noidung = request.getParameter("txt_ND");
        String id = request.getParameter("txt_ID");
        int idlh = Integer.parseInt(id);
        Lienhe lh = new Lienhe();
        LienheDAO lhd = new LienheDAO();
        lh = lhd.getLienhe(idlh);
        Phanhoi ph = new Phanhoi();
        
        Date date = new Date();
        ph.setNgayPH(date);
        ph.setNoidung(noidung);     
        ph.setTv(tv);
        ph.setLh(lh);
        PhanhoiDAO phd = new PhanhoiDAO();
        phd.addPhanhoi(ph);
        lhd.UpdateTrangthai(lh);
        
        response.sendRedirect("show_Siteadmin_TK");
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
