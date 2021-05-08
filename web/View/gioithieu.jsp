<%-- 
    Document   : gioithieu
    Created on : Dec 7, 2020, 4:49:18 PM
    Author     : Hiep Le
--%>

<%@page import="Model.Thanhvien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Giới thiệu!</title>
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
		.hd1{
			font-weight:bold;
			font-size:18px;
			margin-left:50px;
			text-decoration:none;
			color:#000;
		}
		.hd2{
			font-weight:bold;
			color:#f63566;
		}
		.hd3{
			font-weight:bold;
			color:#00F;
		}
		.hd4{
			margin-left:50px;
			color:#096;
			font-weight:bold;
		}
		.hd5{
			margin-left:50px;
		}
		.hd6{
			margin-left:50px;
			text-decoration:underline;
			font-weight:bold;
		}
		#content{
			width:620px;
			height:240px;
			z-index: 1;
			}
		#slider{
			list-style:none;
			position:relative;
			
			}
		#slider .slide{
			opacity:0;
			position:absolute;
			}
		#slider .showing{
			opacity: 1;
		}
                <%@include file="/CSS/giohang.css" %>
                <%@include file="/CSS/trangchu.css" %>
                <%@include file="/CSS/CSDL.css" %>  
	</style>
</head>
<body>
    <div id = "header" style="height: 40px;background-color: #ffff80;">
        <div class="form_timkiem">
            <form action="search_SP" method="get">
            <input type="text" name="timkiem" class="txtTimkiem">
            <input type="submit" name="submit" value="Tìm kiếm sản phẩm" class="button btnTimkiem">
            </form>
        </div>
        <%
            if(session.getAttribute("thanhvien")==null)
            {     
        %>
            <div class="menu">
                <a href="#"><form action="show_Dangki" method="get"><img src="img/dangki.png" width="120" height="32"></form></a>
                <a href="#"><form action="show_Dangki" method="get"><img src="img/dangnhap.png" width="100" height="30"></form></a>                                           
            </div>
        <%
            }
            else
            {
                Thanhvien tv = new Thanhvien();
                tv = (Thanhvien)session.getAttribute("thanhvien");
        %>
            <div class="menu">
                <a href="#"><form action="show_Trangcanhan" method="get">Xin chào <%=tv.getHoten()%></form></a>
                <a href="#"><form action="LogoutController" method="post">Đăng xuất</form></a>
                <%
                    if(!tv.getChucvu().equals("user"))
                    {
                %>
                 <a href="#"><form action="show_Siteadmin" method="get">Tới bên quản lý</form></a>   
                <%
                    }
                %>
            </div>
        <%
            }
        %>
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

