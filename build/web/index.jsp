<%-- 
    Document   : index
    Created on : Dec 8, 2020, 3:05:58 PM
    Author     : Hiep Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload="document.form1.submit()">
        <form action="setup_Cookie" id="form1" name="form1" method="post"></form>
        <%@include file="/View/trangcanhan.jsp" %>       
    </body>
</html>
