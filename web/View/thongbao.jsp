<%-- 
    Document   : thongbao
    Created on : Dec 14, 2020, 1:55:49 AM
    Author     : Hiep Le
--%>

<%@page import="Model.Phanhoi"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Quản Lý đơn Hàng!</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="CSDL2.css" rel="stylesheet" type="text/css" />
	<link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
	  <link rel="apple-touch-icon" sizes="60x60" href="favicon.ico/apple-icon-60x60.png">
	  <link rel="apple-touch-icon" sizes="72x72" href="favicon.ico/apple-icon-72x72.png">
	  <link rel="apple-touch-icon" sizes="76x76" href="favicon.ico/apple-icon-76x76.png">
	  <link rel="apple-touch-icon" sizes="114x114" href="favicon.ico/apple-icon-114x114.png">
	  <link rel="apple-touch-icon" sizes="120x120" href="favicon.ico/apple-icon-120x120.png">
	  <link rel="apple-touch-icon" sizes="144x144" href="favicon.ico/apple-icon-144x144.png">
	  <link rel="apple-touch-icon" sizes="152x152" href="favicon.ico/apple-icon-152x152.png">
	  <link rel="apple-touch-icon" sizes="180x180" href="favicon.ico/apple-icon-180x180.png">
	  <link rel="icon" type="image/png" sizes="192x192"  href="favicon.ico/android-icon-192x192.png">
	  <link rel="icon" type="image/png" sizes="32x32" href="favicon.ico/favicon-32x32.png">
	  <link rel="icon" type="image/png" sizes="96x96" href="favicon.ico/favicon-96x96.png">
	  <link rel="icon" type="image/png" sizes="16x16" href="favicon.ico/favicon-16x16.png">
	  <link rel="manifest" href="/manifest.json">
	  <meta name="msapplication-TileColor" content="#ffffff">
	  <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
	  <meta name="theme-color" content="#ffffff">
	  <link rel="stylesheet" type="text/css" href="trangchu.css">
	  <link rel="stylesheet" type="text/css" href="giohang.css">
	<style>
		.lh{
			font-weight:bold;
		}
		.lh2{
			color:#551aa8;
		}
		.lh3{
			color:#808080;
		}
		.lh1{
			color:#ff0000;
		}
		article ul li{
			margin-left:40px;
			margin-bottom:15px;
			color:#F00;
		}
		h2{
			color:#808080;
			text-align:center;
			font-style:italic;
		}
		.box1 a{
			text-decoration:none;
			color:#000;
		}
		.box1 a:hover{
			color:#F60;
		}
		.box1 p{
			text-align:center;
			color:#333;
			font-weight:bold;
		}
		.box1 h4{
			color:#F00;
			text-align:center;
		}
		th{
			padding:10px;
		}
		td a{
			text-decoration:none;
			text-transform:uppercase;
		}
		td a:hover{
			text-decoration:underline;
			color:#F00;
		}
		#customers {
		  font-family: Arial, Helvetica, sans-serif;
		  border-collapse: collapse;
		  width: 100%;
		}
		
		#customers td, #customers th {
		  border: 1px solid #ddd;
		  padding: 8px;
		}
		
		#customers tr:nth-child(even){background-color: #f2f2f2;}
		
		#customers tr:hover {background-color: #ddd;}
		
		#customers th {
		  padding-top: 12px;
		  padding-bottom: 12px;
		  text-align: left;
		  background-color: #FC90A5;
		  color: white;
		}
                <%@include file="/CSS/CSDL.css" %>
                <%@include file="/CSS/giohang.css" %>
                <%@include file="/CSS/trangchu.css" %>
                
	</style>
</head>
<body>
<div id="show" class="modal"> 
    <form class="modal-content animate">
        <div class="container" style="display: flex;flex-direction: column">
           <label for="uname"><b>Nội dung góp ý</b></label>
           <textarea id="NDGY1" rows="10" cols="40" disabled></textarea>
           <label for="uname"><b>Nội dung phản hồi</b></label>
           <textarea id="NDPH1" rows="10" cols="40" disabled></textarea>
            
      </div>

      <div class="container" style="background-color:#f1f1f1">       
          <button type="button" onclick="document.getElementById('show').style.display='none'" class="cancelbtn">Quay lại</button>
      </div>
    </form>