<article>
	<br />
	<div id="content">
			<ul id="slider">
				<li class="slide showing"><img src="img/nendocla7.jpg" width="620px" height="240px" /></li>
				<li class="slide"><img src="img/gioithieu2.jpg" width="620px" height="240px" /></li>
				<li class="slide"><img src="img/nendocla.jpg" width="620px" height="240px" /></li>
			</ul>
		</div>
		<script language="javascript">
		//mảng slides[0,1,2]
			var slides = document.querySelectorAll('#slider .slide');
			var count = slides.length;
			var tam = 0;
			var timenext = setInterval(nextSlide,2000);
			
			function nextSlide(){
				slides[tam].className = 'slide';
				if(tam == count - 1){
					tam = -1;
				}
				tam = tam + 1;
				slides[tam].className = 'slide showing';
			}
		</script>
        <br />
	<img src="img/gioithieu.png" width="700px"/>
	<br />
	<br />
	<div align="justify">
	<div style="margin-left:20px;" > <a href="trangchu.html" class="hd1">Quần áo Cao Cấp</a> gửi tới Quý khách hàng lời chúc sức khỏe và lời chào trân trọng nhất. Chúng tôi xin chân thành cảm ơn Quý khách hàng đã tin tưởng sử dụng các sản phẩm của chúng tôi trong thời gian vừa qua.</div>
	<br />
	<br />
	<div style="margin-left:20px;" >  <a class="hd5" >Chúng tôi chuyên phân phối buôn và lẻ các loại quần áo cao cấp nhập từ <a class="hd2">Hàn Quốc, Pháp, Hồng Kông và Nhật Bản… </a>như: <a class="hd3">áo phông, áo khoác gió, quần jeans, quần kaki, chân váy, tất chân, khăn quàng.v.v.</a></a></div>
	<br />
	<br />
	<div style="margin-left:20px;" > <a class="hd4">Các Sản phẩm chúng tôi đang phân phối trên thị trường hiện nay luôn đáp ứng các tiêu chí sau:</a><br /></div></div>
					 <div style="margin-left:200px"> -		  Giá cả luôn rẻ nhất thị trường.<br /><br />
	                  -       Sản phẩm luôn đảm bảo chất lượng chính hãng;<br /><br />
	                  -       Thông tin sản phẩm rõ ràng, minh bạch, tư vấn cụ thể từng loại hàng;<br /><br />
	                  </div>
	                  
	         
	<div align="center" class="lh">
	<a class="lh1">Xin liên hệ ngay với</a> <a class="lh2">Quần áo Cao Cấp</a> <a class="lh1"> để biết thêm thông tin về giá cả sản phẩm:</a><br />
	<a class="lh3">Điện thoại:</a><a class="lh1"> 0999 999999 - 03636 05262</a><br />
	<a class="lh3">Facebook:</a><a class="lh1"> Giản Dương</a>
	</div><br />
	<ul style="list-style:circle">
	<li>  Quý khách nhận hàng mới thanh toán tiền; </li>
	<li> Giao hàng trực tiếp với Khách hàng tại Hà Nội;</li>
	<li> Khách hàng ở tỉnh khác chúng tôi sẽ chuyển phát nhanh theo đường bưu điện;</li>
	<li>Miễn phí toàn bộ cước vận chuyển đối với khách hàng mua lẻ trên toàn quốc.</li>
	</ul>
	<h2>***Trân trọng cảm ơn sự quan tâm của quý khách hàng***</h2>
</article>


	<!-- menu -->
<aside>

        <div class="menu1">
          <h3 style="padding-top: 5px">DANH MỤC SẢN PHẨM</h3>
          <img src="img/icon2.png" />
          <ul style="list-style-image:url(img/1.png)">
            <li><a href="#"><form action="show_Aophong" method="get">áo phông</form></a></li>
            <li><a href="#"><form action="show_Somi" method="get">áo sơ mi</form></a></li>
            <li><a href="#"><form action="show_Maconha" method="get" >đồ mặc ở nhà</form></a></li>
            <li><a href="#"><form action="show_Phukien" method="get">phụ kiện</form></a></li>
            <li><a href="#"><form action="show_Quanvai" method="get">quần vải</form></a></li>
            <li><a href="#"><form action="show_Chanvay" method="get">chân váy</form></a></li>
            <li><a href="#"><form action="show_Quanjeans" method="get">quần jeans</form></a></li>
            <li><a href="#"><form action="show_Quankhaki" method="get">quần khaki</form></a></li>
          </ul>
        </div>
        <br />

        <div class="menu1">
          <h3 style="padding-top: 5px">SẢN PHẨM ĐẶC BIỆT</h3>
          <img src="img/icon2.png" />
          <ul style="list-style-image:url(img/1.png)">
              <li><a href="javascript: submitform()"><form name="myform" action="show_Aokhoacgio" method="get">áo khoác gió</form></a></li>
            <li><a href="#"><form action="show_Aolongcuu" method="get">áo lông cừu</form></a></li>
            <li><a href="#"><form action="show_Aolen" method="get">áo len</form></a></li>
            <li><a href="#"><form action="show_Docla" method="get">SP độc lạ</form></a></li>
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
<script src="JS/submit_tag_a.js">
</script>
</html>
