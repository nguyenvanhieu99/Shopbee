/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Date;

/**
 *
 * @author Hiep Le
 */
public class Lienhe {
    private int id;
    private Date ngayLH;
    private String tieude;
    private String noidung;
    private Thanhvien tv;
    private String hoten;
    private String trangthai;
    
    public Lienhe() {
    }

    public Lienhe(Date ngayLH, String tieude, String noidung, Thanhvien tv) {
        this.ngayLH = ngayLH;
        this.tieude = tieude;
        this.noidung = noidung;
        this.tv = tv;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }
    
    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgayLH() {
        return ngayLH;
    }

    public void setNgayLH(Date ngayLH) {
        this.ngayLH = ngayLH;
    }

    public String getTieude() {
        return tieude;
    }

    public void setTieude(String tieude) {
        this.tieude = tieude;
    }

    public String getNoidung() {
        return noidung;
    }

    public void setNoidung(String noidung) {
        this.noidung = noidung;
    }

    public Thanhvien getTv() {
        return tv;
    }

    public void setTv(Thanhvien tv) {
        this.tv = tv;
    }
    
    
}
