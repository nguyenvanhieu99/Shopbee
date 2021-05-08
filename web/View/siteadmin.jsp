<%-- 
    Document   : siteadmin
    Created on : Dec 10, 2020, 4:48:08 PM
    Author     : Hiep Le
--%>

<%@page import="Model.Sanpham"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Thanhvien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        <%@ include file ="/CSS/site_admin.css" %>
    </style>
</head>
<body>
    <div class="display-container size-header">
        <div class="display-container title-header">
            <a href="#" style="color: #fff;text-decoration: none"><form action="show_Trangchu" method="get">Về trang SHOPPING</form></a>
                
        </div>

        <div class="display-container detail-header">
        
        </div>
    </div>
    <div class="display-container">
        <div class="sidebar display-container">
                <ul>
                    <li><a><form action="show_Siteadmin_quanlyKH" method="get">Quản lý khách hàng</form></a></li>
                    <li><a><form action="show_Siteadmin_quanlySP" method="get">Quản lý sản phẩm</form></a></li>
                    <li><a><form action="show_Siteadmin_TK" method="get">Kiểm tra phản hồi từ khách hàng</form></a></li>
                </ul>
        </div>

        <div class="content display-container">
                <div id="site1">
                        <div class="list-btn display-container">
                                <button style="width: 153px; font-size: 15px" onclick="add_new()">Thêm</button>
                        </div>
                        <div class="list-info-member display-container" id="modul1">					
                                <div>
                                        <h1>DANH SÁCH THÔNG TIN THÀNH VIÊN</h1>
                                        <form action="show_Thanhvien" method="get">
                                            <button type="submit">Hiển thị thành viên</button>
                                        </form>
                                        
                                </div>
                                <table class="table-info" id="tb_info">
                                        <tr>
                                                <th style="width: 6%;display : none">ID</th>
                                                <th style="width: 15%">Tên</th>
                                                <th style="width: 9%">Chức vụ</th>
                                                <th style="width: 14%">Email</th>
                                                <th style="width: 17%">Số điện thoại</th>
                                                <th style="width: 12%">Tài khoản</th>
                                                <th style="width: 12%">Mật khẩu</th>
                                                <th style="width: 15%">Thao tác</th>
                                        </tr>
                                        <%
                                            
                                            if(session.getAttribute("dsThanhvien")!=null)
                                            {
                                                ArrayList<Thanhvien> dstv = (ArrayList<Thanhvien>)session.getAttribute("dsThanhvien");                                                                                                                                 
                                                for(Thanhvien u : dstv)
                                                {
                                        %>
                                        <tr>
                                            <td style="display : none"><%=u.getId()%></td>
                                                <td><%=u.getHoten()%></td>
                                                <td><%=u.getChucvu()%></td>
                                                <td><%=u.getEmail()%></td>
                                                <td><%=u.getSdt()%></td>
                                                <td><%=u.getTaikhoan()%></td>
                                                <td><%=u.getMatkhau()%></td>
                                                <td>
                                                <div>                                                     
                                                    <input id="btn_fix" type="button" value="Sửa" onclick="clickk(this)" >
                                                    <input type="button" value="Xóa" onclick="show_form_delete(this)">
                                                </div>
                                                </td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                                                               
                                </table>
                        </div>
                <div id="modul2" class="modal">

                  <form class="modal-content animate" action="fix_Thanhvien" method="post">
                    <div class="container">
                      
                      <input id = "txt0" type="hidden" name="txt_Id" required>
                      
                      <label for="uname"><b>Họ và Tên</b></label>
                      <input id = "txt1" type="text" name="txt_Ten" required>
                      
                      <label for="uname"><b>Chức vụ</b></label>
                      <input id = "txt2" type="text" name="txt_Chucvu" required>
                      
                      <label for="uname"><b>Email</b></label>
                      <input id = "txt3" type="text" name="txt_Email" required>
                      
                      <label for="uname"><b>Số điện thoại</b></label>
                      <input id = "txt4" type="text" name="txt_Sdt" required>
                      
                      
                      <input id = "txt5" type="hidden" name="txt_Taikhoan" >
                      
                      <label for="psw"><b>Mật khẩu</b></label>
                      <input id = "txt6" type="text" name="txt_Matkhau" required>


                    </div>

                    <div class="container" style="background-color:#f1f1f1">
                        <button type="submit" onclick="document.getElementById('modul2').style.display='none'">Lưu lại</button>
                        <button type="button" onclick="document.getElementById('modul2').style.display='none'" class="cancelbtn">Quay lại</button>
                    </div>
                  </form>
                </div>
                
                <div id="modul_add" class="modal">

                  <form class="modal-content animate" action="add_Thanhvien" method="post">
                    <div class="container">
                      <label for="uname"><b>Tên đăng nhập</b></label>
                      <input id = "txt1" type="text" placeholder="Nhập tài khoản" name="txtTaikhoan" required>
                      <label for="psw"><b>Mật khẩu</b></label>
                      <input id = "txt2" type="text" placeholder="Nhập mật khẩu" name="txtMatkhau" required>
                      <label for="uname"><b>Chức vụ</b></label>
                      <input id = "txt3" type="text" placeholder="Nhập chức vụ" name="txtChucvu" required>
                    </div>

                    <div class="container" style="background-color:#f1f1f1">
                        <button type="submit">Lưu lại</button>
                        <button type="button" onclick="document.getElementById('modul_add').style.display='none'" class="cancelbtn">Quay lại</button>
                    </div>
                  </form>
                </div>                        
                                        
                <div id="modul3">
                    <form class="modal-content animate" action="del_Thanhvien" method="post" style="height:150px;">
                        <div class="container">
                            <input id="del_id" type="hidden" name="txtID">
                            <span>
                                Bạn có muốn xóa người này không?
                            </span>

                        </div>

                        <div class="container" style="background-color:#f1f1f1">
                            <button type="submit" onclick="document.getElementById('modul3').style.display='none'">Xóa</button>
                            <button type="button" onclick="document.getElementById('modul3').style.display='none'" class="cancelbtn">Quay lại</button>
                        </div>
                    </form>   
                </div>
                </div>
                  

                <div class="show-btn2" id="site2">
                        <div class="list-btn display-container">
                                <button style="width: 153px; font-size: 15px" onclick="add_new()">Thêm sản phẩm</button>
                        </div>
                        <div class="list-info-member display-container" id="modul1">					
                                <div>
                                    <h1>DANH SÁCH SẢN PHẨM</h1>
                                    <div style="display : flex">
                                        <form action="show_Sanpham" method="get">
                                            <button type="submit">Hiển thị sản phẩm</button>
                                        </form>
                                        
                                        <div class="dropdown">
                                            <button>Theo giá tiền</button>
                                            <div class="dropdown-content">
                                                <a href="#"><form action="sort_Tangdan" method="get">Tăng dần</form></a>
                                                <a href="#"><form action="sort_Giamdan" method="get">Giảm dần</form></a>
                                            </div>
                                        </div>
                                        
                                        <div class="dropdown">
                                            <button>Theo thể loại</button>
                                            <div class="dropdown-content">
                                                <a href="#"><form action="search_Aokhoacgio" method="get">áo khoác gió</form></a>
                                                <a href="#"><form action="search_Aolen" method="get">áo len</form></a>
                                                <a href="#"><form action="search_Aolongcuu" method="get">áo lông cừu</form></a>
                                                <a href="#"><form action="search_Aophong" method="get">áo phông</form></a>
                                                <a href="#"><form action="search_Aosomi" method="get">áo sơ mi</form></a>
                                                <a href="#"><form action="search_Quanjeans" method="get">quần jeans</form></a>
                                                <a href="#"><form action="search_Quanvai" method="get">quần vải</form></a>
                                                <a href="#"><form action="search_Quankhaki" method="get">quần khaki</form></a>
                                                <a href="#"><form action="seach_Maconha" method="get">đồ mặc ở nhà</form></a>                                              
                                                <a href="#"><form action="search_Docla" method="get">đồ độc lạ</form></a>
                                                <a href="#"><form action="search_Congso" method="get">đồ công sở</form></a>
                                                <a href="#"><form action="search_Dulich" method="get">đồ du lịch</form></a>
                                                <a href="#"><form action="search_Chanvay" method="get">chân váy</form></a>
                                                <a href="#"><form action="search_Phukien" method="get">phụ kiện</form></a>
                                                
                                            </div>
                                        </div>
                                    </div>
                                        
                                                                             
                                <table class="table-info" id="tb_info">
                                        <tr>
                                                <th style="width: 6%;display : none">ID</th>
                                                <th style="width: 20%">Tên sản phẩm</th>
                                                <th style="width: 20%">Giá</th>
                                                <th style="width: 20%">Loại</th>
                                                <th style="width: 20%">Hình ảnh</th>
                                                <th style="width: 20%">Thao tác</th>
                                        </tr>
                                        <%
                                            
                                            if(session.getAttribute("dsSanpham")!=null)
                                            {
                                                ArrayList<Sanpham> dssp = (ArrayList<Sanpham>)session.getAttribute("dsSanpham");                                                                                                                                 
                                                for(Sanpham u : dssp)
                                                {
                                        %>
                                        <tr>
                                            <td style="display : none"><%=u.getId()%></td>
                                                <td><%=u.getTenSP()%></td>
                                                <td><%=u.getGia()%></td>
                                                <td><%=u.getLoaiSP()%></td>
                                                <td><%=u.getLinkHA()%></td>
                                                <td>
                                                <div>                                                     
                                                    <input id="btn_fix" type="button" value="Sửa" onclick="clickk2(this)" >
                                                    <input type="button" value="Xóa" onclick="show_form_delete2(this)">
                                                </div>
                                                </td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                                                               
                                </table>
                        </div>
                </div>

                <div class="show-btn3" id="site3">
                        <div class="list-btn display-container">
                                <button style="width: 153px; font-size: 15px" onclick="add_new()">Thêm sản phẩm</button>
                        </div>
                        <div class="list-info-member display-container" id="modul1">					
                                <div>
                                    <h1>DANH SÁCH HÓA ĐƠN</h1>
                                    <div style="display : flex">                                       
                                        <div class="dropdown">
                                            <button>Theo giá tiền</button>
                                            <div class="dropdown-content">
                                                <a href="#"><form action="sort_Tangdan" method="get">Tăng dần</form></a>
                                                <a href="#"><form action="sort_Giamdan" method="get">Giảm dần</form></a>
                                            </div>
                                        </div>
                                        
                                        <div class="dropdown">
                                            <button>Theo thể loại</button>
                                            <div class="dropdown-content">
                                                <a href="#"><form action="search_Aokhoacgio" method="get">áo khoác gió</form></a>
                                                <a href="#"><form action="search_Aolen" method="get">áo len</form></a>
                                                <a href="#"><form action="search_Aolongcuu" method="get">áo lông cừu</form></a>
                                                <a href="#"><form action="search_Aophong" method="get">áo phông</form></a>
                                                <a href="#"><form action="search_Aosomi" method="get">áo sơ mi</form></a>
                                                <a href="#"><form action="search_Quanjeans" method="get">quần jeans</form></a>
                                                <a href="#"><form action="search_Quanvai" method="get">quần vải</form></a>
                                                <a href="#"><form action="search_Quankhaki" method="get">quần khaki</form></a>
                                                <a href="#"><form action="seach_Maconha" method="get">đồ mặc ở nhà</form></a>                                              
                                                <a href="#"><form action="search_Docla" method="get">đồ độc lạ</form></a>
                                                <a href="#"><form action="search_Congso" method="get">đồ công sở</form></a>
                                                <a href="#"><form action="search_Dulich" method="get">đồ du lịch</form></a>
                                                <a href="#"><form action="search_Chanvay" method="get">chân váy</form></a>
                                                <a href="#"><form action="search_Phukien" method="get">phụ kiện</form></a>
                                                
                                            </div>
                                        </div>
                                    </div>
                                        
                                                                             
                                <table class="table-info" id="tb_info">
                                        <tr>
                                                <th style="width: 6%;display : none">ID</th>
                                                <th style="width: 20%">Tên sản phẩm</th>
                                                <th style="width: 20%">Giá</th>
                                                <th style="width: 20%">Loại</th>
                                                <th style="width: 20%">Hình ảnh</th>
                                                <th style="width: 20%">Thao tác</th>
                                        </tr>
                                        <%
                                            
                                            if(session.getAttribute("dsSanpham")!=null)
                                            {
                                                ArrayList<Sanpham> dssp = (ArrayList<Sanpham>)session.getAttribute("dsSanpham");                                                                                                                                 
                                                for(Sanpham u : dssp)
                                                {
                                        %>
                                        <tr>
                                            <td style="display : none"><%=u.getId()%></td>
                                                <td><%=u.getTenSP()%></td>
                                                <td><%=u.getGia()%></td>
                                                <td><%=u.getLoaiSP()%></td>
                                                <td><%=u.getLinkHA()%></td>
                                                <td>
                                                <div>                                                     
                                                    <input id="btn_fix" type="button" value="Sửa" onclick="clickk2(this)" >
                                                    <input type="button" value="Xóa" onclick="show_form_delete2(this)">
                                                </div>
                                                </td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                                                               
                                </table>
                        </div>
                </div>
        </div>
    </div>

<!--    <script language="javascript">
            function newsiteO()
            {
                    document.getElementById("site3").style.display = "none";
                    document.getElementById("site2").style.display = "none";
                    document.getElementById("site1").style.display = "block";
            }
            function newsiteT()
            {
                    document.getElementById("site1").style.display = "none";
                    document.getElementById("site3").style.display = "none";
                    document.getElementById("site2").style.display = "block";				
            }
            function newsiteTh()
            {
                    document.getElementById("site1").style.display = "none";
                    document.getElementById("site2").style.display = "none";
                    document.getElementById("site3").style.display = "block";
            }

            function show_modul1()
            {
                    document.getElementById("modul3").style.display = "none";
                    document.getElementById("modul2").style.display = "none";
                    document.getElementById("modul1").style.display = "block";
            }
            function show_modul2()
            {

                    document.getElementById("modul3").style.display = "none";
                    document.getElementById("modul2").style.display = "block";
                    
                    document.getElementById("txt1").value = "Lê Sĩ Hiệp";
                    document.getElementById("txt2").value = "20";
                    document.getElementById("txt3").value = "0942215556";
                    document.getElementById("txt4").value = "shounen193@gmail.com";
                    document.getElementById("txt5").value = "admin";
                    document.getElementById("txt6").value = "admin";

            }
            

                
                function clickk(z)
                {
                    document.getElementById("modul3").style.display = "none";
                    document.getElementById("modul2").style.display = "block";
                    
                    var myTab = document.getElementById('tb_info');
                    var vitri = z.closest("tr").rowIndex;
                    
                    var objCells = myTab.rows.item(vitri).cells;

                    for (var j = 0; j < objCells.length-1; j++) {
                        var str = "";
                        str = str + objCells.item(j).innerHTML;
                        var id = "txt";
                        id = id + j;                     
                        document.getElementById(id).value = str;                               
                    }
                                     
                }
                
                function getId(x)
                {
                    var vitri = x.closest('tr').rowIndex;
                    var s = "" + vitri;
                    alert(s);
                }
                
                function show_form_delete(z)
                {                
                   
                    document.getElementById("modul3").style.display = "block";
                    
                    var myTab = document.getElementById('tb_info');
                    var vitri = z.closest("tr").rowIndex;
                    
                    var objCells = myTab.rows.item(vitri).cells;
                    var str = "";
                    
                    str = str + objCells.item(0).innerHTML;

                    
                    document.getElementById("del_id").value = str;
                                  
                }
                
                function add_new()
                {
                    document.getElementById("modul_add").style.display = "block";
                }
                function doi_form()
                {
                    var x = document.getElementsByClassName("tb_02");
                    x[0].style.display ="table-row";
                    x[1].style.display ="table-row";
                }

    </script>-->
</body>
<script src="JS/admin.js">
</script>
<script src="JS/submit_tag_a.js">
</script>
</html>

