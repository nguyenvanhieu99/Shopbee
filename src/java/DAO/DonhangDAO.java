/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.DAO.con;
import Model.Donhang;
import Model.Thanhvien;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author Hiep Le
 */
public class DonhangDAO extends DAO{
    public DonhangDAO()
    {
        super();
    }
    public void addDonhang(Donhang u)
        {         
            String sql = "INSERT INTO Donhang(trangthai,hinhthucgiaohang,hinhthucthanhtoan,diachinguoinhan,sdtKH,idThanhvien,ngaymua) VALUES(?,?,?,?,?,?,?)";
            try{
                PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
                ps.setString(1,u.getTrangthai());
                ps.setString(2, u.getHinhthucgiaohang());
                ps.setString(3, u.getHinhthucthanhtoan());
                ps.setString(4,u.getDiachinguoinhan());
                ps.setString(5,u.getSdtKH());
                ps.setInt(6, u.getThanhvien().getId());
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                ps.setString(7, sdf.format(u.getNgaymua()));               
                ps.executeUpdate();
                ResultSet gk = ps.getGeneratedKeys();
                if(gk.next())
                {
                    u.setId(gk.getInt(1));
                }
            }
            catch(Exception e)
            {
                System.out.println("");
            }
        }
    
    public ArrayList<Donhang> getDsDonhang(int id)
    {
        ArrayList<Donhang> dssp = new ArrayList<Donhang>();
        String sql = "SELECT * from Donhang where idThanhvien = ?";
            try{               
                PreparedStatement ps =con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    Donhang dh = new Donhang();
                    dh.setId(rs.getInt("id"));
                    dh.setTrangthai(rs.getString("trangthai"));
                    dh.setDiachinguoinhan(rs.getString("diachinguoinhan"));
                    dh.setSdtKH(rs.getString("sdtKH"));
                    dh.setHinhthucgiaohang(rs.getString("hinhthucgiaohang"));
                    dh.setHinhthucthanhtoan(rs.getString("hinhthucthanhtoan"));
                    dh.setNgaymua(rs.getDate("ngaymua"));
                    Thanhvien tv = new Thanhvien();
                    tv.setId(rs.getInt("idThanhvien"));
                    dssp.add(dh);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return dssp;
    }
    
}
