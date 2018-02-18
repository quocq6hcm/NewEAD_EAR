<%-- 
    Document   : index
    Created on : Feb 6, 2018, 11:07:05 AM
    Author     : quocq
--%>
<%@ page import="model.Products" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/pagination.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css/pagination.css">
        <title>Index</title>
    </head>
    <body>
        <h1>Hello</h1>
        <!--        <a href="CreateProductServlet">Create new</a>-->
        <form id="formSearch">
        Input: <input type="text" name="txtSearch" id="txtSearch"/> 
        Match: 
        <select name="SearchBy" id="SearchBy">
            <option>Name</option>
            <option>Manufacturer</option>
        </select>
        <br/> <br/>
        Price from: <input type="number" name="txtFrom" id="txtFrom"/>
        to: <input type="number" name="txtTo" id="txtTo"/>
        <div id="errorMsg"></div>
        <br/> <br/>
        <input type="button" id="btnSearch" value="Search" onclick="check();"/>
    </form>
        <script>
            function check()
            {
                from = document.getElementById('txtFrom').value;
                to = document.getElementById('txtTo').value;
                console.log(from);
                console.log(to);
                
                if(from > to)
                {
                    $("#txtFrom").val("");
                    $("#txtTo").val("");
                    document.getElementById('errorMsg').innerHTML = '<p style="color: red">invalid input';
                }
                else
                {
                    document.getElementById('errorMsg').innerHTML = '';
                    execSearch();
                }
            }
     
        </script>
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
                        <td><a href="DetailProductServlet?productId=${e.productId}">${e.productName}</a></td>

                        <td><img src='uploads/${e.productImage}' alt="${e.productImage}" height="80px"></td>

                        <td>${e.productPrice}</td>
                        <td>${e.productDetail}</td>
                        <td>${e.manufacturerId.manufacturerName}</td>
                        <td><a href="DetailProductServlet?productId=${e.productId}">Detail</a> | <a href="#">Add to cart</a>
<!--                        <td><a href="UpdateProductServlet?productId=${e.productId}">Update</a> <a href="DeleteProductServlet?productId=${e.productId}"
                                                                                                  onclick="return confirm('are you sure delete this product ?');">Delete</a>-->
                        </td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
        
         
                <div id="pagination"></div>
        <script>
            function execSearch(offset) {

                $("#tblBody").empty();
                $.ajax({
                    url: 'SearchProductServlet',
                    type: 'GET',
                    contentType: "application/json",
                    dataType: 'json',
                    
                    data: {

                        searchText: document.getElementById('txtSearch').value,
                        searchType: document.getElementById('SearchBy').value,
                        priceFrom: document.getElementById('txtFrom').value,
                        priceTo: document.getElementById('txtTo').value,
                        
                    },
                    success: function (obj) {
                        
                      //  alert(obj.length);
                        console.log(obj);
                        var ajaxResult = [];
                       // alert(Pagination.page);
                        ajaxResult.push(obj);
                        $("#tblBody").empty();
                        var offset = 0;
                        var temp = Pagination.page-1;
                        for (var i = temp*4; offset < 4 ; offset++)
                        {
                            //alert(offset);
                            console.log('aaaaaa' +obj[i+offset]["productId"]);
                            var tr = "<tr>";
                            var td1 = "<td>" + obj[i+offset]["productId"] + "</td>";
                            var td2 = "<td>" + obj[i+offset]["productName"] + "</td>";
                            var td3 = "<td><img src='uploads/" + obj[i+offset]["productImage"] + "' height='80px'/></td>";
                            var td4 = "<td>" + obj[i+offset]["productPrice"] + "</td>";
                            var td5 = "<td>" + obj[i+offset]["productDetail"] + "</td>";
                            var td6 = "<td>" + obj[i+offset]["manufacturerName"] + "</td>";

                            var td7 = "<td> <a href='DetailProductServlet?productId=" + obj[i+offset]["productId"] + "'>Detail </a> | <a href='#'>Add to cart</a> </td></tr>";

                            $("#tblData").append(tr + td1 + td2 + td3 + td4 + td5 + td6 + td7);
                            console.log(i+offset+temp);
                            console.log(obj.length);
                            
                            if(i+offset+temp > obj.length-1)
                                break;
                        }
                       document.getElementById("pagination").innerHTML = "";
                       init;
                    }
                    ,
                    error: function (e) {
                        alert('Error: ' + e);
                    }
                });
            };
        </script>
    </body>
</html>
