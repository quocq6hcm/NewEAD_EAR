<%-- 
    Document   : admin-manufacturer
    Created on : Feb 25, 2018, 3:57:06 PM
    Author     : quocq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
      <div id='a'>
          <table id='datatable' class="table table-bordered" style="border: 10px">
                <caption><h1><p style="text-align: center">Product List</p></h1></caption>
                <thead>
                    <tr>
                        <td>ID</td>
                        <td>Name</td>
                        <td>Action</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="e">
                        <tr>
                            
                            <td>${e.manufacturerId}</td>
                            <td>${e.manufacturerName}</td>
                          
                            <td><a href="#"  class="btn btn-info" >Details</a> | 
                              
                                <a href="DeleteManufacturerServlet?manufacturerId=${e.manufacturerId}" class="btn btn-danger">Delete</a>      
                               

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

           </table>
            <div class="paging"></div>
        </div>

        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> nó éo chạy đc với cart--> 
        
        <script>
            $('#a table').datatable({
                pageSize: 4,
                sort: [true, true, false],
                filters: [true, true, false],
                filterText: 'Type to filter...'

                        //                pagingDivSelector: "#paging-first-datatable"
            });

        </script>
    </body>
</html>
