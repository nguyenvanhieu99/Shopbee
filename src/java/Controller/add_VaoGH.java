/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.SanphamDAO;
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
@WebServlet(name = "add_VaoGH", urlPatterns = {"/add_VaoGH"})
public class add_VaoGH extends HttpServlet {

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
            out.println("<title>Servlet add_VaoGH</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet add_VaoGH at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("txtID");
        int idSP = Integer.parseInt(id);
        SanphamDAO spd = new SanphamDAO();
        Sanpham sp = new Sanpham();
        sp = spd.searchSanpham(idSP);
        ArrayList<Sanpham> dssp = new ArrayList<Sanpham>();
        HttpSession ses = request.getSession();
        if(ses.getAttribute("giohang")!=null)
        {
            dssp = (ArrayList<Sanpham>)ses.getAttribute("giohang");
            ses.removeAttribute("giohang");
        }       
        dssp.add(sp);
        ses.setAttribute("giohang", dssp);
        
        if(sp.getLoaiSP().equals("áo phông"))
        {
            response.sendRedirect("show_Aophong");
        }
        else if(sp.getLoaiSP().equals("chân váy"))
        {
            response.sendRedirect("show_Chanvay");
        }
        else if(sp.getLoaiSP().equals("phụ kiện"))
        {
            response.sendRedirect("show_Phukien");
        }
        else if(sp.getLoaiSP().equals("áo khoác"))
        {
            response.sendRedirect("show_Aokhoacgio");
        }
        else if(sp.getLoaiSP().equals("quần jeans"))
        {
            response.sendRedirect("show_Quanjeans");
        }
        else if(sp.getLoaiSP().equals("áo len"))
        {
            response.sendRedirect("show_Aolen");
        }
        else if(sp.getLoaiSP().equals("áo lông cừu"))
        {
            response.sendRedirect("show_Aolongcuu");
        }
        else if(sp.getLoaiSP().equals("mặc ở nhà"))
        {
            response.sendRedirect("show_Maconha");
        }
        else if(sp.getLoaiSP().equals("quần vải"))
        {
            response.sendRedirect("show_Quanvai");
        }
        else if(sp.getLoaiSP().equals("áo sơ mi"))
        {
            response.sendRedirect("show_Somi");
        }
       
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
