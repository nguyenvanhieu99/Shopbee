<%-- 
    Document   : dangki.jsp
    Created on : Dec 7, 2020, 4:53:24 PM
    Author     : Hiep Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Đăng kí - Thời Trang cao cấp!</title>
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
.h{
  width:260px;
  height:40px;
  border-radius:10px;
  border:2px solid #f42b5d;
  }

.hu{
  
  width:100px;
  }
button{
  background-color:#bb3baf;
  color:white;
  height:40px;
  width:263px;
  border-radius:10px;
  margin-top: 3px;

  }
button:hover{
  cursor:pointer;
  background-color:#F0F;
  font-weight:bold;
}
.hi{
  float:left;
  width:60%;
  padding-left:10px;
  }
.hii{
  float:right;
  width:35%;
  }
  header img{
    border-radius: 10px;
  }
 <%@include file="/CSS/giohang.css" %>
<%@include file="/CSS/trangchu.css" %>
<%@include file="/CSS/CSDL.css" %> 
</style>
</head>

<body>
  <div id="menu">
  <header>
  <img src="img/bia2.jpeg" width="972px" height="250px"/>
  </header>
  <br />
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
  <img src="img/dangki_dangnhap.png" width="700px"/>
  <br />
  <br />
  <div class="hi"><h1 >ĐĂNG KÝ</h1>
  <br /><br />
  <form onsubmit="return return loginForm()" action="RegisterController" method="post"">
  <div><a>Họ Và Tên*</a><br />
      <input class="h" type="text" id="username" placeholder="Nhập họ tên" name="create-name"/>
  <div class="val_error" id="name_error"></div></div><br />
  <div><a>Email*</a><br />
      <input class="h" type="text" id="email" placeholder="Nhập email" name="create-email"/>
   <div class="val_error" id="email_error"></div></div><br />
   <div><a>SĐT*</a><br />
       <input class="h" type="text" id="phone" placeholder="Nhập số điện thoại" name="create-phone"/>
   <div class="val_error" id="phone_error"></div></div><br />
   <div><a>Tài khoản</a><br />
       <input class="h" type="text" id="taikhoan" name="create-account" placeholder="Nhập tài khoản" required>
   <div class="val_error" id="taikhoan_error"></div></div><br />
  <div><a>Mật Khẩu</a><br />
      <input class="h" type="text" id="password" placeholder="Nhập mật khẩu" name="create-pass"/>
   <div class="val_error" id="password_error"></div></div><br />
  <div><a>Nhập Lại Mật Khẩu</a><br />
      <input class="h" type="text" id="re_password" placeholder="Nhập lại mật khẩu" name="create-repass"/>
   <div class="val_error" id="re_password_error"></div></div><br />
   <div class="ha"><input type="radio" id="gioi" value="Nam" />&nbsp;Nam
          <input type="radio" id="gioi" value="Nữ" />&nbsp;Nữ
  <div class="val_error" id="gioi_error"></div></div>
  <div class="hu"><button type="submit">Đăng ký</button></div>
  <br /><br />
  </form></div>
  <div class="hii"><h1 >ĐĂNG NHẬP</h1>
  <br /><br />
  <form onsubmit="return loginForm()" action="LoginController" method="post">
  <div><a>Tài khoản</a><br />
      <input class="h" type="text" id="email2" placeholder="Nhập tài khoản" name="taikhoan" required>
   <div class="val_error" id="taikhoan_error"></div></div><br />
  <div><a>Mật Khẩu</a><br />
  <input class="h" type="text" id="password2" placeholder="Nhập password" name="matkhau" required>
   <div class="val_error" id="password_error2"></div></div><br />
   <a>Quên Mật Khẩu?</a><a href="dangki.html">Nhấn vào đây</a>
  <div class="hu"><button type="submit">Đăng Nhập</button></div>
  </form></div><br clear="both" />
