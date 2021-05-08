/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Hiep Le
 */
public class Sanpham {
    private int id;
    private String tenSP;
    private int gia;
    private String loaiSP;
    private String linkHA;

    public Sanpham() {
    }
    
    
    public Sanpham(String tenSP, int gia, String loaiSP, String linkHA) {
        this.tenSP = tenSP;
        this.gia = gia;
        this.loaiSP = loaiSP;
        this.linkHA = linkHA;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public String getLoaiSP() {
        return loaiSP;
    }

    public void setLoaiSP(String loaiSP) {
        this.loaiSP = loaiSP;
    }

    public String getLinkHA() {
        return linkHA;
    }

    public void setLinkHA(String linkHA) {
        this.linkHA = linkHA;
    }
    
    
}
