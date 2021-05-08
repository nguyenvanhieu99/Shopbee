/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DAO.LienheDAO;
import java.util.ArrayList;
import java.util.Date;
import java.util.StringTokenizer;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author Hiep Le
 */
public class test {
    public static void main(String[] args) {
        //String rs = DigestUtils.sha256Hex(s);
        String rs = DigestUtils.md5Hex("admin");
        System.out.println(rs);
        
        String str = "1,2.3,4.5,6";
        StringTokenizer stk = new StringTokenizer(str,",.");
        while(stk.hasMoreTokens())
        {
            System.out.println(stk.nextToken());
            
        }
        
        Date date = new Date();
        System.out.println(date);
        
        Lienhe lh = new Lienhe();
        ArrayList<Lienhe> dslh = new ArrayList<Lienhe>();
        LienheDAO lhd = new LienheDAO();
        dslh = lhd.getDsLienhe(1);
        
        for(Lienhe i : dslh)
        {
            System.out.println(i.getTrangthai());
        }
        
    }
}
