/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Chitietdonhang;
import Model.Sanpham;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Hiep Le
 */
public class ChitietdonhangDAO extends DAO{
    public ChitietdonhangDAO()
    {
        super();
    }
    
    public void addChitietDH(Chitietdonhang u)
    {
        String sql = "INSERT INTO Chitietdonhang(soluong,idDH,idSP) VALUES(?,?,?)";
            try{
                PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
                ps.setInt(1,u.getSoluong());
                ps.setInt(2,u.getDh().getId());
                ps.setInt(3,u.getSp().getId());
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
    public ArrayList<Chitietdonhang> getDsChitiet(int id)
    {
        ArrayList<Chitietdonhang> dssp = new ArrayList<Chitietdonhang>();
        String sql = "SELECT * from Chitietdonhang where idDH = ?";
            try{               
                PreparedStatement ps =con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    Chitietdonhang sp = new Chitietdonhang();
                    sp.setId(rs.getInt("id"));
                    sp.setSoluong(rs.getInt("soluong"));
                    Sanpham spham = new Sanpham();
                    spham.setId(rs.getInt("idSP"));
                    sp.setSp(spham);                  
                    dssp.add(sp);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return dssp;
    }
}
