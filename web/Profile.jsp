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
                            <% if (member.getUnReadMessage() != 0) {%>
                            <li class="menu-bar"><div class="message-main">
                                    <div id="messagediv" data-toggle="messagetooltip" data-placement="bottom" title="คุณมีข้อความแจ้งเตือน!"><img class="message-img" src="img/message.png"><div class="message-count"><%= member.getUnReadMessage()%></div></div>
                                </div></li>
                                <% } else { %>
                            <li class="menu-bar"><div class="message-main">
                                    <div id="messagediv2" data-toggle="nomessagetooltip" data-placement="bottom" title="คุณไม่มีข้อความใหม่"><img class="message-img" src="img/message.png"></div>
                                </div></li>

                            <% }%>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
                           

            <div class="">
                <div class="col-md-12 bg-block">
                    
                    <div class="col-md-12" style="text-align: center">
                        <div class="image-cropper" >
                            <img src="<%= member.getImg_user()%>" class="rounded"/>
                        </div>
                        <div class="name-pro" id="image" style="text-align: center">
                            <%= member.getUsername()%>
                        </div>

                    </div>   
                </div>
                <div class="row edit-margin-block">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-6 content-block-pro">
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
                        <%if (type == 1) {%>
                        <%String status = member.getStatus_approve();
                            String idcard = member.getIdcard();
                            String approve;
                            if (status.equals("No Approve") && idcard.equals("Not verified")) {
                                approve = "ยังไม่ได้ยืนยันตัวตน";
                            } else if (status.equals("No Approve") && !idcard.equals("Not verified")) {
                                approve = "รอการยืนยันตัวตน";
                            } else {
                                approve = "ยืนยันตัวตนแล้ว";
                            }
                        %>
                        <div class="show-pro">สถานะยืนยันตัวตน : <%= approve%></div>
                        <%}%>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>
                <form action="editprofile.jsp" met hod="POST">
                    <div class="btn-edit-pro">
                        <button type="submit" class="btn btn-default btn-edit-pro" >
                            edit profile
                        </button>
                    </div>
                </form>

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
        <script type="text/javascript">
            $(document).ready(function () {
                $('#messagediv').click(function () {
                    $('#messageModal').modal('show');
                });
                $('#messagediv2').click(function () {
                    $('#messageModal').modal('show');
                });
            });
        </script> 
        <script type="text/javascript">
            $(document).ready(function () {
                $('[data-toggle="nomessagetooltip"]').tooltip();
                $('[data-toggle="messagetooltip"]').tooltip();
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#messagebody').load('message.jsp');
            });
            function delMessage(id) {
                $('#messagebody').load('message.jsp?delete=yes&id=' + id);
            }
        </script>
    </body>
</html>
