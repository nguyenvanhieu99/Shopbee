function newsiteO()
            {
                    document.getElementById("site3").style.display = "none";
                    document.getElementById("site2").style.display = "none";
                    document.getElementById("site1").style.display = "block";
            }
            function newsiteT()
            {
                    document.getElementById("site1").style.display = "none";
                    document.getElementById("site3").style.display = "none";
                    document.getElementById("site2").style.display = "block";				
            }
            function newsiteTh()
            {
                    document.getElementById("site1").style.display = "none";
                    document.getElementById("site2").style.display = "none";
                    document.getElementById("site3").style.display = "block";
            }

            function show_modul1()
            {
                    document.getElementById("modul3").style.display = "none";
                    document.getElementById("modul2").style.display = "none";
                    document.getElementById("modul1").style.display = "block";
            }
            function show_modul2()
            {

                    document.getElementById("modul3").style.display = "none";
                    document.getElementById("modul2").style.display = "block";
                    
                    document.getElementById("txt1").value = "Lê Sĩ Hiệp";
                    document.getElementById("txt2").value = "20";
                    document.getElementById("txt3").value = "0942215556";
                    document.getElementById("txt4").value = "shounen193@gmail.com";
                    document.getElementById("txt5").value = "admin";
                    document.getElementById("txt6").value = "admin";

            }
            

                
                function clickk(z)
                {
                    document.getElementById("modul3").style.display = "none";
                    document.getElementById("modul2").style.display = "block";
                    
                    var myTab = document.getElementById('tb_info');
                    var vitri = z.closest("tr").rowIndex;
                    
                    var objCells = myTab.rows.item(vitri).cells;

                    for (var j = 0; j < objCells.length-2; j++) {
                        var str = "";
                        str = str + objCells.item(j).innerHTML;
                        var id = "txt";
                        id = id + j;                     
                        document.getElementById(id).value = str;                               
                    }
                                     
                }
                
                function show_Sanpham(z)
                {
                    document.getElementById("modul3").style.display = "none";
                    document.getElementById("about-product").style.display = "block";
                    alert("ok");
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
                                     
                }
                
                function getId(x)
                {
                    var vitri = x.closest('tr').rowIndex;
                    var s = "" + vitri;
                    alert(s);
                }
                
                function show_form_delete(z)
                {                
                   
                    document.getElementById("modul3").style.display = "block";
                    
                    var myTab = document.getElementById('tb_info');
                    var vitri = z.closest("tr").rowIndex;
                    
                    var objCells = myTab.rows.item(vitri).cells;
                    var str = "";
                    
                    str = str + objCells.item(0).innerHTML;

                    
                    document.getElementById("del_id").value = str;
                                  
                }
                
                function add_new()
                {
                    document.getElementById("modul_add").style.display = "block";
                }
                function doi_form()
                {
                    var x = document.getElementsByClassName("tb_02");
                    x[0].style.display ="table-row";
                    x[1].style.display ="table-row";
                }