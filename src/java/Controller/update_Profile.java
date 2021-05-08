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
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author Hiep Le
 */
@WebServlet(name = "update_Profile", urlPatterns = {"/update_Profile"})
public class update_Profile extends HttpServlet {

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
            out.println("<title>Servlet update_Profile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet update_Profile at " + request.getContextPath() + "</h1>");
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
        
        //lấy giá trị từ front-end
        Thanhvien tv = new Thanhvien();
        String hoten,chucvu,email,sdt,taikhoan,matkhau1;
        String id = request.getParameter("txt_Id");
        hoten = request.getParameter("txt_Ten");
        email = request.getParameter("txt_Email");
        sdt = request.getParameter("txt_Sdt");
        taikhoan = request.getParameter("txt_Taikhoan");
        matkhau1 = request.getParameter("txt_Matkhau");
        chucvu = request.getParameter("txt_Chucvu");
        
        String matkhau = DigestUtils.md5Hex(matkhau1);
        //set giá trị cho user
        tv.setId(Integer.parseInt(id));
        tv.setHoten(hoten);
        tv.setChucvu(chucvu);
        tv.setTaikhoan(taikhoan);
        tv.setMatkhau(matkhau);
        tv.setEmail(email);
        tv.setSdt(sdt);      
        //update giá trị vào CSDL
        ThanhvienDAO tvd = new ThanhvienDAO();
        boolean check;
        check = tvd.UpdateUser(tv);       
        if(check)
        {
            ArrayList<Thanhvien> dstv = new ArrayList<Thanhvien>();
            dstv = tvd.showThanhvien();

            HttpSession ses = request.getSession();
            ses.removeAttribute("dsThanhvien");
            ses.setAttribute("dsThanhvien", dstv);
            
            RequestDispatcher dis = request.getRequestDispatcher("/View/trangcanhan.jsp");
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
