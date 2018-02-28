<%-- 
    Document   : login
    Created on : Feb 7, 2018, 1:40:18 PM
    Author     : quocq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login page!</h1>
        
        <form method="post" action="LoginServlet">
            Username: <input type="text" id="username" name="username" /> <br/>
            Password: <input type="password" id="password" name="password" /> <br/>
            <br/>
            
            <input type="submit" value="Login"/>
            
        </form>
        <p>Don't have account yet? click to <a href='RegisterServlet'> register </a>!
            <br/>

            ${errorLogin}
    </body>
</html>
