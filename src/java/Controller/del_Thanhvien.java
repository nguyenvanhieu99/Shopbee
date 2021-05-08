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
@WebServlet(name = "del_Thanhvien", urlPatterns = {"/del_Thanhvien"})
public class del_Thanhvien extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("txtID");       
        int id_tv = Integer.parseInt(id);
        
        ThanhvienDAO tvd = new ThanhvienDAO();
        tvd.deleteUser(id_tv);
        
        ArrayList<Thanhvien> dstv = new ArrayList<Thanhvien>();
        dstv = tvd.showThanhvien();
        
        HttpSession ses = request.getSession();
        ses.removeAttribute("dsThanhvien");
        ses.setAttribute("dsThanhvien", dstv);
        
        RequestDispatcher dis = request.getRequestDispatcher("/View/siteadmin.jsp");
        dis.forward(request, response);
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
