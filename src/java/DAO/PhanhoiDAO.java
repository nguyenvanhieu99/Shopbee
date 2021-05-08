/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.DAO.con;
import Model.Lienhe;
import Model.Phanhoi;
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
public class PhanhoiDAO extends DAO{
    public PhanhoiDAO()
    {
        super();
    }
    
    public void addPhanhoi(Phanhoi u)
    {
        String sql = "INSERT INTO Phanhoi(ngayphanhoi,noidung,idThanhvien,idLienhe) VALUES(?,?,?,?)";
            try{
                PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
                
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                ps.setString(1, sdf.format(u.getNgayPH()));
                ps.setString(2, u.getNoidung());
                ps.setInt(3,u.getTv().getId());
                ps.setInt(4, u.getLh().getId());
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
    
    public ArrayList<Phanhoi> getDsPhanhoi(int id)
    {
        ArrayList<Phanhoi> dssp = new ArrayList<Phanhoi>();
        String sql = "SELECT * from Phanhoi where idThanhvien = ?";
            try{               
                PreparedStatement ps =con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    Phanhoi ph = new Phanhoi();
                    ph.setId(rs.getInt("id"));
                    ph.setNgayPH(rs.getDate("ngayphanhoi"));
                    ph.setNoidung(rs.getString("noidung"));
                    Thanhvien tv = new Thanhvien();                   
                    tv.setId(rs.getInt("idThanhvien"));
                    ph.setTv(tv);
                    Lienhe lh = new Lienhe();
                    lh.setId(rs.getInt("idLienhe"));
                    ph.setLh(lh);
                    dssp.add(ph);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return dssp;
    }
}
