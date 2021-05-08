<%-- 
    Document   : trangcanhan
    Created on : Dec 13, 2020, 3:15:49 PM
    Author     : Hiep Le
--%>

<%@page import="Model.Thanhvien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Profile!</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="CSDL.css" rel="stylesheet" type="text/css" />
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

                <%@include file="/CSS/CSDL.css" %>
                <%@include file="/CSS/giohang.css" %>
                <%@include file="/CSS/trangchu.css" %>
	</style>
</head>
<body>
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

            <%		Thanhvien tv = new Thanhvien();
                        if(session.getAttribute("thanhvien")!=null)
                        tv = (Thanhvien)session.getAttribute("thanhvien");
            %>
	<br><br>
	</div>
	<h1>Hồ sơ của tôi</h1>
	Quản lý thông tin hồ sơ để bảo mật tài khoản
	<hr><hr>
	&nbsp;&nbsp;&nbsp;<p style="text-decoration: inherit;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tên tài khoản: <%out.print(tv.getTaikhoan());%></p>
</nav>
  <footer align="center">
  <br />
	<aside>
	<div class="menu1">
      <ul style="list-style-image:url(img/1.png)">
        <li><a href="#"><form action="show_ThaydoiTT" method="get">Hồ sơ</form></a></li><br>
        <li><a href="#"><form action="show_ThaydoiTT" method="get">Đổi mật khẩu</form></a></li><br>
        <li><a href="#"><form action="show_Donhang" method="get">Đơn hàng Đã Mua</form></a></li><br>
        <li><a href="#"><form action="show_Thongbao" method="get">Thông báo</form></a></li><br>
        
      </ul>
    </div>
    <br />
	</aside>
	<div style="display: flex;">	
		<div style="width: 460px; border-radius: 10px;">
						    <br />
                                                    <a href="#"> <form action="show_ThaydoiTT" method="get">thay đổi </form> </a>
                                                    <br />    <br />
					    <p style="text-decoration: underline;text-transform: uppercase;text-shadow: 2px 2px 5px red;">Họ và Tên:<p><%out.print(tv.getHoten()); %>&nbsp;&nbsp;&nbsp;</p></p>    <br />  
					    <p style="text-decoration: underline;text-transform: uppercase;text-shadow: 2px 2px 5px red;">Số điện thoại:</p><%out.print(tv.getSdt()); %> &nbsp;&nbsp;&nbsp;   <br />    <br />
					    <p style="text-decoration: underline;text-transform: uppercase;text-shadow: 2px 2px 5px red;">Email:</p><%out.print(tv.getEmail()); %>&nbsp;&nbsp;&nbsp;<br />    <br />
					    <p style="text-decoration: underline;text-transform: uppercase;text-shadow: 2px 2px 5px red;">Chức Vụ:</p><%out.print(tv.getChucvu()); %>  <br />    <br />
					    <p style="text-decoration: underline;text-transform: uppercase;text-shadow: 2px 2px 5px red;">Tên Đăng nhập:</p><%out.print(tv.getTaikhoan()); %>  <br />    <br />
					    
		</div>
		<div align="center">
	      <h3>ẢNH ĐẠI DIỆN!</h3>
	      <img src="img/icon2.png" />
	      <a href="https://www.facebook.com/nguyengianduong"><img src="img/bean.jpg" width="140px" height="150px" style="border-radius: 200px;" /></a>
	      	      <hr />
	      	      <br />
	      <button>Chọn ảnh</button>
	      	<br /><br />
		  <p style="color: white;">Dung lượng File tối đa: 1MB</p>
		  <p>Định dạng File ảnh: .JPG,.PNG,.JPEG</p>
	    </div>
	</div>
	</div>
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
