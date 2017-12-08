<%-- 
    Document   : Profile
    Created on : Nov 3, 2017, 4:55:10 PM
    Author     : Asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/index.css">
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
                        <button type="button" class="btn btn-default navbar-btn margin-3px"><a href="LogoutServlet">Logout</a></button>

                    </ul>
                </div>
            </div>
        </nav>
        <%model.Member member = (model.Member) session.getAttribute("member");%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-center">
                       Profile
                    </h3>
                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-2">
                            <img src="img/brand.png" width="100" />
                            <h3>
                                <%= member.getUsername()%>
                            </h3>
                        </div>
                        <div class="col-md-6">
                            <form role="form">
                                <div class="form-group">

                                    <label for="exampleInputEmail1">
                                        <%= member.getEmail()%>
                                    </label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" />
                                </div>
                                <div class="form-group">

                                    <label for="exampleInputPassword1">
                                        Password
                                    </label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" />
                                </div>
                                <div class="form-group">

                                    <label for="exampleInputFile">
                                        File input
                                    </label>
                                    <input type="file" id="exampleInputFile" />
                                    <p class="help-block">
                                        Example block-level help text here.
                                    </p>
                                </div>
                                <div class="checkbox">

                                    <label>
                                        <input type="checkbox" /> Check me out
                                    </label>
                                </div> 
                                <button type="submit" class="btn btn-default">
                                    Submit
                                </button>
                            </form>
                        </div>
                        <div class="col-md-2">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
