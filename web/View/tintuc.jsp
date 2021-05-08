<%-- 
    Document   : tintuc
    Created on : Dec 6, 2020, 4:53:17 PM
    Author     : Hiep Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<title>Tin tức</title>
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
                    <%@include file="/CSS/giohang.css" %>
                    <%@include file="/CSS/trangchu.css" %>
                    <%@include file="/CSS/CSDL.css" %>
	</style>
    </head>
    <body>
    <div id = "header" style="height: 40px;background-color: #ffff80">
            <div class="menu">
                           <form action="TestController" method="get" name="myform">
                            <a href="#"><form action="show_Dangki" method="get"><img src="img/dangki.png" width="120" height="32"></form></a>
                            <a href="#"><form action="show_Dangki" method="get"><img src="img/dangnhap.png" width="100" height="30"></form></a> 
                            </form>
            </div>
            <%
                if(session!=null)
                {
                    out.print(session.getAttribute("ten"));
                }
            %>
    </div>
    <div id="menu">
                    <header>
                    <img src="img/bia2.jpeg" width="972px" height="250px">
            </header>

            <nav>
                    <ul class="bang">
                    <li><a href="trangchu.html"> TRANG CHỦ</a></li>
                    <li><a href="gioithieu.html">GIỚI THIỆU</a></li>
                    <li><a>MẶT HÀNG THỜI TRANG</a>
                            <ul>
                            <li>	<a href="congso.html">QUẦN ÁO CÔNG SỞ</a></li>
                                <li><a href="dulich.html">QUẦN ÁO DU LỊCH</a></li>
                                <li><a href="thoitrang.html">QUẦN ÁO THỜI TRANG</a></li>
                        </ul>
                        </li>
                    <li><a href="huongdan.html">HƯỚNG DẪN MUA HÀNG</a></li>
                    <li><a href="lienhe.html">LIÊN HỆ</a></li>
                    </ul>
            </nav>
            <aside>

        <div class="menu1">
          <h3 style="padding-top: 5px">DANH MỤC SẢN PHẨM</h3>
          <img src="img/icon2.png" />
          <ul style="list-style-image:url(img/1.png)">
            <li><a href="aophong.html">áo phông</a></li>
            <li><a href="somi.html">áo sơ mi</a></li>
            <li><a href="maconha.html">đồ mặc ở nhà</a></li>
            <li><a href="phukien.html">phụ kiện</a></li>
            <li><a href="quanvai.html">quần vải</a></li>
            <li><a href="chanvay.html">chân váy</a></li>
            <li><a href="quanjeans.html">quần jeans</a></li>
            <li><a href="quankhaki.html">quần khaki</a></li>
          </ul>
        </div>
        <br />

        <div class="menu1">
          <h3 style="padding-top: 5px">SẢN PHẨM ĐẶC BIỆT</h3>
          <img src="img/icon2.png" />
          <ul style="list-style-image:url(img/1.png)">
            <li><a href="aokhoacgio.html">áo khoác gió</a></li>
            <li><a href="aolongcuu.html">áo lông cừu</a></li>
            <li><a href="aolen.html">áo len</a></li>
            <li><a href="docla.html">SP độc lạ</a></li>
          </ul>
        </div>
        <br />


        <div class="menu2" align="center">
          <h3>HỖ TRỢ TRỤC TUYẾN</h3>
          <img src="img/icon2.png" />
          <p> Co-Fouder</p>
          <a href="https://www.facebook.com/nguyengianduong"><img src="img/bean.jpg" width="140px" height="150px" /></a>
          <p> Điện Thoại : 03636 05262</p>
          <hr />
        </div>
      </aside>
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
    <script src="JS/main.js"></script>
</html>
