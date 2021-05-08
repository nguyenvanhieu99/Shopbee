/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.SanphamDAO;
import Model.Sanpham;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Hiep Le
 */
@WebServlet(name = "add_Sanpham", urlPatterns = {"/add_Sanpham"})
@MultipartConfig
public class add_Sanpham extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String tenSP,giatien,theloai,linkHA;
        tenSP = request.getParameter("txt_TenSP");
        giatien = request.getParameter("txt_Giatien");
        theloai = request.getParameter("txt_Theloai");
        Part filePart = request.getPart("txt_HA");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String s = "F:\\data\\Documents\\NetBeansProjects\\LapTrinhWeb\\web\\img";
        String appPath = s.replace('\\', '/');
        
        Sanpham sp = new Sanpham();
        sp.setTenSP(tenSP);
        sp.setGia(Integer.parseInt(giatien));
        sp.setLoaiSP(theloai);
        sp.setLinkHA("img/" + fileName);
        
        SanphamDAO spd = new SanphamDAO();
        spd.addSanpham(sp);
        BufferedInputStream bis = null;
        FileOutputStream fos = null;       
        try{
            File file = new File(appPath + "\\" + fileName);
            InputStream filez = filePart.getInputStream();
            bis = new BufferedInputStream(filez);
            fos = new FileOutputStream(file);
            BufferedOutputStream bout = new BufferedOutputStream(fos,1024);           
            byte[] data = new byte[1024];
            int read = 0;
            while((read = bis.read(data,0,1024))>=0)
                {
                    bout.write(data, 0, read);                  
                }
                bout.close();
                bis.close();
                fos.close();
               
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        HttpSession ses = request.getSession();
        ArrayList<Sanpham> dssp = new ArrayList<Sanpham>();
        dssp = spd.getDsSanpham();
        ses.setAttribute("dsSanpham", dssp);
        
        RequestDispatcher dis = request.getRequestDispatcher("/View/siteadmin2.jsp");
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
