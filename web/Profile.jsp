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
         <% int check = 0;
            if (session.getAttribute("check") != null) {
                check = (int) session.getAttribute("check");
            }%>
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

                <div class="collapse navbar-collapse" id="mynavbar">
                    <%model.Member member = (model.Member) session.getAttribute("member");%>
                    <% if (check == 1) {%>
                    <%int type = (int) session.getAttribute("type");%>
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
                                <%}
                                    }%>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle menu-bar" data-toggle="dropdown"><%= member.getUsername()%><strong class="caret"></strong></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="Profile.jsp" >View Profile</a>
                                    </li>
                                    <li>
                                        <a href="LogoutServlet">Logout</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
<!--                    <h3 class="text-center head-pro">
                        Profile
                    </h3>-->
                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-2">
                            <div class="img-pro"><img src="<%= member.getImg_user()%>" width="100%" /></div>
                            <div class="name-pro" style="text-align: center"><h3>
                                    <%= member.getUsername()%>
                                </h3></div>
                            <form action="editprofile.jsp" met hod="POST">
                                <div class="btn-edit-pro">
                                    <button type="submit" class="btn btn-default" >
                                        edit profile
                                    </button>
                                </div>
                            </form>

                        </div>
                        <div class="col-md-6">
                            <div class="show-pro">ชื่อ : <%= member.getFirstname()%></div>
                            <div class="show-pro">นามสกุล : <%= member.getLastname()%></div>
                            <div class="show-pro">Email : <%= member.getEmail()%></div>
                            <div class="show-pro">เบอร์โทรศัพท์ : <%= member.getPhone()%></div>
                            <%int type = member.getType();
                                String type_mem;
                                if (type == 1) {
                                    type_mem = "Lessor(ผู้ให้เช่า)";
                                } else {
                                    type_mem = "Rental(ผู้เช่า)";
                                }
                            %>
                            <div class="show-pro">ประเภทผู้ใช้งาน : <%= type_mem%></div>

                            <%String idcard = member.getIdcard();
                                String verified;
                                if (idcard.equals("Not verified")) {
                                    verified = "ยังไม่ได้ยืนยันตัวตน";
                                } else {
                                    verified = "ยืนยันตัวตนแล้ว";
                                }
                            %>
                            <div class="show-pro">สถานะยืนยันตัวตน : <%= verified%></div>

                        </div>
                        <div class="col-md-2">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