<script>
  var radio = document.getElementById('gioi');
  var username = document.getElementById('username');
  var email = document.getElementById('email');
  var email2 = document.getElementById('email2');
  var phone = document.getElementById('phone');
  var password = document.getElementById('password');
  var password2 = document.getElementById('password2');
  var re_password = document.getElementById('re_password');
  var re_password2 = document.getElementById('re_password2');
  var usename_error = document.getElementById('name_error');
  var email_error = document.getElementById('email_error');
  var email_error2 = document.getElementById('email_error2');
  var phone_error = document.getElementById('phone_error');
  var password_error = document.getElementById('password_error');
  var password_error2 = document.getElementById('password_error2');
  var re_password_error = document.getElementById('re_password_error');

    username.addEventListener('blur', usernameVertify, true);
    email.addEventListener('blur', emailVertify, true);
    email2.addEventListener('blur', email2Vertify, true);
    phone.addEventListener('blur', phoneVertify, true);
    re_password.addEventListener('blur', re_passwordVertify, true);
  //slideshow
  function next(){
    if(dem==imgs.length-1){
      dem=0;
    }else{dem++;}
    document.getElementById('imgslide').src="img/" +imgs[dem];}
    
    chay=setInterval(function(){next();},1000);


  function usernameVertify(){
      if(username.value != ""){
        username.style.border = "";
        name_error.innerHTML = "";
        return true;  
      }
    }

    function phoneVertify(){
      if(phone.value != ""){
        phone.style.border = "";
        phone_error.innerHTML = "";
        return true;  
      }
    }
    
    function emailVertify(){
      var acong = email.value.indexOf('@');
      var dot = email.value.lastIndexOf('.');
      
      if(email.value != "" || acong>=1 || dot >= acong+2 || dot+2<email.value.length){
        email.style.border = "";
        email_error.innerHTML = "";
        return true;  
      } 
    }

    function email2Vertify(){
      var acong = email2.value.indexOf('@');
      var dot = email2.value.lastIndexOf('.');
      
      if(email2.value != "" || acong>=1 || dot >= acong+2 || dot+2<email2.value.length){
        email2.style.border = "";
        email_error2.innerHTML = "";
        return true;  
      } 
    }
    
    function re_passwordVertify(){
      
      if(re_password.value == password.value){
        re_password.style.border = "";
        pass_error.innerHTML = "";
        return true;  
      }
    }
    
    function loginForm(){
      var acong = email2.value.indexOf('@');
      var dot = email2.value.lastIndexOf('.');
      
      if(email2.value == "" || acong<1 || dot < acong+2 || dot+2>=email2.value.length){
        email2.style.border = "2px solid red";
        email_error2.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bạn cần nhập đúng email";
        email2.focus();
        return false; 
      }
      if(password2.value==""){
     password2.style.border="2px solid red";
     password_error2.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bạn cần nhập password";
      password2.focus();
      return false;
    }
      if(email2.value == "gduongit9@gmail.com" && password2.value == "admin"){
        alert("dang nhap thanh cong!");
      }else{
        alert("tên đăng nhập hoặc mật khẩu không chính xác!");
      }
    }

  function validateForm(){
   if(username.value==""){
     username.style.border="2px solid red";
     name_error.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bạn cần nhập họ tên";
      username.focus();
      return false;
    }
    var acong = email.value.indexOf('@');
    var dot = email.value.lastIndexOf('.');

      
      if(email.value == "" || acong<1 || dot < acong+2 || dot+2>=email.value.length){
        email.style.border = "2px solid red";
        email_error.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bạn cần nhập đúng email";
        email.focus();
        return false; 
      }
      if(password.value==""){
     password.style.border="2px solid red";
     password_error.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bạn cần nhập password";
      password.focus();
      return false;
    }
    if(re_password.value!=password.value){
     re_password.style.border="2px solid red";
     re_password_error.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bạn cần nhập lại password";
      re_password.focus();
      return false;
      }
      if(phone.value ==""){
        phone_error.border = "2px solid red";
        phone_error.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bạn cần nhập số điện thoại";
          return false;
      phone.focus();
      }
      if(radio[0].checked == false && radio[1].checked == false){
      document.getElementById('gioi_error').innerHTML=" Bạn chưa chọn giới tính";
      radio[0].focus();
      return false;
      }

      alert("đăng kí thành công!");
  }
  </script>



  <div align="center" class="lh">
  <a class="lh1">Xin liên hệ ngay với</a> <a class="lh2"> TEAM lập trình web</a> <a class="lh1"> để biết thêm thông tin về giá cả sản phẩm:</a><br />
  <a class="lh3">Điện thoại:</a><a class="lh1"> 0999 999999 ~ 03636 05262</a><br />
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
