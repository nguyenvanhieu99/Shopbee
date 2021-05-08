<%-- 
    Document   : thoitrang
    Created on : Dec 6, 2020, 5:18:54 PM
    Author     : Hiep Le
--%>

<%@page import="Model.Sanpham"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Thanhvien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Thời trang - Thoi trang</title>
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
                
                    <%@include file="/CSS/giohang.css" %>
                    <%@include file="/CSS/trangchu.css" %>
                    <%@include file="/CSS/CSDL.css" %>
	</style>
</head>
<body>
<div id="gio-hang" class="giaodienGH">
    <div class="noidung_GH">
        <div class="noidung1">
            <h5 class="modal-title">Giỏ Hàng</h5>
            <span class="close">&times;</span>
        </div>
        <div class="noidung2">
            <div class="chitietGH">
                <span class="SPtrongGH header-SP cot">Sản Phẩm</span>
                <span class="giatien header-SP cot">Giá</span>
                <span class="soluong-SP header-SP cot">Số Lượng</span>
            </div>
            <div class="dsach_SP">
            </div>

            <div class="tongGH">
                <strong class="tieude_tong">Tổng Cộng:</strong>
                <span class="tonggia">0VNĐ</span>
            </div>

        </div>

        <div class="noidung3">
            <button type="button" class="btn btn-2 close-footer" onclick="close_cart()">Đóng</button>
            <button type="button" class="btn btn-1 order">Thanh Toán</button>
        </div>
    </div>
</div>
<div id="about-product" class="modal"> 
  <form class="modal-content animate" action="" method="post">
    <div class="container">
    	<div class="display-container" style="width: 100%">
	    	<div class="form-img">
				<img src="anh1.png" style="width: 70%; margin: 0 auto;" id="anh">
			</div>			    		
    		<div class="form-info" style="width: auto;">
    			<div><h3 style="color : black"><p id="name_P">Thông tin một mặt hàng</p></h3></div>
    			<div><h3 style="color : black"><p id="cost_P">Giá</p></h3></div>
		      	
    		</div>
    	</div>		        
    </div>

    <div class="container" style="background-color:#f1f1f1">
    	<button type="button" class="btn-cart">Thêm vào giỏ hàng</button>
      	<button type="button" onclick="document.getElementById('about-product').style.display='none'" class="cancelbtn">Quay lại</button>
    </div>
  </form>
</div>
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
<div class="slide">
      <script type="text/javascript">
            if(document.images){
               var image1 = new Image();
               image1.src = "img/nenthoitrang.jpg";
               var image2 = new Image(); 
               image2.src = "img/Sale.png";
            }
      </script>
      <a href="#" onMouseOver="document.myImage.src=image2.src;" onMouseOut="document.myImage.src=image1.src;">
      <img name="myImage" src="img/nenthoitrang.jpg" width="700px" height="357px" />
      </a>
</div>
<br />

<img src="img/thoitrang.png" width="700px" height="35px" />
<br />
<br />
<div style="display : flex;flex-wrap: wrap;">
<%
    ArrayList<Sanpham> dssp = new ArrayList<Sanpham>();
    dssp = (ArrayList<Sanpham>) session.getAttribute("dsSanphamtheoloai");
    for(Sanpham i : dssp)
    {
%>
<div class="box">
	<a class="a" href="#"><img src="<%=i.getLinkHA()%>" width="220px" height="295px" /></a>
	<div align="center">
	<a href="#"><%=i.getTenSP() %></a>
	</div>
	<p><del><%=i.getGia() %></del></p>
	<h4><%=i.getGia() %></h4>
	<div align="center">
	<input class="button button-buy" type="button" onclick="myClick()" value="Mua hàng" /></div>
</div>
<% } %>
</div>
<!--<div class="box">
	<a class="a" href="#"><img src="img/aophong1.jpg" width="220px" height="295px" /></a>
	<div align="center">
	<a href="#">áo phông nữ hình in 100% cotton</a>
	</div>
	<p><del>1.200.000 VNĐ</del></p>
	<h4>850.000 VNĐ</h4>
	<div align="center">
	<input class="button-buy button" type="button" onclick="myClick()" value="Mua hàng" />
	</div>
