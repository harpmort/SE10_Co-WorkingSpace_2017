<%-- 
    Document   : landing
    Created on : Oct 27, 2017, 5:38:41 PM
    Author     : Asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="login.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Prompt:300">
        <title>Co-Working-Space</title>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-edit navbar-static-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand brand-edit" href="index.jsp">
                        <img alt="Brand" src="img/brand.png" style="width: 78px">
                    </a>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mynavbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar-color icon-bar"></span>
                        <span class="icon-bar-color icon-bar"></span>
                        <span class="icon-bar-color icon-bar"></span> 
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="mynavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="menu-bar"><a href="#">Link</a></li>
                        <li class="menu-bar"><a href="#">Link</a></li>
                        <li class="menu-bar"><a href="#">Link</a></li>
                        <li class="menu-bar"><a href="#">Link</a></li>
                            <%model.Member member = (model.Member) session.getAttribute("member");%>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle menu-bar" data-toggle="dropdown"><%= member.getUsername()%><strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="Profile.jsp">View Profile</a>
                                </li>
                                <li>
                                    <a href="LogoutServlet">Logout</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="head-bg-cover" >

            <div class="align-center">
                <center><p class="head-name">CO-WORKING SPACE</p>
                    <div class="row">
                        <div class="col-md-12">
                            <h2><input class="search-input" type="text" name="search" value="" placeholder=" searching . . ."/>
                                <!--ต้องมีเซิพเลตและส่งค่า check มาด้วย-->
                                <a href="search.jsp">
                                    <img alt="search" src="img/search1.png" style="width: 40px">
                                </a></h2>
                        </div>
                    </div>
                </center>
            </div>
        </div>
    </body>
</html>
