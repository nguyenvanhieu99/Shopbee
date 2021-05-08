/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.SanphamDAO;
import DAO.ThanhvienDAO;
import Model.Sanpham;
import Model.Thanhvien;
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
@WebServlet(name = "show_Siteadmin", urlPatterns = {"/show_Siteadmin"})
public class show_Siteadmin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        if(ses.getAttribute("thanhvien")!=null)
        {
            Thanhvien tv = new Thanhvien();
            tv = (Thanhvien)ses.getAttribute("thanhvien");
            if(!tv.getChucvu().equals("user"))
            {
                ArrayList<Thanhvien> dstv = new ArrayList<Thanhvien>();
                ThanhvienDAO tvd = new ThanhvienDAO();
                dstv = tvd.showThanhvien();    
                ses.setAttribute("dsThanhvien", dstv);   
                RequestDispatcher dis = request.getRequestDispatcher("/View/siteadmin.jsp");
                dis.forward(request, response);
            }
            else
            {
                RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
                dis.forward(request, response);
            }
        }
        else
        {
            RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
            dis.forward(request, response);
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
