<%-- 
    Document   : History
    Created on : Nov 3, 2017, 4:48:35 PM
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
        <% int type = (int) session.getAttribute("type");%>
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
                <%model.Member member = (model.Member) session.getAttribute("member");%>
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
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">
                            <h3 class="text-center">
                                History
                            </h3>
                        </div>
                        <div class="col-md-4">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID_History</th>
                                        <th>ชื่อสถานที่</th>
                                        <th>ชื่อผู้จอง</th>
                                        <th>วันที่จอง</th>
                                        <th>เวลาเริ่ม</th>
                                        <th>เวลาจบ</th>
                                        <th>จำนวนโต๊ะที่จอง</th>
                                        <th>Rating</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="row" items="${sessionScope.viewhistory.lhistory}">
                                        <tr class="success">
                                            <td>${row.idhistory}</td>
                                            <td>${row.location_name}</td>
                                            <td>${row.username}</td>
                                            <td>${row.date}</td>
                                            <td>${row.begin_time}</td>
                                            <td>${row.end_time}</td>
                                            <td>${row.desk_booking}</td>
                                    <form action="#" method="POST">
                                        <td class="success">
                                            <button class="btn btn-sm btn-info" type="submit" name="idbooking" value="${row.idbooking}">
                                                Rating
                                            </button>
                                        </td>
                                    </form>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-2">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
