<%-- 
    Document   : index
    Created on : Feb 6, 2018, 11:07:05 AM
    Author     : quocq
--%>
<%@ page import="model.Products" %>
<%@ page import="java.util.List" %>
<%-- 
    Document   : testAjax
    Created on : Dec 29, 2017, 7:15:38 PM
    Author     : quocq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>List Product!</h1>
        
        <table border="1" cellspacing="0" cellpadding="5" id='tblData'>
                <caption><h1>List of Products</h1></caption>
                <thead>
                    <tr>
                        <td>ID</td>
                        <td>Name</td>
                        <td>Image</td>
                        <td>Price</td>
                        <td>Detail</td>
                        <td>Manufacturer</td>

                    </tr>
                </thead>
                <tbody id="tblBody">


                <c:forEach items="${list}" var="e">
                    <tr>
                        <td>${e.productId}</td>
                        <td>${e.productName}</td>

                        <td><img src="${e.productImage}" alt="${e.productImage}" height="80px"></td>

                        <td>${e.productPrice}</td>
                        <td>${e.productDetail}</td>
                        <td>${e.manufacturerId.manufacturerName}</td>
                        <td><a href="UpdateProductServlet?product_id=${e.productId}">Update</a> <a href="DeleteProductServlet?product_id=${e.productId}"
                                                                                                    onclick="return confirm('are you sure delete this product ?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>

    </body>
</html>
