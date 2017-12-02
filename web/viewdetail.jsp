<%-- 
    Document   : viewdetail
    Created on : Nov 15, 2017, 9:23:08 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">

        <!-- <link rel="stylesheet" href="js/bootstrap-datetimepicker.min.js" />
                <link rel="stylesheet" type="text/css" href="js/moment.js"> -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.min.css">

        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Prompt:300">
        <title>Co-Working-Space</title>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-datetimepicker.js"></script>
        <script src="js/locales/bootstrap-datetimepicker.ua.js"></script>
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
                    <%model.Member member = (model.Member) session.getAttribute("member");
                        int type = (int) session.getAttribute("type");%>
                    <div class="collapse navbar-collapse" id="mynavbar">
                        <div class="collapse navbar-collapse" id="mynavbar">
                            <ul class="nav navbar-nav navbar-right">
                                <% if (type == 1) {%>
                                <li class="menu-bar"><a href="index.jsp">HOME</a></li>
                                <li class="menu-bar"><a href="insertcws.jsp">Add Space</a></li>
                                <li class="menu-bar"><a href="BookingServlet">List Booking</a></li>
                                <li class="menu-bar"><a href="HistoryServlet">History</a></li>
                                    <%} else if (type == 2) {%>
                                <li class="menu-bar"><a href="index.jsp">HOME</a></li>
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
                            </ul>
                        </div>
                    </div>
                    <%} else if (check != 1) {%>
                    <ul class="nav navbar-nav navbar-right">
                        <button type="button" class="btn btn-default navbar-btn"  data-toggle="modal" data-target="#registerModal">Sign up</button>
                        <button type="button" class="btn btn-default navbar-btn margin-3px" data-toggle="modal" data-target="#loginModal">Login</button>
                    </ul><%}%>
                </div>
            </div>
        </nav>
        <%model.Space space = (model.Space) session.getAttribute("space");%>
        <h1 class="margin-left"><%= space.getName()%></h1>

        <div class="container zero-gap" style="width: 100%">
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
                            if (j == 0) {%><div class="item active"><img src="<%=space.getImg()[j]%>" style="width:100%;"></div><%} else {%>
                    <div class="item"><img src="<%=space.getImg()[j]%>" style="width:100%;"></div>
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

        <div class="margin-top">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <!-- //Icon & Room Detail -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-2">
                                <img src="img/actions.png" style="width: 32px">
                            </div>
                            <div class="col-md-10">
                                <p style="font-size:initial;"><%= space.getAmount_people()%></p>
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
                                    <p>Price : <%= space.getPrice()%></p>
                                </center>
                            </div>
                            <div class="row">
                                <div class="col-md-6 ">
                                    <div class="col-md-3">
                                        <p>วันที่ : </p>
                                        <p>เวลาเริ่ม : </p>
                                    </div>
                                    <div class="col-md-9">
                                        <!-- <input type='text' class="form-control" id='datetimepicker4' />
                        <script type="text/javascript">
                                $('#datetimepicker4').datetimepicker();
                        </script> -->
                                        <input type="text" class="form-control" value="" id="datetimepicker">
                                        <input type="text" class="form-control" value="" id="datetimepicker2">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="col-md-3">
                                        <p>เวลาสิ้นสุด : </p>
                                        <p>จำนวนคน : </p>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" value="" id="datetimepicker3">
                                        <div class="input-group">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" id="btn-minuse">
                                                    <i class="glyphicon glyphicon-minus"></i>
                                                </button>
                                            </span>
                                            <input class="form-control input-number" type="text" min="1" max="10" value="1">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" id="btn-pluss">
                                                    <i class="glyphicon glyphicon-plus"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="book-btn">
                                <center><button class="btn btn-default btn-margin">Book</button></center>

                            </div>
                        </div>
                    </div>


                    <div class="jumbotron margin-top">
                        <div class="container">
                            <h3>Description</h3>
                            <p><%= space.getDescription()%></p>
                        </div>
                    </div>

                </div>

            </div>
            <div class="col-md-2"></div>

        </div>

        <script type="text/javascript">
            $('#datetimepicker').datetimepicker({
                format: 'dd-mm-yyyy',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                minView: 2,
                forceParse: 0
            });
            $('#datetimepicker2').datetimepicker({
                format: 'hh:ii',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 1,
                minView: 0,
                maxView: 1,
                forceParse: 0
            });
            $('#datetimepicker3').datetimepicker({
                format: 'hh:ii',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 1,
                minView: 0,
                maxView: 1,
                forceParse: 0
            });
        </script>
    </body>
</html>
