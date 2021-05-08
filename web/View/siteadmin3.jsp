<%-- 
    Document   : siteadmin3
    Created on : Dec 11, 2020, 2:47:49 AM
    Author     : Hiep Le
--%>

<%@page import="Model.Lienhe"%>
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
                <div id="about-product" class="modal"> 
                    <form class="modal-content animate" action="save_Phanhoi" method="post">
                      <div class="container">
                          <div class="display-container" style="width: 100%">
<!--                                  <div class="form-img">
                                      <img src="anh1.png" style="width: 80%; margin: 0 auto;" id="anhSP">
                                      <input type="file" name="txt_HA">
                                  </div>-->
                                  <div class="form-info">
                                        <input id = "txt0" type="hidden" name="txt_ID" required>
                                        <textarea name="txt_ND" rows="10" cols="60"></textarea>
                                  </div>
                          </div>		        
                      </div>

                      <div class="container" style="background-color:#f1f1f1">
                          <button type="submit">Lưu lại</button>
                          <button type="button" onclick="document.getElementById('about-product').style.display='none'" class="cancelbtn">Quay lại</button>
                      </div>
                    </form>
                </div>
                <div class="show-btn3" id="site2">                       
                        <div class="list-info-member display-container" id="modul1">					
                                <div>
                                    <h1>DANH SÁCH LIÊN HỆ</h1>
                                    <div style="display : flex">                                       
                                        <div class="dropdown">
                                            <button>Xem hóa đơn</button>
                                            <div class="dropdown-content">
                                                <a href="#"><form action="sort_Tangdan" method="get">Tăng dần</form></a>
                                                <a href="#"><form action="sort_Giamdan" method="get">Giảm dần</form></a>
                                            </div>
                                        </div>
                                        
                                        <div class="dropdown">
                                            <button>Xem mặt hàng được mua nhiều nhất</button>
                                            <div class="dropdown-content">
                                                
                                            </div>
                                        </div>
                                    </div>
                                        
                                                                             
                                <table class="table-info" id="tb_info">
                                        <tr>
                                                <th style="width: 6%;display : none">ID</th>
                                                <th style="width: 15%">Người gửi</th>
                                                <th style="width: 15%">Tiêu đề</th>
                                                <th style="width: 40%">Nội dung</th>
                                                <th style="width: 15%">Trạng thái</th>
                                                <th style="width: 15%">Thao tác</th>
                                        </tr>
                                        <%
                                            
                                            if(session.getAttribute("lienhe")!=null)
                                            {                                                
                                                ArrayList<Lienhe> dslh = (ArrayList<Lienhe>)session.getAttribute("lienhe");
                                                for(Lienhe u : dslh)
                                                {
                                        %>
                                        <tr>
                                            <td style="display : none"><%=u.getId()%></td>
                                                <td><%=u.getHoten()%></td>
                                                <td><%=u.getTieude()%></td>
                                                <td><%=u.getNoidung()%></td>
                                                <td><%=u.getTrangthai()%></td>
                                                <td>
                                                <div>
                                                    <input id="btn_fix" type="button" value="Phản hồi" onclick="show_Lienhe(this)" >                                                   
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
</body>
<script src="JS/admin.js">
</script>
<script src="JS/submit_tag_a.js">
</script>
<script type="text/javascript">
    function show_Lienhe(z)
    {
        document.getElementById("about-product").style.display = "block";
        var myTab = document.getElementById('tb_info');
        var vitri = z.closest("tr").rowIndex;

        var objCells = myTab.rows.item(vitri).cells;

        var str = "";
            str = str + objCells.item(0).innerHTML;                          
            document.getElementById("txt0").value = str;
        
    }
</script>
</html>


