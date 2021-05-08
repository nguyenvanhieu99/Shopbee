/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Thanhvien;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Hiep Le
 */
public class ThanhvienDAO extends DAO{
    public ThanhvienDAO()
    {
        super();
    }
    public boolean checkLogin(Thanhvien tv) {
		boolean result = false;
		String sql = "SELECT * FROM Thanhvien WHERE taikhoan = ? AND matkhau = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, tv.getTaikhoan());
			ps.setString(2, tv.getMatkhau());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
                                tv.setEmail(rs.getString("email"));
                                tv.setSdt(rs.getString("sdt"));
                                tv.setTaikhoan(rs.getString("taikhoan"));
				tv.setHoten(rs.getString("ten"));
				tv.setChucvu(rs.getString("chucvu"));
                                tv.setId(rs.getInt("id"));
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
    public boolean Register(Thanhvien tv) {
		boolean result = false;
		String sql = "INSERT INTO thanhvien(ten, sdt, email, chucvu, taikhoan, matkhau, diachi) VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, tv.getHoten());
			ps.setString(2, tv.getSdt());
                        ps.setString(3, tv.getEmail());
                        ps.setString(4, tv.getChucvu());
                        ps.setString(5, tv.getTaikhoan());
                        ps.setString(6, tv.getMatkhau());
                        ps.setString(7, "Ha Noi");
			
                        ps.executeUpdate();
                        result = true;
                ResultSet gk = ps.getGeneratedKeys();
                if(gk.next())
                {
                    
                    tv.setId(gk.getInt(1));
                }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
    
    public ArrayList<Thanhvien> showThanhvien()
        {
            ArrayList<Thanhvien> arr_u = new ArrayList<Thanhvien> ();
            String sql = "SELECT * from Thanhvien";
            try{
                PreparedStatement ps =con.prepareStatement(sql);
                
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    Thanhvien u = new Thanhvien();
                    u.setId(rs.getInt("id"));
                    u.setHoten(rs.getString("ten"));
                    u.setSdt(rs.getString("sdt"));
                    u.setEmail(rs.getString("email"));
                    u.setTaikhoan(rs.getString("taikhoan"));
                    u.setMatkhau(rs.getString("matkhau"));
                    u.setChucvu(rs.getString("chucvu"));
                    arr_u.add(u);
                }
            }
            catch(Exception e)
            {
                System.out.println("ok");
            }
            return arr_u;
        }
    
    public void addThanhvien(Thanhvien u)
        {         
            String sql = "INSERT INTO Thanhvien(taikhoan,matkhau,chucvu) VALUES(?,?,?)";
            try{
                PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
                ps.setString(1,u.getTaikhoan());
                ps.setString(2, u.getMatkhau());
                ps.setString(3, u.getChucvu());
                
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
    
    public boolean UpdateUser(Thanhvien u)
        {
            boolean check = false;
            String sql = "UPDATE Thanhvien SET ten = ?, email = ?, sdt = ?, taikhoan = ?, matkhau = ?,chucvu = ?  WHERE id = ?";
            try{
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1,u.getHoten());
                ps.setString(2,u.getEmail());
                ps.setString(3,u.getSdt());
                ps.setString(4,u.getTaikhoan());
                ps.setString(5,u.getMatkhau());
                ps.setString(6,u.getChucvu());
                ps.setInt(7, u.getId());
                
                ps.executeUpdate();
                check = true;
            }
            catch(Exception e)
            {
                System.out.println("ok");
            }
            return check;
            
        }
    
    public void deleteUser(int id)
        {
            String sql = "DELETE FROM Thanhvien where id = ?";
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
}
