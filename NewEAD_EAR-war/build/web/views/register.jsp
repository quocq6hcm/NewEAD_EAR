<%-- 
    Document   : register
    Created on : Feb 7, 2018, 1:37:50 PM
    Author     : quocq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <h1>Register Page!</h1>
        <form action="RegisterServlet" method="post">
            Username: <input type="text" name="username" id="username" /> <br/>
            Password: <input type="password" name="password" id="password"/> <br/>
<!--            Re-password:-->
            Fullname: <input type="text" name="fullname" id="fullname" /> <br/>
            Photo: <input type="text" name="photo" id="photo" /> <br/>
            email: <input type="text" name="email" id="email" /> <br/>
            <br/>
            <input type="submit" value="Register"/>
            <input type="button" value="Reset" onclick=""/>
        </form>
    </body>
</html>
