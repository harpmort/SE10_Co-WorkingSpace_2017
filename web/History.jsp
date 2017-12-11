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
                            <h3 class="text-center history-head">
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
                            <table class="table his-center">
                                <thead>
                                    <tr>
                                        <th id="his-center">ID_History</th>
                                        <th id="his-center">ชื่อสถานที่</th>
                                        <th id="his-center">ชื่อผู้จอง</th>
                                        <th id="his-center">วันที่จอง</th>
                                        <th id="his-center">เวลาเริ่ม</th>
                                        <th id="his-center">เวลาจบ</th>
                                        <th id="his-center">จำนวนโต๊ะที่จอง</th>
                                        <th id="his-center">Rating</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="row" items="${sessionScope.viewhistory.lhistory}">
                                        <tr class="his-data">
                                            <td>${row.idhistory}</td>
                                            <td>${row.location_name}</td>
                                            <td>${row.username}</td>
                                            <td>${row.date}</td>
                                            <td>${row.begin_time}</td>
                                            <td>${row.end_time}</td>
                                            <td>${row.desk_booking}</td>
                                        <td class="his-data">
                                            <button id="rateButton" class="btn btn-sm btn-info" data-toggle="modal" data-target="#ratingModal" type="submit" name="idbooking" value="${row.idbooking}">
                                            Rating
                                            </button>
                                            </td>
        
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
        <div id="ratingModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Login Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Rating</h4>
                    </div>
                    <div class="modal-body">
                        <form action="" method="post">
                            <div class="form-group">
                                <input type="radio" name="rate" value="1" />
                                <img class="" src="img/1.png" style="height: 20px;"/><br>
                                <input type="radio" name="rate" value="2" />
                                <img class="" src="img/2.png" style="height: 20px;"/><br>
                                <input type="radio" name="rate" value="3" />
                                <img class="" src="img/3.png" style="height: 20px;"/><br>
                                <input type="radio" name="rate" value="4" />
                                <img class="" src="img/4.png" style="height: 20px;"/><br>
                                <input type="radio" name="rate" value="5" />
                                <img class="" src="img/5.png" style="height: 20px;"/>
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
    </body>
</html>
