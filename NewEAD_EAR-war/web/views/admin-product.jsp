<%-- 
    Document   : newIndex
    Created on : Feb 23, 2018, 2:36:08 PM
    Author     : quocq
--%>

<%@ page import="model.Products" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <link rel="stylesheet" href="css/datatable.css">

        <link rel="stylesheet" href="css/datatable-bootstrap.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/datatable.jquery.min.js"></script>

        <script type="text/javascript" src="js/datatable.min.js"></script>


        <script type="text/javascript" src="js/jquery.mycart.js"></script>
        
        <style>
            .badge-notify{
                background:red;
                position:relative;
                top: -20px;
                right: 10px;
            }
            .my-cart-icon-affix {
                position: fixed;
                z-index: 999;
            }
        </style>


        <title>Index</title>
    </head>
    <body>
        <script>
            console.log("aaaaa ${user.username}")
            </script>
        <div class="page-header">
            <h1>Hello ${user.username}
                
            </h1>
        </div>
        <div id='a'>
            <table id='datatable' class="table table-bordered">
                <caption><h1><p style="text-align: center">Product List</p></h1></caption>
                <thead>
                    <tr>
                        <td>ID</td>
                        <td>Name</td>
                        <td>Image</td>
                        <td>Price</td>
                        <td>Detail</td>
                        <td>Manufacturer</td>
                        <td>Action</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="e">
                        <tr>
                            <td>${e.productId}</td>
                            <td><a href="DetailProductServlet?productId=${e.productId}">${e.productName}</a></td>

                            <td><img src='uploads/${e.productImage}' alt="${e.productImage}" height="80px"></td>

                            <td>${e.productPrice}</td>
                            <td>${e.productDetail}</td>
                            <td>${e.manufacturerId.manufacturerName}</td>
                            <td><a href="UpdateProductServlet?productId=${e.productId}" class="btn btn-info" >Update</a> | 
                                <a href="DeleteProductServlet?productId=${e.productId}" class="btn btn-info" onclick="return confirm('Delete entry?')" >Delete</a> 

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

           </table>
            <div class="paging"></div>
        </div>

            <a href="CreateProductServlet">Create new</a>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> nó éo chạy đc với cart--> 
        
        <script>
            $('#a table').datatable({
                pageSize: 4,
                sort: [true, true, false],
                filters: [true, true, false, true, true, 'select'],
                filterText: 'Type to filter...'

                        //                pagingDivSelector: "#paging-first-datatable"
            });

        </script>

       
    </body>
</html>
