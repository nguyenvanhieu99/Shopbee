/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.DAO.con;
import Model.Donhang;
import Model.Lienhe;
import Model.Thanhvien;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author Hiep Le
 */
public class LienheDAO extends DAO{
    public LienheDAO()
    {
        super();
    }
    
    public void addLienhe(Lienhe u)
    {
        String sql = "INSERT INTO Lienhe(hoten,ngayphanhoi,tieude,noidung,idThanhvien,trangthai) VALUES(?,?,?,?,?,?)";
            try{
                PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
                ps.setString(1,u.getHoten());
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                ps.setString(2, sdf.format(u.getNgayLH()));
                ps.setString(3, u.getTieude());
                ps.setString(4,u.getNoidung());
                ps.setInt(5, u.getTv().getId());
                ps.setString(6,"chưa phản hồi");
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
    
    public ArrayList<Lienhe> getDsLienhe(int id)
    {
        ArrayList<Lienhe> dssp = new ArrayList<Lienhe>();
        String sql = "SELECT * from Lienhe where idThanhvien = ?";
            try{               
                PreparedStatement ps =con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    Lienhe lh = new Lienhe();
                    lh.setId(rs.getInt("id"));
                    lh.setHoten(rs.getString("hoten"));
                    lh.setNgayLH(rs.getDate("ngayphanhoi"));
                    lh.setTieude(rs.getString("tieude"));
                    lh.setNoidung(rs.getString("noidung"));
                    lh.setTrangthai(rs.getString("trangthai"));
                    Thanhvien tv = new Thanhvien();                   
                    tv.setId(rs.getInt("idThanhvien"));
                    dssp.add(lh);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return dssp;
    }
    
    public Lienhe getLienhe(int id)
    {
        Lienhe lh = new Lienhe();
        String sql = "SELECT * from Lienhe where id = ?";
            try{               
                PreparedStatement ps =con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {                    
                    lh.setId(rs.getInt("id"));
                    lh.setHoten(rs.getString("hoten"));
                    lh.setNgayLH(rs.getDate("ngayphanhoi"));
                    lh.setTieude(rs.getString("tieude"));
                    lh.setNoidung(rs.getString("noidung"));
                    lh.setTrangthai(rs.getString("trangthai"));
                    Thanhvien tv = new Thanhvien();                   
                    tv.setId(rs.getInt("idThanhvien"));                  
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return lh;
    }
    
    public void UpdateTrangthai(Lienhe lh)
        {
            
            String sql = "UPDATE Lienhe SET trangthai = ?  WHERE id = ?";
            try{
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1,"đã phản hồi");
                ps.setInt(2, lh.getId());                            
                ps.executeUpdate();
                
            }
            catch(Exception e)
            {
                System.out.println("ok");
            }
           
            
        }
}
