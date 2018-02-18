<%-- 
    Document   : create
    Created on : Feb 6, 2018, 1:46:19 PM
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
        <title>Create Page</title>
    </head>
    <body>
        <h1>Create new product</h1>
        <form action="CreateProductServlet" method = "post"
              enctype = "multipart/form-data">
            <label for="productId">ID:</label>
            <input type="text" name="productId" id="productId" /><br>
            <label for="productName">Product Name:</label>
            <input type="text" name="productName" id="productName"/><br>
            <label for="file">Product Image:</label>
            <input type="file" name="file" id="file"/><br>
            <label for="productPrice">Product Price:</label>
            <input type="number" name="productPrice" id="productPrice"/><br>
            <label for="productDetail">Product Detail:</label>
            <input type="text" name="productDetail" id="productDetail"/><br>
            <label for="Manufacturer">Manufacturer Name</label>
            <select name="manu_id" id="manu_id" onchange="check();">
                <c:forEach var="item" items="${manu}" >
                    <option value="${item.manufacturerId}" ${item.manufacturerId ==  product.manufacturerId ? 'selected="selected"' : ''}>${item.manufacturerName}</option>
                </c:forEach>
            </select>
            <input type="button" onclick="check();" />
            <input type="submit" value="Create" />
            <script>
                function check()
                {
                    alert(document.getElementById('manu_id').value);
                }
            </script>
        </form>
    </body>
</html>
