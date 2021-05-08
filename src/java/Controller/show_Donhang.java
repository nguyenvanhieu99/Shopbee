/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ChitietdonhangDAO;
import DAO.DonhangDAO;
import DAO.SanphamDAO;
import Model.Chitietdonhang;
import Model.Thanhvien;
import Model.Donhang;
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
@WebServlet(name = "show_Donhang", urlPatterns = {"/show_Donhang"})
public class show_Donhang extends HttpServlet {

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
            out.println("<title>Servlet show_Donhang</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet show_Donhang at " + request.getContextPath() + "</h1>");
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
        Thanhvien tv = new Thanhvien();
        HttpSession ses = request.getSession();
        tv = (Thanhvien)ses.getAttribute("thanhvien");
        
        //lấy danh sách đơn hàng của thành viên
        ArrayList<Donhang> dsdh = new ArrayList<Donhang>();
        DonhangDAO dhd = new DonhangDAO();
        dsdh = dhd.getDsDonhang(tv.getId());
        
        ChitietdonhangDAO ctdh = new ChitietdonhangDAO();
        
        for(Donhang i : dsdh)
        {
            ArrayList<Chitietdonhang> dsct = new ArrayList<Chitietdonhang>();
            dsct = ctdh.getDsChitiet(i.getId());
            for(Chitietdonhang j : dsct)
            {
                Sanpham spj = new Sanpham();
                SanphamDAO spd = new SanphamDAO();
                spj = spd.searchSanpham(j.getSp().getId());
            }
            i.setDsct(dsct);
        }
        
        ses.setAttribute("DHcuaKH",dsdh);
        RequestDispatcher dis = request.getRequestDispatcher("/View/quanlydonhang.jsp");
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
