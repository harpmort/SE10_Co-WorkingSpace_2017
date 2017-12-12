<%-- 
    Document   : viewdetail
    Created on : Nov 15, 2017, 9:23:08 AM
    Author     : Asus
--%>
<%@page import="util.ReFormDisabledTime"%>
<%@page import="java.util.List"%>
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
        <link rel="stylesheet" href="js/bootstrap-datetimepicker.min.js" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.min.css">
        <script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
        <script type="text/javascript" src="js/locales/bootstrap-datetimepicker.ua.js"></script>
        <script type="text/javascript" src="js/moment.min.js"></script>
        <script type="text/javascript" src="js/moment.js"></script>
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
                        <img alt="Brand" src="img/cws.png" style="width: 78px">
                    </a>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mynavbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar-color icon-bar"></span>
                        <span class="icon-bar-color icon-bar"></span>
                        <span class="icon-bar-color icon-bar"></span> 
                    </button>
                </div>

                <div class="collapse navbar-collapse" id="mynavbar">
                    <%int type = (int) session.getAttribute("type");%>
                    <% if (check == 1) {%>
                    <%if (type != 3) {%>
                    <%model.Member member = (model.Member) session.getAttribute("member");%>
                    <div class="collapse navbar-collapse" id="mynavbar">
                        <ul class="nav navbar-nav navbar-right">
                            <% if (type == 1) {%>
                            <li class="menu-bar"><a href="landing.jsp">Home</a></li>
                            <li class="menu-bar"><a href="insertcws.jsp">Add Space</a></li>
                            <li class="menu-bar"><a href="editspace.jsp">Edit Space</a></li>
                            <li class="menu-bar"><a href="BookingServlet">List Booking</a></li>
                            <li class="menu-bar"><a href="HistoryServlet">History</a></li>
                                <%} else if (type == 2) {%>
                            <li class="menu-bar"><a href="landing.jsp">Home</a></li>
                            <li class="menu-bar"><a href="BookingServlet">List Booking</a></li>
                            <li class="menu-bar"><a href="HistoryServlet">History</a></li>
                                <%}%>
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
                            <% if (member.getUnReadMessage() != 0) { %>
                            <li class="menu-bar"><div class="message-main">
                                    <div id="messagediv" data-toggle="messagetooltip" data-placement="bottom" title="คุณมีข้อความแจ้งเตือน!"><img class="message-img" src="img/message.png"><div class="message-count"><%= member.getUnReadMessage() %></div></div>
                                </div></li>
                                <% } else { %>
                            <li class="menu-bar"><div class="message-main">
                                    <div id="messagediv2" data-toggle="nomessagetooltip" data-placement="bottom" title="คุณไม่มีข้อความใหม่"><img class="message-img" src="img/message.png"></div>
                                </div></li>

                            <% } %>
                        </ul>

                    </div>
                    <%} else if (type == 3) {%>
                    <%model.Admin admin = (model.Admin) session.getAttribute("admin");%>
                    <div class="collapse navbar-collapse" id="mynavbar">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="menu-bar"><a href="landing.jsp">Home</a></li>
                            <li class="menu-bar"><a href="ViewapproveServlet">Approve Lessor</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle menu-bar" data-toggle="dropdown"><%= admin.getUsername()%><strong class="caret"></strong></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="LogoutServlet">Logout</a>
                                    </li>
                                </ul>
                            </li>
                            <% if (admin.getUnReadMessage() != 0) { %>
                            <li class="menu-bar"><div class="message-main">
                                    <div data-toggle="messagetooltip" data-placement="bottom" title="คุณมีข้อความแจ้งเตือน!"><img class="message-img" src="img/message.png"><div class="message-count">10</div></div>
                                </div></li>
                                <% } else { %>
                            <li class="menu-bar"><div class="message-main">
                                    <div data-toggle="nomessagetooltip" data-placement="bottom" title="คุณไม่มีข้อความใหม่"><img class="message-img" src="img/message.png"></div>
                                </div></li>

                            <% } %>
                        </ul>
                    </div>
                    <%}%>
                    <%} else if (check != 1) {%>
                    <ul class="nav navbar-nav navbar-right">
                        <button type="button" class="btn btn-default navbar-btn"  data-toggle="modal" data-target="#registerModal">Sign up</button>
                        <button type="button" class="btn btn-default navbar-btn margin-3px" data-toggle="modal" data-target="#loginModal">Login</button>
                    </ul><%}%>
                </div>
            </div>
        </nav>
        <%model.Space space = (model.Space) session.getAttribute("space");
            List<String> takedslot = space.getTakedslot();
            String takedslot_st = "";
            String takedamount_st = "";
            List<String> takedamount = space.getTakedamount();
            if(space.getType_room().equals("Share Room")){
                takedslot = new ReFormDisabledTime().toSharedRoomDisabled(takedamount);
            }
            for (int i = 0; i < takedslot.size(); i++) {
                takedslot_st += takedslot.get(i);
                if (i < takedslot.size() - 1) {
                    takedslot_st += ",";
                }
            }
            for (int i = 0; i < takedamount.size(); i++) {
                takedamount_st += takedamount.get(i);
                if (i < takedamount.size() - 1) {
                    takedamount_st += ",";
                }
            }
        %>
        <form action="ReserServlet" method="POST">
            <div class="margin-left type-room-name">
                <h1><%= space.getName()%></h1>
                <h3>by <%= space.getUsername()%></h3>
                <%String approve_status = space.getApprove_status();
                if (approve_status.equals("Approved")) {%>
                <%int rating = space.getRating();
                if( rating == 0){%>
                    <img class="" src="img/0.png" style="height: 20px;"/> จากผู้ให้เช่า <%= space.getNum_review()%> คน
                <%}else if(rating == 1){%>
                    <img class="" src="img/1.png" style="height: 20px;"/> จากผู้ให้เช่า <%= space.getNum_review()%> คน
                <%}else if(rating == 2){%>
                    <img class="" src="img/2.png" style="height: 20px;"/> จากผู้ให้เช่า <%= space.getNum_review()%> คน
                <%}else if(rating == 3){%>
                    <img class="" src="img/3.png" style="height: 20px;"/> จากผู้ให้เช่า <%= space.getNum_review()%> คน
                <%}else if(rating == 4){%>
                    <img class="" src="img/4.png" style="height: 20px;"/> จากผู้ให้เช่า <%= space.getNum_review()%> คน
                <%}else if(rating == 5){%>
                    <img class="" src="img/5.png" style="height: 20px;"/> จากผู้ให้เช่า <%= space.getNum_review()%> คน
                <%}}else{%>
                <h6>ผู้ให้เช่าคนนี้ยังไม่ได้ทำการยืนยันตัวตน</h6>
                <%}%>
            </div>


            <div class="container zero-gap" style="width: 80%">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <% int count = space.getImg().length;%>
                        <%for (int i = 0; i < count; i++) {
                                if (i == 0) {%><li data-target="#myCarousel" data-slide-to="0" class="active"></li><%} else {%>
                        <li data-target="#myCarousel" data-slide-to="<%=i%>"></li>
                            <%}
                                }%>

                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <% for (int j = 0; j < count; j++) {
                                if (j == 0) {%><div class="item active"><img class="img-detail-crop" src="<%=space.getImg()[j]%>" style="width:100%;"></div><%} else {%>
                        <div class="item"><img class="img-blueprint-crop" src="<%=space.getImg()[j]%>" style="width:100%;"></div>
                            <%}
                                }%>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>

            <div class="margin-top ">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <!-- //Icon & Room Detail -->
                    <div class="row icon-room-detail">
                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-2">
                                    <img src="img/actions.png" style="width: 32px">
                                </div>
                                <div class="col-md-10">
                                    <p style="font-size:initial;"><%= space.getTotal_desk()%></p>
                                </div>
                            </div><br>
                            <div class="row">
                                <div class="col-md-2">
                                    <img src="img/table.png" style="width: 32px">
                                </div>
                                <div class="col-md-10">
                                    <p style="font-size:initial;"><%= space.getType_desk()%></p>
                                </div>
                            </div><br>
                            <div class="row">
                                <div class="col-md-2">
                                    <img src="img/clock.png" style="width: 32px">
                                </div>
                                <div class="col-md-10">
                                    <p style="font-size:initial;"><%= space.getOpen_time()%> - <%= space.getClose_time()%></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-2">
                                    <img src="img/plans.png" style="width: 32px">
                                </div>
                                <div class="col-md-10">
                                    <p style="font-size:initial;"><%= space.getSize_room()%></p>
                                </div>
                            </div><br>
                            <div class="row">
                                <div class="col-md-2">
                                    <img src="img/conference.png" style="width: 32px">
                                </div>
                                <div class="col-md-10">
                                    <p style="font-size:initial;"><%= space.getType_room()%></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="">
                        <!-- Booking Detail -->
                        <div class="">
                            <div class="book-bg margin-top book-margin">
                                <div class="book-title">
                                    <center>
                                        <div class="price"><p id="totalPrice">Price: <%= space.getPrice()%></p> <p>Available: <span id="available">จองต่อรอบได้สูงสุด 10 คน (เลือกวันและเวลาอีกครั้งเพื่อตรวจสอบ)</span> person</p></div>
                                    </center>
                                </div>
                                <div class="row text-pos">
                                    <div class="col-md-6 ">
                                        <div class="col-md-4 magin-book">
                                            <div class="text-edit"><p>วันที่ : </p></div>
                                            <div class="text-edit"><p>เวลาเริ่ม : </p></div>
                                        </div>
                                        <div class="col-md-7">

                                            <input onchange="mainSetMaxAmount()" type="text" class="form-control form-control-edit" readonly="true" value="" id="datetimepicker" name="date">
                                            <input onchange="mainSetMaxAmount()" type="text" class="form-control form-control-edit" readonly="true" id="datetimepicker2" name="time_start">
                                        </div>
                                    </div>
                                    <% String type_room = space.getType_room();
                                        if (type_room.equals("Share Room")) {%>
                                    <div class="col-md-6">
                                        <div class="col-md-4">
                                            <div class="text-edit">จำนวนคน : </div>
                                            <div class="text-edit">เวลาสิ้นสุด : </div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="input-group form-control-edit">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" id="btn-minus" data-field="amount" type="button">
                                                        <i class="glyphicon glyphicon-minus"></i>
                                                    </button>
                                                </span>
                                                <input id="input_people" class="form-control input-number input-number-pos form-control-edit" type="text" min="1" max="10" value="1" name="amount">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" id="btn-plus" data-field="amount" type="button">
                                                        <i class="glyphicon glyphicon-plus"></i>
                                                    </button>
                                                </span>
                                            </div>
                                            <input onchange="mainSetMaxAmount()" type="text" data-toggle="endtimetooltip" title="กดเวลาเริ่มก่อนสิ!" class="form-control" value=""  readonly="true" id="datetimepicker3" name="time_end">
                                        </div>
                                    </div>
                                    <%} else {%>
                                    <div class="col-md-6">
                                        <div class="col-md-4">
                                            <div class="text-edit">จำนวนคน : </div>
                                            <div class="text-edit">เวลาสิ้นสุด : </div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="text-edit"> จองเหมาทั้งห้อง </div>
                                            <input type="text" data-toggle="endtimetooltip" title="กดเวลาเริ่มก่อนสิ!" class="form-control" value=""  readonly="true" id="datetimepicker3" name="time_end">
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                                <%if (check == 1 && type == 2) {%>
                                <div class="book-btn">
                                    <center><button class="btn btn-default btn-margin">Book</button></center>

                                </div>
                                <%} else if (type == 1 || type == 3) {%>
                                <div class="book-btn">
                                    <center><h3>ไม่สามารถทำรายการจองได้เนื่องจากไม่ใช่ผู้เช่า</h3></center>
                                </div>
                                <%} else {%>
                                <div class="book-btn">
                                    <center><h3>กรุณาเข้าสู่ระบบก่อนทำการจองพื้นที่</h3></center>
                                </div>
                                <%}%>
                            </div>
                        </div>


                        <div class="margin-top detail-des">
                            <div class="container">
                                <div class="descript-edit">Description</div>
                                <div class="get-des" ><%= space.getDescription()%></div>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="col-md-2"></div>

            </div>

        </form>
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
                            <center><button type="Login" class="btn btn-default">Submit</button></center>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Register Modal -->
        <div id="registerModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Register Modal content-->
                <div class="modal-content">
                    <form action="RegisterServlet" method="POST" id="register_form">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title register-modal-step1">Sign up : Step 1</h4>
                            <h4 class="modal-title register-modal-step2">Sign up : Step 2</h4>
                        </div>
                        <div class="modal-body">
                            <div class=" register-modal-step1">
                                <p>Please enter your information in to the fill.</p>
                                <p id="errorregister-m"></p>
                                <div class="form-group" id="form_fname">
                                    <label for="firstname">First name</label>
                                    <input type="text" class="form-control" id="firstname" name="firstname">
                                    <p class="errorregister-m" id="error_fname"></p>
                                </div>
                                <div class="form-group" id="form_lname">
                                    <label for="lastname">Last name</label>
                                    <input type="text" class="form-control" id="lastname" name="lastname">
                                    <p class="errorregister-m" id="error_lname"></p>
                                </div>
                                <div class="form-group" id="form_uname">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" id="username_r" name="username">
                                    <p class="errorregister-m" id="error_uname"></p>
                                </div>
                                <div class="form-group" id="form_pword">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password_r" name="password">
                                    <p class="errorregister-m" id="error_pword"></p>
                                </div>
                                <div class="form-group" id="form_email">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email">
                                    <p class="errorregister-m" id="error_email"></p>
                                </div>
                                <div class="form-group" id="form_phone">
                                    <label for="phone">Phone</label>
                                    <input type="text" class="form-control" id="phone" name="phone">
                                    <p class="errorregister-m" id="error_phone"></p>
                                </div>
                                <div class="form-group">
                                    <label for="profileimg">Profile Image</label>
                                    <input type="file" id="profileimg" name="profileimg"/>
                                </div>
                                <p>Who are you?</p>
                                <ul class="who-selector-register">
                                    <li><input type="radio" id="rental" name="who-selector" value="2">
                                        <label for="rental">Rental</label></li>
                                    <li><input type="radio" id="lessor" name="who-selector" value="1">
                                        <label for="lessor">Lessor</label></li>
                                </ul><br>
                            </div>
                            <div class="register-modal-step2">
                                <p>Upload file to identity yours.</p>
                                <div class="form-group">
                                    <label for="idcardimg">ID Card Image</label>
                                    <p>Image file size should be smaller than 1 MB</p>
                                    <input type="file" name="idcardfile"/>
                                </div>
                                <div class="g-recaptcha" data-sitekey="6LeDNzcUAAAAANv5hg7ttwK6tdLrcXIjcCnTMl4E"></div>
                            </div>
                            <% if (check == 4) {%>
                            <div class="register-modal-complete">
                                <p>You registration has been complete. </p>
                            </div>
                            <%}%>
                            <% if (check == 8) {%>
                            <div class="register-modal-existed">
                                <p>Your email has been existed, Please use another email. </p>
                            </div>
                            <%}%>
                            <% if (check == 16) {%>
                            <div class="register-modal-recap">
                                <p>Something wrong, Please register again.</p>
                            </div>
                            <%}%>
                        </div>
                        <div class="modal-footer modal-edit">
                            <button type="submit" value="submit" class="btn btn-primary" id="submit_bttn">Submit</button>
                            <button type="button" class="btn btn-primary" id="button-register-nextstep">Next</button>
                            <button id="back_bttn" type="button" class="btn btn-default" id="button-register-close">Back</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" id="button-register-close">Close</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
        <!-- Modal Message -->
        <div class="modal fade" id="messageModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Message Notification</h4>
                    </div>
                    <div class="modal-body">
                        <div id="messagebody"></div>
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
        <%} else if (check == 4 || check == 8 || check == 16) {%>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#registerModal').modal('show');
                alertregister();
            });
        </script>
        <%}
            check = 0;%>

        <script type="text/javascript">
            $(document).ready(function () {
                $(".register-modal-step2").hide();
                $("#back_bttn").hide();
                $("#submit_bttn").hide();
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#button-register-nextstep").click(function () {
                    $(".register-modal-step1").hide();
                    $(".register-modal-step2").show();
                    $("#back_bttn").show();
                    $("#button-register-nextstep").hide();
                    $("#submit_bttn").show();
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#back_bttn").click(function () {
                    $(".register-modal-step1").show();
                    $(".register-modal-step2").hide();
                    $("#back_bttn").hide();
                    $("#button-register-nextstep").show();
                    $("#submit_bttn").hide();
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#button-register-close").click(function () {
                    $(".register-modal-step1").delay(1000).show(0);
                    $(".register-modal-step2").delay(1000).hide(0);
                    $("#back_bttn").delay(1000).hide(0);
                    $("#button-register-nextstep").delay(1000).show(0);
                    $("#submit_bttn").delay(1000).hide(0);
                    $(".register-modal-complete").hide();
                    $(".register-modal-existed").hide();
                    $(".register-modal-recap").hide();
                });
            });
        </script>
        <script type="text/javascript">
            function alertregister() {
                $(".register-modal-step1").hide();
                $(".register-modal-step2").hide();
                $("#back_bttn").hide();
                $("#button-register-nextstep").hide();
                $("#submit_bttn").hide();
            }
        </script>
        <script type="text/javascript">
            var head_replacetxt = "<p class=\"errorregister-m\" id=\"";
            var error_end_replacetxt = "\">Required</p>";
            var unerror_end_replacetxt = "\"></p>";
            var form_fname = $('#form_fname');
            var form_lname = $('#form_lname');
            var form_uname = $('#form_uname');
            var form_pword = $('#form_pword');
            var form_email = $('#form_email');
            var form_phone = $('#form_phone');
            var fname = $("#firstname");
            var lname = $("#lastname");
            var uname = $("#username_r");
            var pword = $("#password_r");
            var email = $("#email");
            var phone = $("#phone");
            var email_flag = true;
            $(document).ready(function () {
                deactivate_next();
                fname.blur(function () {
                    if ($(this).val().length === 0) {
                        $("#error_fname").replaceWith(head_replacetxt + "error_fname" + error_end_replacetxt);
                        form_fname.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else {
                        $("#error_fname").replaceWith(head_replacetxt + "error_fname" + unerror_end_replacetxt);
                        form_fname.removeClass('has-error', 'has-feedback');
                        activate_next();
                    }
                });
                lname.blur(function () {
                    if ($(this).val().length === 0) {
                        $("#error_lname").replaceWith(head_replacetxt + "error_lname" + error_end_replacetxt);
                        form_lname.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else {
                        $("#error_lname").replaceWith(head_replacetxt + "error_lname" + unerror_end_replacetxt);
                        form_lname.removeClass('has-error', 'has-feedback');
                        activate_next();
                    }
                });
                uname.blur(function () {
                    if ($(this).val().length === 0) {
                        $("#error_uname").replaceWith(head_replacetxt + "error_uname" + error_end_replacetxt);
                        form_uname.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else {
                        $("#error_uname").replaceWith(head_replacetxt + "error_uname" + unerror_end_replacetxt);
                        form_uname.removeClass('has-error', 'has-feedback');
                        activate_next();
                    }
                });
                pword.blur(function () {
                    if ($(this).val().length === 0) {
                        $("#error_pword").replaceWith(head_replacetxt + "error_pword" + error_end_replacetxt);
                        form_pword.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else if ($(this).val().length < 8) {
                        $("#error_pword").replaceWith(head_replacetxt + "error_pword\">Password will contain with more than 8 character</p>");
                        form_pword.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else {
                        $("#error_pword").replaceWith(head_replacetxt + "error_pword" + unerror_end_replacetxt);
                        form_pword.removeClass('has-error', 'has-feedback');
                        activate_next();
                    }
                });
                email.blur(function () {
                    if ($(this).val().length === 0) {
                        $("#error_email").replaceWith(head_replacetxt + "error_email" + error_end_replacetxt);
                        form_email.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else {
                        if (isEmail(email.val())) {
                            $("#error_email").replaceWith(head_replacetxt + "error_email" + unerror_end_replacetxt);
                            form_email.removeClass('has-error', 'has-feedback');
                            activate_next();
                            email_flag = false;
                        } else {
                            $("#error_email").replaceWith(head_replacetxt + "error_email\">Email not correct.</p>");
                            form_email.addClass('has-error', 'has-feedback');
                            deactivate_next();
                        }
                    }
                });
                phone.blur(function () {
                    if ($(this).val().length === 0) {
                        $("#error_phone").replaceWith(head_replacetxt + "error_phone" + error_end_replacetxt);
                        form_phone.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else {
                        $("#error_phone").replaceWith(head_replacetxt + "error_phone" + unerror_end_replacetxt);
                        form_phone.removeClass('has-error', 'has-feedback');
                        activate_next();
                    }
                });
                $("#idcardimg").blur(function () {
                    if ($(this).val().length === 0) {
                        alert("If you not upload your ID Card, your profile status are not verify\n\
            and it's impact on your credibility.");
                    }
                });
            });
            function activate_next() {
                $(document).ready(function () {
                    if (fname.val().length === 0 || lname.val().length === 0 || uname.val().length === 0
                            || pword.val().length < 8 || email.val().length === 0 || phone.val().length === 0 || email_flag) {
                    } else {
                        $("#button-register-nextstep").removeClass('disabled');
                        $("#button-register-nextstep").removeAttr("disabled");
                    }
                });
            }
            function deactivate_next() {
                $(document).ready(function () {
                    $("#button-register-nextstep").addClass('disabled');
                    $("#button-register-nextstep").attr("disabled", true);
                });
            }
            function isEmail(email) {
                var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                return regex.test(email);
            }


        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#submit_bttn").click(function (e) {
                    e.preventDefault();
                    $("#register_form").submit();
                });
            });
        </script>

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
        <script type="text/javascript">
            var takedslot = new String("<%= takedslot_st%>");
            console.log("takedslot: " + takedslot);

            $('#datetimepicker').datetimepicker({
                format: 'dd-mm-yyyy',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                minView: 2,
                forceParse: 0,
                startDate: new Date()
            });

            $('#datetimepicker2').datetimepicker({
                format: 'hh:ii',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 0,
                startView: 1,
                minView: 0,
                maxView: 0,
                forceParse: 0,
                formatViewType: 'time'
            });

            $(document).ready(function () {
                var dtp = $('#datetimepicker2');
                var stat = false;
                $('#datetimepicker2').click(function () {
                    var takedslot_li = takedslot.split(",");
                    var datepull = $('#datetimepicker').val().toString();
                    var datepull_temp = datepull.split("-");
                    var datepull_ok = datepull_temp.join("/");
                    var slot_per_day = [];
                    var opentime = new String("<%= space.getOpen_time()%>");
                    var closetime = new String("<%= space.getClose_time()%>");
                    slot_per_day.push("00:00-" + opentime);
                    for (var i = 0; i < takedslot_li.length; i++) {
                        var temp = takedslot_li[i].toString().split("-")[0];
                        if (temp === datepull_ok) {
                            var temp2 = takedslot_li[i].toString().split("-")[1].toString() + "-";
                            var temp3 = takedslot_li[i].toString().split("-")[2].toString();
                            slot_per_day.push(temp2 + temp3);
                        }
                    }
                    slot_per_day.push(closetime + "-23:59");
                    $('#datetimepicker2').datetimepicker("setTimeDisabledInterval", slot_per_day);
                    $('#datetimepicker3').datetimepicker("setTimeDisabledInterval", slot_per_day);
                    $('[data-toggle="endtimetooltip"]').tooltip('disable');
                });

                $('#datetimepicker3').click(function () {
                    if (dtp.val().length === 0) {
                        stat = false;
                        $('[data-toggle="endtimetooltip"]').tooltip('enable');
                    } else {
                        stat = true;
                        $('[data-toggle="endtimetooltip"]').tooltip('disable');
                        $('#datetimepicker3').datetimepicker("setRelationStart", dtp.val());
                    }
                    if (!stat) {
                        $('#datetimepicker3').datetimepicker("hide");
                    }
                });
            });
            $('#datetimepicker3').datetimepicker({
                format: 'hh:ii',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 0,
                startView: 1,
                minView: 0,
                maxView: 0,
                forceParse: 0,
                formatViewType: 'time'
            });
            $('#datetimepicker3').datetimepicker("setStartEndType", "end");
            $('#datetimepicker3').datetimepicker("hide");
            $('#datetimepicker2').datetimepicker("setStartEndType", "start");


            $('#btn-minus').on('click', function () {
                fieldName = $(this).attr('data-field');
                var input = $("input[name='" + fieldName + "']");
                var currentVal = parseInt(input.val());

                var startTime = $('#datetimepicker2').val();
                var endTime = $('#datetimepicker3').val();

                var start = startTime.split(':');
                var end = endTime.split(':');

                var total = parseInt(start[0]) - parseInt(end[0]);
                total = Math.abs(total);



                var min = (parseInt(start[1]) + 30) - 60;
                min = Math.abs(min);

                if (min <= parseInt(end[1])) {
                    total++;
                }

                if (currentVal > input.attr('min')) {
                    input.val(currentVal - 1).change();
                    currentVal = parseInt(input.val());
                    $('#totalPrice').text('Price : ' + (<%= space.getPrice()%> * currentVal) * total);
                }
            });

            $('#btn-plus').on('click', function () {
                fieldName = $(this).attr('data-field');
                var input = $("input[name='" + fieldName + "']");
                var currentVal = parseInt(input.val());

                var startTime = $('#datetimepicker2').val();
                var endTime = $('#datetimepicker3').val();

                var start = startTime.split(':');
                var end = endTime.split(':');

                var total = parseInt(start[0]) - parseInt(end[0]);
                total = Math.abs(total);

                var min = (parseInt(start[1]) + 30) - 60;
                min = Math.abs(min);

                if (min <= parseInt(end[1])) {
                    total++;
                }

                if (currentVal < input.attr('max')) {
                    input.val(currentVal + 1).change();
                    currentVal = parseInt(input.val());
                    $('#totalPrice').text('Price : ' + (<%= space.getPrice()%> * currentVal) * total);
                }
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#messagediv').click(function(){
                    $('#messageModal').modal('show');
                });
                $('#messagediv2').click(function(){
                    $('#messageModal').modal('show');
                });
            });
        </script> 
        <script type="text/javascript">
                    $(document).ready(function(){
    $('[data-toggle="nomessagetooltip"]').tooltip();
    $('[data-toggle="messagetooltip"]').tooltip();
});
                </script>
                <script type="text/javascript">
                    $(document).ready(function(){
                        $('#messagebody').load('message.jsp');
                    });
                    function delMessage(id){
                        $('#messagebody').load('message.jsp?delete=yes&id='+id);
                    }
                </script>
                <script type="text/javascript">
                    var takedamount = new String("<%= takedamount_st %>");
                    console.log("getlist: " + takedamount);
                    takedamount = takedamount.split(",");
                    var maxamount = 10;
                 function mainSetMaxAmount(){
                     console.log("hey!");
                     var myday = $('#datetimepicker').val();
                     var mystart = $('#datetimepicker2').val();
                     var myend = $('#datetimepicker3').val();
                     var myday_temp = myday.toString().split("-");
                     myday = myday_temp[0] + "/" + myday_temp[1] + "/" + myday_temp[2];
                     if(myday.length !== 0 && mystart.length !== 0 && myend.length !== 0){
                         console.log("hey2!");
                         setMaxAmount(myday, mystart, myend);
                         console.log("maxamount: " + maxamount);
                         document.getElementById("available").innerHTML = new String(maxamount);
                         document.getElementById('input_people').setAttribute('max', maxamount);
                     }          
                 }
                 function setMaxAmount(day, start, end){
                     console.log("inthis!");
                     for(var i = 0; i < takedamount.length; i++){
                         console.log("split0: " + takedamount[i].split("-")[0]);
                         console.log("day: " + day);
                         if(takedamount[i].split("-")[0] === day){
                             console.log("hey3!");
                             if(takedamount[i].split("-")[1] === start){
                                 console.log("hey4!");
                                 if(takedamount[i].split("-")[2] === end){
                                     console.log("hey5!");
                                     maxamount = takedamount[i].split("-")[3];
                                 }
                             }
                         }
                     }
                     
                 }
                </script>
                


    </body>
</html>
