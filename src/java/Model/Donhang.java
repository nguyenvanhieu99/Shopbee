/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.Date;
import javafx.util.Pair;

/**
 *
 * @author Hiep Le
 */
public class Donhang {
    private int id;
    private Date ngaymua;
    private String trangthai;
    private String hinhthucgiaohang;
    private String hinhthucthanhtoan;
    private String diachinguoinhan;
    private String sdtKH;
    private Thanhvien Thanhvien;
    private ArrayList<Chitietdonhang> dsct;

    public Donhang(Date ngaymua, String trangthai, String hinhthucgiaohang, String hinhthucthanhtoan, String diachinguoinhan, String sdtKH) {
        this.ngaymua = ngaymua;
        this.trangthai = trangthai;
        this.hinhthucgiaohang = hinhthucgiaohang;
        this.hinhthucthanhtoan = hinhthucthanhtoan;
        this.diachinguoinhan = diachinguoinhan;
        this.sdtKH = sdtKH;
    }



    public Donhang() {
    }

    public Thanhvien getThanhvien() {
        return Thanhvien;
    }

    public ArrayList<Chitietdonhang> getDsct() {
        return dsct;
    }

    public void setDsct(ArrayList<Chitietdonhang> dsct) {
        this.dsct = dsct;
    }
    
    public void setThanhvien(Thanhvien Thanhvien) {
        this.Thanhvien = Thanhvien;
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgaymua() {
        return ngaymua;
    }

    public void setNgaymua(Date ngaymua) {
        this.ngaymua = ngaymua;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }

    public String getHinhthucgiaohang() {
        return hinhthucgiaohang;
    }

    public void setHinhthucgiaohang(String hinhthucgiaohang) {
        this.hinhthucgiaohang = hinhthucgiaohang;
    }

    public String getHinhthucthanhtoan() {
        return hinhthucthanhtoan;
    }

    public void setHinhthucthanhtoan(String hinhthucthanhtoan) {
        this.hinhthucthanhtoan = hinhthucthanhtoan;
    }

    public String getDiachinguoinhan() {
        return diachinguoinhan;
    }

    public void setDiachinguoinhan(String diachinguoinhan) {
        this.diachinguoinhan = diachinguoinhan;
    }

    public String getSdtKH() {
        return sdtKH;
    }

    public void setSdtKH(String sdtKH) {
        this.sdtKH = sdtKH;
    }
    
    
}
