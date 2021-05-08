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
public class Phanhoi {
    private int id;
    private String noidung;
    private Date ngayPH;
    private Thanhvien tv;
    private Lienhe lh;

    public Phanhoi() {
    }

    public Phanhoi(String noidung, Date ngayPH, Thanhvien tv, Lienhe lh) {
        this.noidung = noidung;
        this.ngayPH = ngayPH;
        this.tv = tv;
        this.lh = lh;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNoidung() {
        return noidung;
    }

    public void setNoidung(String noidung) {
        this.noidung = noidung;
    }

    public Date getNgayPH() {
        return ngayPH;
    }

    public void setNgayPH(Date ngayPH) {
        this.ngayPH = ngayPH;
    }

    public Thanhvien getTv() {
        return tv;
    }

    public void setTv(Thanhvien tv) {
        this.tv = tv;
    }

    public Lienhe getLh() {
        return lh;
    }

    public void setLh(Lienhe lh) {
        this.lh = lh;
    }
    
    
}
