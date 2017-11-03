<%-- 
    Document   : search
    Created on : Nov 1, 2017, 12:57:50 PM
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
        <link rel="stylesheet" type="text/css" href="index.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Prompt:300">
        <title>Co-Working-Space</title>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <% int check = 0;
            if (request.getAttribute("check") != null) {
                check = (int) request.getAttribute("check");
            }%>
        <nav class="navbar navbar-default navbar-edit navbar-static-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand brand-edit" href="index.html">
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
                    <% if (check == 1) {%>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Link</a></li>
                        <li><a href="#">Link</a></li>
                        <li><a href="#">Link</a></li>
                        <li><a href="#">Link</a></li>
                    </ul>
                    <%} else if (check != 1) {%>
                    <ul class="nav navbar-nav navbar-right">
                        <button type="button" class="btn btn-default navbar-btn"  data-toggle="modal" data-target="#registerModal">Sign up</button>
                        <button type="button" class="btn btn-default navbar-btn margin-3px" data-toggle="modal" data-target="#loginModal">Login</button>

                    </ul><%}%>


                </div>
            </div>
        </nav>
        <!-- <img  class="img-cover " src="img/img-slide2.jpg" style="width: 100%"> -->
        <div class="head-bg-cover" >

            <div class="align-center">
                <center><p class="head-name">CO-WORKING SPACE</p>
                    <div class="row">
                        <div class="col-md-12">
                            <h2><input class="search-input" type="text" name="search" value="" placeholder=" searching . . ." />
                                <a href="">
                                    <img alt="search" src="img/search1.png" style="width: 40px">
                                </a>
                            </h2>
                        </div>
                    </div>
                </center>
            </div>
        </div>
        <div class="row-fluid margin-top">
            <div class="col-md-1"></div>
            <div class="col-md-10">

                <div class="col-md-4">
                    <div class="w3-card-4 card-margin">
                        <div class="panel-thumbnail">
                            <img src="img/img-slide2.jpg" class="img-responsive" style="width: 100%">
                        </div>
                        <div class="panel-body">
                            <p class="lead" >TEST</p>
                            <p>Test Test Hello Test</p>
                        </div>
                    </div>

                    <div class="w3-card-4">
                        <div class="panel-thumbnail">
                            <img src="img/img-slide2.jpg" class="img-responsive" style="width: 100%">
                        </div>
                        <div class="panel-body">
                            <p class="lead" >TEST</p>
                            <p>Test Test Hello Test</p>
                        </div>
                    </div>
                    <div class="w3-card-4 card-margin">
                        <div class="panel-thumbnail">
                            <img src="img/img-slide2.jpg" class="img-responsive" style="width: 100%">
                        </div>
                        <div class="panel-body">
                            <p class="lead" >TEST</p>
                            <p>Test Test Hello Test</p>
                        </div>
                    </div>
                </div>


                <div class="col-md-4">
                    <div class="w3-card-4 card-margin">
                        <div class="panel-thumbnail">
                            <img src="img/img-slide2.jpg" class="img-responsive" style="width: 100%">
                        </div>
                        <div class="panel-body">
                            <p class="lead" >TEST</p>
                            <p>Test Test Hello Test</p>
                        </div>
                    </div>
                    <div class="w3-card-4 card-margin">
                        <div class="panel-thumbnail">
                            <img src="img/img-slide2.jpg" class="img-responsive" style="width: 100%">
                        </div>
                        <div class="panel-body">
                            <p class="lead" >TEST</p>
                            <p>Test Test Hello Test</p>
                        </div>
                    </div>
                    <div class="w3-card-4 card-margin">
                        <div class="panel-thumbnail">
                            <img src="img/img-slide2.jpg" class="img-responsive" style="width: 100%">
                        </div>
                        <div class="panel-body">
                            <p class="lead" >TEST</p>
                            <p>Test Test Hello Test</p>
                        </div>
                    </div>


                </div>


                <div class="col-md-4">
                    <div class="w3-card-4 card-margin">
                        <div class="panel-thumbnail">
                            <img src="img/img-slide2.jpg" class="img-responsive" style="width: 100%">
                        </div>
                        <div class="panel-body">
                            <p class="lead" >TEST</p>
                            <p>Test Test Hello Test</p>
                        </div>
                    </div>
                    <div class="w3-card-4 card-margin">
                        <div class="panel-thumbnail">
                            <img src="img/img-slide2.jpg" class="img-responsive" style="width: 100%">
                        </div>
                        <div class="panel-body">
                            <p class="lead" >TEST</p>
                            <p>Test Test Hello Test</p>
                        </div>
                    </div>
                    <div class="w3-card-4 card-margin">
                        <div class="panel-thumbnail">
                            <img src="img/img-slide2.jpg" class="img-responsive" style="width: 100%">
                        </div>
                        <div class="panel-body">
                            <p class="lead" >TEST</p>
                            <p>Test Test Hello Test</p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-1"></div>
        </div>
    </body>
</html>
