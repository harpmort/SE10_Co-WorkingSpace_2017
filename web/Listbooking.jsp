<%-- 
    Document   : Listbooking
    Created on : Nov 3, 2017, 4:29:52 PM
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
                    <a class="navbar-brand brand-edit" href="landing.jsp">
                        <img alt="Brand" src="img/cws.png" style="width: 78px">
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
                        <% if(true){ %>
                        <li class="menu-bar"><div class="message-main">
                                <div data-toggle="messagetooltip" data-placement="bottom" title="คุณมีข้อความแจ้งเตือน!"><img class="message-img" src="img/message.png"><div class="message-count">10</div></div>
                            </div></li>
                        <% }else{ %>
                        <li class="menu-bar"><div class="message-main">
                                <div data-toggle="nomessagetooltip" data-placement="bottom" title="คุณไม่มีข้อความ"><img class="message-img" src="img/message.png"></div>
                            </div></li>
                        
                        <% } %>
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
                            <h3 class="text-center booking-head">
                                รายการ Co-Working Space ที่จอง
                            </h3>
                        </div>
                        <div class="col-md-4">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <table class="table booking-center">
                                <thead>
                                    <tr>
                                        <th id="booking-center">ID_Booking</th>
                                        <th id="booking-center">ชื่อสถานที่</th>
                                        <th id="booking-center">ชื่อ</th>
                                        <th id="booking-center">วันที่จอง</th>
                                        <th id="booking-center">เวลาเริ่ม</th>
                                        <th id="booking-center">เวลาจบ</th>
                                        <th id="booking-center">จำนวนคนที่จอง</th>
                                        <th id="booking-center">ยกเลิกการจอง</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="row" items="${sessionScope.viewbooking.lbooking}">
                                        <tr class="booking-data">
                                            <td>${row.idbooking}</td>
                                            <td>${row.location_name}</td>
                                            <td>${row.username}</td>
                                            <td>${row.date}</td>
                                            <td>${row.begin_time}</td>
                                            <td>${row.end_time}</td>
                                            <td>${row.desk_booking}</td>
                                    <form action="CancelbookingServlet" method="POST">
                                        <td class="booking-data">
                                            <button class="btn btn-sm btn-info" type="submit" name="idbooking" value="${row.idbooking}">
                                                ยกเลิก
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