</div>
<div id="menu">
		<header>
		<img src="img/bia2.jpeg" width="972px" height="250px">
                
		
	</header>
	
	<nav>
                    <ul class="bang">
                        <li><a href="#"><form method="get" action="show_Trangchu">TRANG CHỦ</form></a></li>
                        <li><a href="#"><form method="get" action="show_Gioithieu">GIỚI THIỆU</form></a></li>
                    <li><a>MẶT HÀNG THỜI TRANG</a><ul>
                            <li><a href="#"><form method="get" action="show_Congso">QUẦN ÁO CÔNG SỞ</form></a></li>
                            <li><a href="#"><form method="get" action="show_Dulich">QUẦN ÁO DU LỊCH</form></a></li>
                            <li><a href="#"><form method="get" action="show_Thoitrang">QUẦN ÁO THỜI TRANG</form></a></li>
                    </ul></li>
                    <li><a href="#"><form name="myform" method="get" action="show_Huongdan">HƯỚNG DẪN MUA HÀNG</form></a></li>
                    <li><a href="#"><form name="myform" method="get" action="show_Lienhe">LIÊN HỆ</form></a></li>
                                  
                    <li><a href="#" onclick="show_cart()">GIỎ HÀNG</a></li>
                    </ul>
        </nav>
	
<nav>
	<div class="bang">
	<img src="img/QLDonHang.png" />
	<br />
	<br />
	<center><h1> PHẢN HỒI CỦA SHOP </h1></center>
        <br>
	<br><br>
	</div>
		<%
                    ArrayList<Phanhoi> dsdh = new ArrayList<Phanhoi>();
                    if(session.getAttribute("phanhoi")!=null)
                    dsdh = (ArrayList<Phanhoi>) session.getAttribute("phanhoi");
                %>		
                    <table id="customers">				
                        <tr>
                           <th>Người gửi</th>
                           <th>Ngày liên hệ</th>
                           <th>Nội dung</th>
                           <th>Ngày phản hồi</th>
                           <th>Thao tác<th>
                         </tr>


                        <% 
                            for(Phanhoi i : dsdh)
                            {
                               
                        %>
                        <tr>
                            <td><%=i.getLh().getHoten() %></td>
                            <td><%=i.getLh().getNgayLH() %></td>
                            <td><%=i.getLh().getNoidung() %></td>
                            <td><%=i.getNgayPH() %> </td>
                            <td>
                                <input type="hidden" value="<%=i.getNoidung()%>" id="NDPH">
                                <input type="hidden" value="<%=i.getLh().getNoidung()%>" id="NDLH">
                                <button onclick="show_Phanhoi(this)">Xem nội dung phản hồi</button>
                            </td>
                        </tr>
                        <%} %>				
                    </table>
        
</nav>
	<hr>
	<br><br>
  <footer align="center">
  <br />

  <marquee class="chuchay1">Thỏa sức thể hiện cá tính của bạn!</marquee>




  <div class="ketthuc" ><a href="index.html">Cửa hàng quần áo số 1 Việt Nam</a></div>
    <br />
    <b>Địa chỉ: số 9 km 10 Hà Đông, Hà Nội</b>
    <br />
    <br />
    <p>Hotline của shop: 0999 999999 ~ 03636 05262</p>
    </footer>
</div>
	
</body>
<script type="text/javascript">
                function show_Phanhoi(z)
                {
                   
                    document.getElementById("show").style.display = "block";
                    var x = document.getElementById("NDLH").value;
                    var y = document.getElementById("NDPH").value;
                    
                    document.getElementById("NDPH1").value = y;
                    document.getElementById("NDGY1").value = x;
                    
                    
                }
                const taga = document.getElementsByTagName("a");
		for(var i=0;i<taga.length;i++)
		{
			taga.item(i).addEventListener("click", function()
			{
				submitt(this);
					
			});
		}
                
                function submitt(z)
                {
                    z.children[0].submit();                    
                }
                
                
</script>
</html>


