<%-- 
    Document   : insertcws
    Created on : Nov 3, 2017, 5:17:35 PM
    Author     : Administrator
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                    <li class="menu-bar"><a href="index.jsp">Home</a></li>
                    <li class="menu-bar"><a href="insertcws.jsp">Add Space</a></li>
                    <li class="menu-bar"><a href="BookingServlet">List Booking</a></li>
                    <li class="menu-bar"><a href="HistoryServlet">History</a></li>
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

    <div class="container-fluid">
        <div class="row content">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-6">
                        <h3>
                            Add Space :D
                        </h3><br>
                        <form action="AddspaceServlet" method="post" role="form" >
                            <div class="form-group">
                                <label for="name">
                                    ชื่อ
                                </label>
                                <input type="text" class="form-control" id="name" name="name" />
                            </div>
                            <div class="form-group">
                                <label for="location">
                                    ชื่อสถานที่
                                </label>
                                <input type="text" class="form-control" id="location" name="location" />
                            </div>
                            <div class="form-group">
                                <label for="people">
                                    จำนวนคน
                                </label>
                                <input type="text" class="form-control" id="people" name="people" />
                            </div>
                            <div class="form-group">
                                <label for="roomsize">
                                    ขนาดห้อง
                                </label>
                                <input type="text" class="form-control" id="roomsize" name="roomsize" />
                            </div>
                            <div class="form-group">
                                <label for="typedesk">
                                    ประเภทโต๊ะ
                                </label>
                                <input type="text" class="form-control" id="typedesk" name="typedesk" />
                            </div>
                            <div class="form-group">
                                <label for="amountdesk">
                                    จำนวนโต๊ะ
                                </label>
                                <input type="text" class="form-control" id="amountdesk" name="amountdesk" />
                            </div>
                            <div class="form-group">
                                <label for="typeroom">
                                    ประเภทห้อง
                                </label>
                                <input type="text" class="form-control" id="typeroom" name="typeroom" />
                            </div>
                            <div class="form-group">
                                <label for="open">
                                    เวลาเปิด
                                </label>
                                <input type="text" class="form-control" id="closeopen" name="open" />
                            </div>
                            <div class="form-group">
                                <label for="close">
                                    เวลาปิด
                                </label>
                                <input type="text" class="form-control" id="close" name="close" />
                            </div>
                            <div class="form-group">
                                <label for="price">
                                    ราคา
                                </label>
                                <input type="text" class="form-control" id="price" name="price" />
                            </div>
                            <div class="form-group">
                                <label for="description">
                                    คำอธิบาย
                                </label>
                                <input type="text" class="form-control" id="description" name="description"/>
                            </div>
                            <div class="form-group">
                                <label for="img">
                                    อัพรูป
                                </label>
                                <input multiple="mumltiple" type="file" name="img"/>
                                <p class="help-block">
                                    img name
                                </p>
                            </div>
                            <button type="submit" class="btn btn-default center-block">
                                Confirm
                            </button>
                        </form>
                    </div>
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-2">
                        <img src="img/user.png" class="img-circle center-block img-pro" style="width: 150px" />
                        <h3 class="text-center">
                            <%= member.getUsername()%>
                        </h3>
                    </div>
                    <div class="col-md-">
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
