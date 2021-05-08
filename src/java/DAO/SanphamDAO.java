/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.DAO.con;
import Model.Sanpham;
import Model.Thanhvien;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Hiep Le
 */
public class SanphamDAO extends DAO {
    public SanphamDAO()
    {
        super();
    }
    
    public ArrayList<Sanpham> getDsSanpham()
    {
        ArrayList<Sanpham> dssp = new ArrayList<Sanpham>();
        String sql = "SELECT * from Sanpham";
            try{
                
                PreparedStatement ps =con.prepareStatement(sql);               
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    Sanpham sp = new Sanpham();
                    sp.setId(rs.getInt("id"));
                    sp.setTenSP(rs.getString("tenSP"));
                    sp.setLoaiSP(rs.getString("theloai"));
                    sp.setLinkHA(rs.getString("linkHA"));
                    sp.setGia(rs.getInt("gia"));
                    
                    dssp.add(sp);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return dssp;
    }
    public void addSanpham(Sanpham u)
        {         
            String sql = "INSERT INTO Sanpham(tenSP,gia,theloai,linkHA) VALUES(?,?,?,?)";
            try{
                PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
                ps.setString(1,u.getTenSP());
                ps.setInt(2, u.getGia());
                ps.setString(3, u.getLoaiSP());
                ps.setString(4,u.getLinkHA());
                
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
    public void deleteSanpham(int id)
        {
            String sql = "DELETE FROM Sanpham where id = ?";
            try{
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1,id);
                
                ps.executeUpdate();
            }
            catch(Exception e)
            {
                System.out.println("ok");
            }
        }
    
    public ArrayList<Sanpham> searchSanpham(String theloai)
    {
        ArrayList<Sanpham> dssp = new ArrayList<Sanpham>();
        String sql = "SELECT * from Sanpham where theloai = ?";
            try{
                
                PreparedStatement ps =con.prepareStatement(sql);
                ps.setString(1,theloai);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    Sanpham sp = new Sanpham();
                    sp.setId(rs.getInt("id"));
                    sp.setTenSP(rs.getString("tenSP"));
                    sp.setLoaiSP(rs.getString("theloai"));
                    sp.setLinkHA(rs.getString("linkHA"));
                    sp.setGia(rs.getInt("gia"));
                    System.out.println(sp.getId() +  " " + sp.getTenSP());
                    dssp.add(sp);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return dssp;
    }
    
    public Sanpham searchSanpham(int id)
    {
        Sanpham sp = new Sanpham();
        String sql = "SELECT * from Sanpham where id = ?";
            try{
                
                PreparedStatement ps =con.prepareStatement(sql);
                ps.setInt(1,id);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {                   
                    sp.setId(rs.getInt("id"));
                    sp.setTenSP(rs.getString("tenSP"));
                    sp.setLoaiSP(rs.getString("theloai"));
                    sp.setLinkHA(rs.getString("linkHA"));
                    sp.setGia(rs.getInt("gia"));                   
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return sp;
    }
}
