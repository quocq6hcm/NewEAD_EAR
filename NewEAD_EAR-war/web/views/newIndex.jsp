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
                <div style="float: right; cursor: pointer;">
                    <span class="glyphicon glyphicon-shopping-cart my-cart-icon"><span class="badge badge-notify my-cart-badge"></span></span>
                </div>
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
                            <td><a href="DetailProductServlet?productId=${e.productId}"  class="btn btn-info" >Detail</a> | 
                                <button id="nutAddToCart" class="btn btn-danger my-cart-btn" data-id="${e.productId}" data-name="${e.productName}" data-summary="${e.productDetail}" 
                                        data-price="${e.productPrice}" data-quantity="1" data-image="uploads/${e.productImage}">
                                    Add to Cart
                                </button>

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
                filters: [true, true, false, true, true, 'select'],
                filterText: 'Type to filter...'

                        //                pagingDivSelector: "#paging-first-datatable"
            });

        </script>

        <script type="text/javascript">
            $(function () {

                var goToCartIcon = function ($addTocartBtn) {
                    var $cartIcon = $(".my-cart-icon");
                    var $image = $('<img width="30px" height="30px" src="' + $addTocartBtn.data("image") + '"/>').css({"position": "fixed", "z-index": "999"});
                    $addTocartBtn.prepend($image);
                    var position = $cartIcon.position();
                    $image.animate({
                        top: position.top,
                        left: position.left
                    }, 500, "linear", function () {
                        $image.remove();
                    });
                }

                $('.my-cart-btn').myCart({
                    classCartIcon: 'my-cart-icon',
                    classCartBadge: 'my-cart-badge',
                    classProductQuantity: 'my-product-quantity',
                    classProductRemove: 'my-product-remove',
                    classCheckoutCart: 'my-cart-checkout',
                    affixCartIcon: true,
                    showCheckoutModal: true,
                    clickOnAddToCart: function ($addTocart) {
                        goToCartIcon($addTocart);
                    },
                    clickOnCartIcon: function ($cartIcon, products, totalPrice, totalQuantity) {
                        console.log("cart icon clicked", $cartIcon, products, totalPrice, totalQuantity);
                       
                    },
                    checkoutCart: function (products, totalPrice, totalQuantity) {
                        console.log("checking out", products, totalPrice, totalQuantity);
                    },
                    getDiscountPrice: function (products, totalPrice, totalQuantity) {
                        console.log("calculating discount", products, totalPrice, totalQuantity);
                        console.log(products);
                        sessionStorage.setItem('myArray', products);
                        // alert(sessionStorage.getItem('myArray'))
                        
                        return totalPrice * 0.5;
                    }
                });

            });
        </script>

    </body>
</html>
