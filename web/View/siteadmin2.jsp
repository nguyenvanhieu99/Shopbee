<%-- 
    Document   : siteadmin2
    Created on : Dec 11, 2020, 2:47:41 AM
    Author     : Hiep Le
--%>

<%@page import="Model.Sanpham"%>
<%@page import="java.util.ArrayList"%>
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
                <div id="site2">
                        <div class="list-btn display-container">
                                <button style="width: 153px; font-size: 15px" onclick="add_new()">Thêm sản phẩm</button>
                        </div>
                        <div class="list-info-member display-container" id="modul1">					
                                <div>
                                    <h1>DANH SÁCH SẢN PHẨM</h1>
                                    <div style="display : flex">
                                        <form action="show_Siteadmin_quanlySP   " method="get">
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
                                                <a href="#"><form action="search_Sanphamtheoloai" method="get">áo khoác gió<input type="hidden" value="áo khoác" name="txtTheloai"></form></a>
                                                <a href="#"><form action="search_Sanphamtheoloai" method="get">áo len<input type="hidden" value="áo len" name="txtTheloai"></form></a>
                                                <a href="#"><form action="search_Sanphamtheoloai" method="get">áo phông<input type="hidden" value="áo phông" name="txtTheloai"></form></a>
                                                <a href="#"><form action="search_Sanphamtheoloai" method="get">áo sơ mi<input type="hidden" value="áo sơ mi" name="txtTheloai"></form></a>
                                                <a href="#"><form action="search_Sanphamtheoloai" method="get">quần jeans<input type="hidden" value="quần jeans" name="txtTheloai"></form></a>
                                                <a href="#"><form action="search_Sanphamtheoloai" method="get">quần vải<input type="hidden" value="quần vải" name="txtTheloai"></form></a>
                                                <a href="#"><form action="search_Sanphamtheoloai" method="get">quần khaki<input type="hidden" value="quần khaki" name="txtTheloai"></form></a>
                                                <a href="#"><form action="search_Sanphamtheoloai" method="get">đồ mặc ở nhà<input type="hidden" value="mặc ở nhà" name="txtTheloai"></form></a>
                                                <a href="#"><form action="search_Sanphamtheoloai" method="get">đồ độc lạ<input type="hidden" value="độc lạ" name="txtTheloai"></form></a>
                                                <a href="#"><form action="search_Sanphamtheoloai" method="get">đồ công sở<input type="hidden" value="công sở" name="txtTheloai"></form></a>
                                                <a href="#"><form action="search_Sanphamtheoloai" method="get">đồ du lịch<input type="hidden" value="du lịch" name="txtTheloai"></form></a>
                                                <a href="#"><form action="search_Sanphamtheoloai" method="get">chân váy<input type="hidden" value="chân váy" name="txtTheloai"></form></a>
                                                <a href="#"><form action="search_Sanphamtheoloai" method="get">phụ kiện<input type="hidden" value="phụ kiện" name="txtTheloai"></form></a>
<!--                                            <a href="#"><form action="search_Aolen" method="get">áo len</form></a>
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
                                                <a href="#"><form action="search_Phukien" method="get">phụ kiện</form></a>-->
                                                
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
                                                    <input id="btn_fix" type="button" value="Sửa" onclick="show_Sanpham(this)" >
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
                                        
                <div id="about-product" class="modal"> 
                    <form class="modal-content animate" action="fix_Sanpham" method="post" enctype="multipart/form-data">
                      <div class="container">
                          <div class="display-container" style="width: 100%">
                                  <div class="form-img">
                                      <img src="anh1.png" style="width: 80%; margin: 0 auto;" id="anhSP">
                                      <input type="file" name="txt_HA">
                                  </div>

                                  <div class="form-info">
                                        <input id = "txt0" type="hidden" name="txt_Id" required>
                                        <label for="uname"><b>Tên sản phẩm</b></label>
                                        <input id = "txt1" type="text" name="txt_TenSP" required>
                                        <label for="uname"><b>Giá tiền</b></label>
                                        <input id = "txt2" type="text" name="txt_Giatien" required>
                                        <label for="uname"><b>Thể loại</b></label>
                                        <input id = "txt3" type="text" name="txt_Theloai" required>
                                        
                                        <input id = "txt4" type="hidden" name="txt_HA" required>
                                  </div>
                          </div>		        
                      </div>

                      <div class="container" style="background-color:#f1f1f1">
                          <button type="submit">Lưu lại</button>
                          <button type="button" onclick="document.getElementById('about-product').style.display='none'" class="cancelbtn">Quay lại</button>
                      </div>
                    </form>
                </div>
                
                <div id="addSP" class="modal"> 
                    <form class="modal-content animate" action="add_Sanpham" method="post" enctype="multipart/form-data">
                      <div class="container">
                           <label for="uname"><b>Tên sản phẩm</b></label>
                            <input id = "txt1" type="text" name="txt_TenSP" required>
                            <label for="uname"><b>Giá tiền</b></label>
                            <input id = "txt2" type="text" name="txt_Giatien" required>
                            <label for="uname"><b>Thể loại</b></label>
                            <input id = "txt3" type="text" name="txt_Theloai" required>
                            <label for="uname"><b>Chọn ảnh</b></label>
                            <input type="file" name="txt_HA">
                      </div>

                      <div class="container" style="background-color:#f1f1f1">
                          <button type="submit">Lưu lại</button>
                          <button type="button" onclick="document.getElementById('addSP').style.display='none'" class="cancelbtn">Quay lại</button>
                      </div>
                    </form>
                </div>
                                        
                <div id="delSP" class="modal"> 
                    <form class="modal-content animate" action="del_Sanpham" method="post">
                        <div class="container">
                            <input id="del_id" type="hidden" name="txtID">
                            <span>
                                Bạn có muốn xóa SẢN PHẨM này không?
                            </span>

                        </div>
                        <div class="container" style="background-color:#f1f1f1">
                            <button type="submit">Xóa</button>
                            <button type="button" onclick="document.getElementById('delSP').style.display='none'" class="cancelbtn">Quay lại</button>
                        </div>
                    </form>
                </div>                  
</body>
<script src="JS/admin.js">
</script>
<script src="JS/submit_tag_a.js">
</script>
<script type="text/javascript">
    function show_Sanpham(z)
    {
        document.getElementById("about-product").style.display = "block";
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
        var ha = document.getElementById("txt4").value;
        document.getElementById("anhSP").src = ha;
    }
    
    function add_new()
    {
        document.getElementById("addSP").style.display = "block";
        
    }
    function show_form_delete2(z)
    {                

        document.getElementById("delSP").style.display = "block";

        var myTab = document.getElementById('tb_info');
        var vitri = z.closest("tr").rowIndex;

        var objCells = myTab.rows.item(vitri).cells;
        var str = "";

        str = str + objCells.item(0).innerHTML;


        document.getElementById("del_id").value = str;

    }
</script>
</html>


