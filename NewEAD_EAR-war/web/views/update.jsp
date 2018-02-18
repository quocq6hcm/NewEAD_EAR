<%-- 
    Document   : newjspupdate
    Created on : Feb 6, 2018, 1:46:24 PM
    Author     : quocq
--%>
<%@ page import="model.Manufacturers" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
        <h1>Update product</h1>
        <form action="UpdateProductServlet" method = "post">
            <label for="productId">ID:</label>
            <input type="text" name="productId" id="productId" value="${productId}" readonly="readonly"/><br>
            <label for="productName">Product Name:</label>
            <input type="text" name="productName" id="productName" value="${productName}"/><br>
            <label for="productImage">Product Image:</label>
            <input type="text" name="productImage" id="productImage" value="${productImage}"/><br>
            <label for="productPrice">Product Price:</label>
            <input type="number" name="productPrice" id="productPrice" value="${productPrice}"/><br>
            <label for="productDetail">Product Detail:</label>
            <input type="text" name="productDetail" id="productDetail" value="${productDetail}"/><br>
            <label for="Manufacturer">Manufacturer Name</label>
            <select name="manu_id" id="manu_id" onchange="check();">
                <c:forEach var="item" items="${manu}" >
                    <option value="${item.manufacturerId}" ${item.manufacturerId ==  manufacturerId ? 'selected="selected"' : ''}>${item.manufacturerName}</option>
                </c:forEach>
            </select>
            <input type="button" onclick="check();" />
            <input type="submit" value="Update" />
            <script>
                function check()
                {
                    alert(document.getElementById('manu_id').value);
                }
            </script>
        </form>
    </body>
</html>
