                const x	= document.getElementsByClassName("button-buy");
		for(var i=0;i<x.length;i++)
		{
			x.item(i).addEventListener("click", function()
			{
				muahang(this);
					
			});
		}

		function muahang(item)
		{
			document.getElementById("about-product").style.display = "block";
			var c = item.parentElement.parentElement;
			var anh = c.children[0].children[0].src;			
			var ten = c.children[1].children[0].innerHTML;
			var gia = c.children[3].innerHTML;
                        var id = c.children[4].value;
			document.getElementById("name_P").innerHTML = ten;
			document.getElementById("cost_P").innerHTML = gia;
			document.getElementById("anh").src = anh;
                        document.getElementById("id_SP").value = id;
                        


		}

		function desc_quanti()
		{
			var quanti = document.getElementById("soluong").value;
			var soluong = eval(quanti)
			soluong = soluong - 1;
			document.getElementById("soluong").value = soluong;
		}
		function add_quanti()
		{
			var quanti = document.getElementById("soluong").value;
			var soluong = eval(quanti)
			soluong = soluong + 1;
			document.getElementById("soluong").value = soluong;
		}

		function show_cart()
		{

			document.getElementById("gio-hang").style.display = "block";
			const remove_cart = document.getElementsByClassName("btn-danger");
			for (var i = 0; i < remove_cart.length; i++) 
			{
			  	remove_cart.item(i).addEventListener("click", function () {
			   	xoasp(this);
			  });
			}

			var quantity_input = document.getElementsByClassName("soluong_inp_GH");
			for (var i = 0; i < quantity_input.length; i++) {
			  var input = quantity_input[i];
			  input.addEventListener("change", function (event) {
			    var input = event.target
			    if (isNaN(input.value) || input.value <= 0) {
			      input.value = 1;
			    }
			    updatecart()
			  })
			}
		}

		const y	= document.getElementsByClassName("btn-cart");
		for(var i=0;i<y.length;i++)
		{
			y.item(i).addEventListener("click", function()
			{
				themvaogio(this);
					
			});
		}

			
		function xoasp(item)
		{
			item.parentElement.parentElement.remove();
			updatecart();
		}
		function updatecart() {
		  var cart_item = document.getElementsByClassName("dsach_SP")[0];
		  var cart_rows = cart_item.getElementsByClassName("chitietGH");
		  var total = 0;
		  for (var i = 0; i < cart_rows.length; i++) {
		    var cart_row = cart_rows[i]
		    var price_item = cart_row.getElementsByClassName("giatien")[0]
		    var quantity_item = cart_row.getElementsByClassName("soluong_inp_GH")[0]
		    var price = parseInt(price_item.innerText)// chuyển một chuổi string sang number để tính tổng tiền.
		    var quantity = quantity_item.value // lấy giá trị trong thẻ input
		    total = total + (price * quantity)
		  }
		  document.getElementsByClassName("tonggia")[0].innerText = total +"VNĐ";
		  // Thay đổi text = total trong .cart-total-price. Chỉ có một .cart-total-price nên mình sử dụng [0].
		}


		// thay đổi số lượng sản phẩm


		function themvaogio(item)
		{
			var c = item.parentElement.parentElement;

			var anh = c.children[0].children[0].children[0].children[0].src;
			var ten = c.children[0].children[0].children[1].children[0].children[0].children[0].innerHTML;
			var gia = c.children[0].children[0].children[1].children[1].children[0].children[0].innerHTML;

			var div1 = document.createElement("div");
			div1.classList.add('chitietGH');

			var cartItems = document.getElementsByClassName('dsach_SP')[0]
		  	var cart_title = cartItems.getElementsByClassName('tieude_SP')
			  for (var i = 0; i < cart_title.length; i++) {
			    if (cart_title[i].innerText == ten) {
			      alert('Sản phẩm đã có trong giỏ hàng')
			      return
			    }
			  }

			var cartRowContents = `
			  <div class="SPtrongGH cot">
			      <img class="anh_SP" src="${anh}" width="100" height="100">
			      <span class="tieude_SP">${ten}</span>
			  </div>
			  <span class="giatien cot">${gia}</span>
			  <div class="soluong-SP cot">
			      <input class="soluong_inp_GH" type="number" value="1">
			      <button class="btn btn-danger" type="button">Xóa</button>
			  </div>`;

			div1.innerHTML = cartRowContents;

			document.getElementsByClassName("dsach_SP")[0].append(div1);
			alert("thêm mặt hàng thành công");
			updatecart();
			
		}

		var modal = document.getElementById("gio-hang");
		var close = document.getElementsByClassName("close")[0];
		close.onclick = function () {
		  modal.style.display = "none";		  
		}


		

		function close_cart()
		{
			document.getElementById("gio-hang").style.display = "none";
		}

		function check()
		{			
			alert(x.length);
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
                
                function chonThanhtoan()
                {                  
                    var hinhthuc = document.getElementById("hinhthucthanhtoan").value;                   
                    document.getElementById("hinhthuc_thanhtoan").value = hinhthuc;
                }
                function chonGiaohang()
                {                  
                    var hinhthuc = document.getElementById("hinhthucgiaohang").value;                   
                    document.getElementById("hinhthuc_giaohang").value = hinhthuc;
                }
                
                function show_thanhtoan()
                {                   
                    var cart_item = document.getElementsByClassName("dsach_SP")[0];
                    var cart_rows = cart_item.getElementsByClassName("chitietGH");
                    var total = 0;
                    var str = "";
                    for (var i = 0; i < cart_rows.length; i++) {
                      var cart_row = cart_rows[i];
                      var price_item = cart_row.getElementsByClassName("giatien")[0];
                      var id_item = cart_row.getElementsByClassName("id_SPham")[0].value;
                      var quantity_item = cart_row.getElementsByClassName("soluong_inp_GH")[0];                      
                      var quantity = quantity_item.value; // lấy giá trị trong thẻ input
                      str = str + id_item + "," + quantity + ".";
                    }
                    var ok = document.getElementById("str").value;
                    ok = ok + str;
                    document.getElementById("str").value = ok;
		  // Thay đổi text = total trong .cart-total-price. Chỉ có một .cart-total-price nên mình sử dụng [0].
                    document.getElementById("thanhtoan").style.display = 'block';
                    document.getElementById("gio-hang").style.display = 'none';
                    
                }