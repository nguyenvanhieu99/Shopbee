<%-- 
    Document   : huongdan
    Created on : Dec 7, 2020, 4:48:32 PM
    Author     : Hiep Le
--%>

<%@page import="Model.Thanhvien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Hướng dẫn</title>
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
                                      
                    
                    </ul>
            </nav>

<article>
	<br />
	<img src="img/Huongdan.png" width="700px"/>
	<br />

	<a class="hd6">Các hình thức đặt hàng:</a>      <br /><br />           
	                  <div align="justify">
	               <div style="margin-left:20px;" >  1. Đặt hàng online qua giỏ hàng của website Nhân viên giao hàng sẽ check lại đơn hàng và chuyển hàng theo yêu cầu của quý khách hàng.<br /><br /></div>
	<div style="margin-left:20px;" >  2. Call Hotline 24/24h: Quý khách gọi điện (kể cả trong và ngoài giờ hành chính, ngày lễ, chủ nhật....) đến số 0999 999999 - 03636 05262 để được tư vấn về sản phẩm, giá cả và đặt hàng<br /><br /></div>
	<div style="margin-left:20px;" >  3. Đặt hàng qua facebook: <a style="color:#00F" href="https://www.facebook.com/nguyengianduong">https://www.facebook.com/nguyengianduong</a>
	Quý khách có thể để lại thông tin qua tin nhắn, nhân viên kinh doanh, kho hoặc nv giao hàng sẽ liên lạc lại với quý khách để chốt đơn hàng và giao hàng theo yêu cầu.<br /><br /></div>
	                  </div>
	                  
	                  
	                  <a class="hd6">Thủ tục giao hàng</a>      <br /><br />  
	 <div align="justify">
	               <div style="margin-left:20px;" >  1. Đối với khách hàng trong khu vực nội thành Hà Nội: Chúng tôi sẽ chuyển hàng miễn phí theo yêu cầu đặt hàng, quý khách chỉ phải trả tiền khi đã nhận được hàng.<br /><br /></div>
	<div style="margin-left:20px;" >  2. Đối với khách hàng các tình ngoại thành và các tỉnh, thành phố trong cả nước, chúng tôi áp dụng hình thức chuyển hàng như sau:<br /><br /></div>
	<div style="margin-left:20px;" >  * Vận chuyển COD theo đường bưu điện: (thanh toán tiền sau khi nhân viên bưu điện giao hàng)
	Chúng tôi chuyển hàng theo yêu cầu đơn hàng đến bất cứ địa chỉ nào của khách hàng, nhân viên bưu điện sẽ chuyển hàng đến tận nơi quý khách yêu cầu và thu hộ giá trị đơn hàng khi quý khách nhận được hàng.(Quí khách hàng không cần đến bưu điện nhận hàng)
	<br /><br /></div>
	<div style="margin-left:20px;" >- Chi phí vận chuyển Quần áo cao cấp thanh toán  <br /><br /></div>
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
