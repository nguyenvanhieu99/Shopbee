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
public class Chitietdonhang {
    private int id;
    private Donhang dh;
    private Sanpham sp;
    private int soluong;

    public Chitietdonhang() {
    }

    public Chitietdonhang(int id, Donhang dh, Sanpham sp, int soluong) {
        this.id = id;
        this.dh = dh;
        this.sp = sp;
        this.soluong = soluong;
    }
    
    public Donhang getDh() {
        return dh;
    }

    public void setDh(Donhang dh) {
        this.dh = dh;
    }

    public Sanpham getSp() {
        return sp;
    }

    public void setSp(Sanpham sp) {
        this.sp = sp;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
}
