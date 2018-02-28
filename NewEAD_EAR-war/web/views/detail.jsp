<%-- 
    Document   : detail
    Created on : Feb 7, 2018, 2:54:51 PM
    Author     : quocq
--%>
<%@ page import="model.Manufacturers" %>
<%@ page import="model.Products" %>

<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Page</title>
    </head>
    <body>
        <h1>Product's detail </h1>
        <label for="productId">ID:</label>
        <input type="text" name="productId" id="productId" value="${productId}" readonly="readonly"/><br>
        <label for="productName">Product Name:</label>
        <input type="text" name="productName" id="productName" value="${productName}" readonly="readonly"/><br>
        <label for="productImage">Product Image:</label>
        <img src='uploads/${productImage}' alt="${e.productImage}" height="80px"> <br/>
        <label for="productPrice">Product Price:</label>
        <input type="number" name="productPrice" id="productPrice" value="${productPrice}" readonly="readonly"/><br>
        <label for="productDetail">Product Detail:</label>
        <input type="text" name="productDetail" id="productDetail" value="${productDetail}" readonly="readonly" /><br>
        <label for="Manufacturer">Manufacturer Name:</label>
        <input type="text" name="manufacturerName" id="manufacturerName" value="${manufacturerName}" readonly="readonly" /><br> 

        <br>
       
                
        <a href="<%=request.getHeader("referer")%>">Back<a/>
        
    </body>
    <script>
      var myArray = sessionStorage.getItem('myArray');

    console.log(myArray);
       
    
        
    </script>
</html>
