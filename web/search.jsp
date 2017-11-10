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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Prompt:300">
        <title>Co-Working-Space</title>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <% int check = 0;
            if (session.getAttribute("check") != null) {
                check = (int) session.getAttribute("check");
            }%>
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
                    <% if (check == 1) {%>
                    <%model.Member member = (model.Member) session.getAttribute("member");%>
                    <div class="collapse navbar-collapse" id="mynavbar">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="menu-bar"><a href="#">Link</a></li>
                            <li class="menu-bar"><a href="#">Link</a></li>
                            <li class="menu-bar"><a href="#">Link</a></li>
                            <li class="menu-bar"><a href="#">Link</a></li>
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
                            <form action="SearchServlet" method="POST">
                                <div class="row input-group search-bar">
                                    <input name="search" type="text" class="form-control" placeholder="Location or Lessor or Type Room or Type Desk.." />
                                    <span class="input-group-btn">
                                        <button class="btn btn-default btn-search" type="submit"> <span class="glyphicon glyphicon-search"></span> </button>
                                    </span></div>
                            </form>
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
        <!-- Login Modal -->
        <div id="loginModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Login Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Login</h4>
                    </div>
                    <div class="modal-body">
                        <form action="LoginServlet" method="post">
                            <% if (check == 2) {%>
                            <h3 style="text-align: center;color: red;">กรอกรหัสผ่านผิด</h3>
                            <%} else if (check == 3) {%>
                            <h3 style="text-align: center;color: red;">ไม่พบชื่อผู้ใช้นี้</h3><%}%>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" class="form-control" id="username" name="username">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password">
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="remember"> Remember me</label>
                            </div>
                            <center><button type="Login" class="btn btn-default">Submit</button></center>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary step step-1" data-step="1" onclick="sendEvent('#demo-modal-1', 2)">Continue</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Register Modal -->
        <div id="registerModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Register Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title register-modal-step1">Sign up : Step 1</h4>
                        <h4 class="modal-title register-modal-step2">Sign up : Step 2</h4>
                    </div>
                    <div class="modal-body">
                        <form action="RegisterServlet" method="post">
                            <div class=" register-modal-step1">
                                <p>Please enter your information in to the fill.</p>
                                <div class="form-group">
                                    <label for="firstname">First name</label>
                                    <input type="text" class="form-control" id="firstname" name="firstname">
                                </div>
                                <div class="form-group">
                                    <label for="lastname">Last name</label>
                                    <input type="text" class="form-control" id="lastname" name="lastname">
                                </div>
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" id="username" name="username">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="text" class="form-control" id="phone" name="phone">
                                </div>
                                <p>Who are you?</p>
                                <ul class="who-selector-register">
                                    <li><input type="radio" id="rental" name="who-selector" value="2">
                                        <label for="rental">Rental</label></li>
                                    <li><input type="radio" id="lessor" name="who-selector" value="1">
                                        <label for="lessor">Lessor</label></li>
                                </ul><br>
                                <button type="button" class="btn btn-default" id="button-register-nextstep">Next</button>
                            </div>
                            <div class="register-modal-step2">
                                <p>Just few step up! Upload file to identity yours.</p>
                                <p>ID Cards image file</p>
                                <p>Image file size should be smaller than 1 MB</p>
                                <input type="file" name="idcardfile"/>
                                <p>Profile image</p>
                                <input type="file" name="profilefile"/>


                                <button type="Sign Up!" class="btn btn-default">Submit</button>
                            </div>
                        </form>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="button-register-close">Close</button>
                    </div>
                </div>

            </div>
        </div>


        <div id="regiserrorModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Login Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Register</h4>
                    </div>
                    <div class="modal-body">
                        <% if (check == 4) {%>
                        สมัครสามาชิกเรียบร้อย
                        <%}%>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <% if (check == 2 || check == 3) { %>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#loginModal').modal('show');
            });
        </script>
        <%} else if (check == 4) {%>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#regiserrorModal').modal('show');
            });
        </script>
        <%}%>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".register-modal-step2").hide();
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#button-register-nextstep").click(function () {
                    $(".register-modal-step1").hide();
                    $(".register-modal-step2").show();
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#button-register-close").click(function () {
                    $(".register-modal-step1").delay(1000).show(0);
                    $(".register-modal-step2").delay(1000).hide(0);
                });
            });
        </script>
    </body>
</html>