</div>
<div class="box">
	<a class="a" href="#"><img src="img/aophong2.jpg" width="220px" height="295px" /></a>
	<div align="center">
	<a href="#">áo phông nữ cộc tay</a>
	</div>
	<p><del>1.000.000 VNĐ</del></p>
	<h4>900.000 VNĐ</h4>
	<div align="center">
	<input class="button-buy button" type="button" onclick="myClick()" value="Mua hàng" />
	</div>
</div>
<div class="box">
	<a class="a" href="#"><img src="img/aophong3.jpg" width="220px" height="295px"/></a>
	<div align="center">
	<a href="#">áo phông nữ hình in</a>
	</div>
	<p><del>1.200.000 VNĐ</del></p>
	<h4>850.000 VNĐ</h4>
	<div align="center">
	<input class="button-buy button" type="button" onclick="myClick()" value="Mua hàng" />
	</div>
</div>
<div class="box">
	<a class="a" href="trangda1.html"><img src="img/chanvay1.jpg" width="220px" height="295px" /></a>
	<div align="center">
	<a href="trangda1.html">chân váy xẻ</a>
	</div>
	<p><del>1.200.000 VNĐ</del></p>
	<h4>850.000 VNĐ</h4>
	<div align="center">
	<input class="button-buy button" type="button" onclick="myClick()" value="Mua hàng" /></div>
</div>
<div class="box">
	<a class="a" href="trangda2.html"><img src="img/chanvay2.jpg" width="220px" height="295px" /></a>
	<div align="center">
	<a href="trangda2.html">chân váy nữ tính </a>
	</div>
	<p><del>1.000.000 VNĐ</del></p>
	<h4>900.000 VNĐ</h4>
	<div align="center">
	<input class="button-buy button" type="button" onclick="myClick()" value="Mua hàng" />
	</div>
</div>
<div class="box">
	<a class="a" href="trangda3.html"><img src="img/chanvay3.jpg" width="220px" height="295px"/></a>
	<div align="center">
	<a href="trangda3.html">chân váy ngắn có nếp</a>
	</div>
	<p><del>1.200.000 VNĐ</del></p>
	<h4>850.000 VNĐ</h4>
	<div align="center">
	<input class="button-buy button" type="button" onclick="myClick()" value="Mua hàng" />
	</div>
</div>
<div class="box">
	<a class="a" href="da1.html"><img src="img/phukien1.jpg" width="220px" height="295px" /></a>
	<div align="center">
	<a href="da1.html">Khăn len có ren </a>
	</div>
	<p><del>120.000 VNĐ</del></p>
	<h4>85.000 VNĐ</h4>
	<div align="center">
	<input class="button-buy button" type="button" onclick="myClick()" value="Mua hàng" />
	</div>
</div>
<div class="box">
	<a class="a" href="da2.html"><img src="img/phukien2.jpg" width="220px" height="295px" /></a>
	<div align="center">
	<a href="da2.html">tất chân dài </a>
	</div>
	<p><del>100.000 VNĐ</del></p>
	<h4>90.000 VNĐ</h4>
	<div align="center">
	<input class="button-buy button" type="button" onclick="myClick()" value="Mua hàng" />
	</div>
</div>
<div class="box">
	<a class="a" href="da3.html"><img src="img/phukien3.jpg" width="220px" height="295px" /></a>
	<div align="center">
	<a href="da3.html">tất chân cho giày lười </a>
	</div>
	<p><del>200.000 VNĐ</del></p>
	<h4>50.000 VNĐ</h4>
	<div align="center">
	<input class="button-buy button" type="button" onclick="myClick()" value="Mua hàng" />
	</div>
</div>-->
<div align="center" class="lh">
	<a class="lh1" >Xin liên hệ ngay với</a> <a class="lh2">Quần áo Cao Cấp</a> <a class="lh1"> để biết thêm thông tin về giá cả sản phẩm:</a><br />
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
<script src="JS/main.js"></script>
</html>
