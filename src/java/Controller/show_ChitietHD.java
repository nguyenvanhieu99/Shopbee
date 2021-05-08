/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ChitietdonhangDAO;
import DAO.SanphamDAO;
import Model.Chitietdonhang;
import Model.Sanpham;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "show_ChitietHD", urlPatterns = {"/show_ChitietHD"})
public class show_ChitietHD extends HttpServlet {

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
            out.println("<title>Servlet show_ChitietHD</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet show_ChitietHD at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("txtID");
        int idDH = Integer.parseInt(id);
        
        HttpSession ses = request.getSession();
        Chitietdonhang ctdh;
        ArrayList<Chitietdonhang> dsct = new ArrayList<Chitietdonhang>();
        
        ChitietdonhangDAO dao = new ChitietdonhangDAO();
        dsct = dao.getDsChitiet(idDH);
        
        SanphamDAO spd = new SanphamDAO();
        for(Chitietdonhang i : dsct)
        {
            Sanpham sp = new Sanpham();
            sp = spd.searchSanpham(i.getSp().getId());
            i.getSp().setTenSP(sp.getTenSP());
            i.getSp().setGia(sp.getGia());
        }
        
        ses.setAttribute("chitiet", dsct);
        RequestDispatcher dis = request.getRequestDispatcher("/View/chitietdonhang.jsp");
        dis.forward(request, response);
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
