/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ChitietdonhangDAO;
import DAO.DonhangDAO;
import DAO.ThanhvienDAO;
import Model.Chitietdonhang;
import Model.Donhang;
import Model.Sanpham;
import Model.Thanhvien;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.StringTokenizer;
import javafx.util.Pair;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hiep Le
 */
@WebServlet(name = "thanhtoan", urlPatterns = {"/thanhtoan"})
@MultipartConfig
public class thanhtoan extends HttpServlet {

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
            out.println("<title>Servlet thanhtoan</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet thanhtoan at " + request.getContextPath() + "</h1>");
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
        
        //lấy các trường dữ liệu
        String diachi = request.getParameter("txt_Diachi");
        String sdt = request.getParameter("txt_soDT");
        String HTTT = request.getParameter("txt_HTTT");
        String HTGH = request.getParameter("txt_HTGH");
        Pair<Integer, Integer> pair;
        ArrayList< Pair<Integer, Integer> > ds = new ArrayList< Pair<Integer, Integer> > ();
        String str = ""; 
        str = request.getParameter("hoadon");
        
        //lấy chuỗi sản phẩm + số lượng
        StringTokenizer stk = new StringTokenizer(str,",.");
        while(stk.hasMoreTokens())
        {
            String s1 = stk.nextToken();
            String s2 = stk.nextToken();
            int id = Integer.parseInt(s1);
            int solan = Integer.parseInt(s2);               
            pair = new Pair(id,solan);
            ds.add(pair);
        }
        
        //lấy id thành viên đang mua hàng
        HttpSession ses = request.getSession();
        Thanhvien tv = new Thanhvien();      
//        String idKH = request.getParameter("txtIDKH");
//        int idkh = Integer.parseInt(idKH);

        //Tạo mới đơn hàng
        Donhang dh = new Donhang();
        tv = (Thanhvien) ses.getAttribute("thanhvien");
        dh.setThanhvien(tv);
        dh.setTrangthai("chưa giao hàng");
        dh.setSdtKH(sdt);
        dh.setDiachinguoinhan(diachi);
        dh.setHinhthucgiaohang(HTGH);
        dh.setHinhthucthanhtoan(HTTT);
        Date date = new Date();
        dh.setNgaymua(date);
        
        //thêm đơn hàng
        DonhangDAO dhd = new DonhangDAO();
        dhd.addDonhang(dh);
        
        //tạo mới và thêm các chi tiết đơn hàng
        Chitietdonhang ctdh = new Chitietdonhang();
        ChitietdonhangDAO ctd = new ChitietdonhangDAO();
        ctdh.setDh(dh);
        for(Pair<Integer,Integer> i : ds)
        {
            Sanpham sp = new Sanpham();
            sp.setId(i.getKey());
            ctdh.setSoluong(i.getValue());
            ctdh.setSp(sp);
            ctd.addChitietDH(ctdh);          
        }
        
        response.sendRedirect("show_Trangchu");
        
        
        
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
