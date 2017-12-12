<%-- 
    Document   : editprofile
    Created on : Dec 9, 2017, 11:18:44 PM
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
            </div>
        </nav>
        <div class="">
            <div class="col-md-12 bg-block">
                <!--                    <h3 class="text-center head-pro">
                                        Edit Profile
                                    </h3>-->
                <div class="col-md-12" style="text-align: center">
                    <div class="image-cropper" >
                        <img src="<%= member.getImg_user()%>" class="rounded" />
                    </div>
                    <div class="name-pro" style="text-align: center">
                        <%= member.getUsername()%>
                    </div>
                </div>
            </div>
                    
            <div class="row edit-margin-block">
<!--                <div class="col-md-2"></div>-->
                <div class="col-md-3">

                </div>
                <div class="col-md-6 content-block-pro">
                    <form action="EditprofileServlet" method="post" role="form" >
                        <div class="form-group">
                            <label for="firstname" >
                                ชื่อ : 
                            </label>
                            <input type="text" class="form-control" id="firstname" name="firstname" placeholder="<%= member.getFirstname()%>"/>
                        </div>
                        <div class="form-group">
                            <label for="lastname" >
                                นามสุกล : 
                            </label>
                            <input type="text" class="form-control" id="lastname" name="lastname" placeholder="<%= member.getLastname()%>"/>
                        </div>
                        <div class="form-group">
                            <label for="email" >
                                Email : 
                            </label>
                            <input type="text" class="form-control" id="email" name="email" placeholder="<%= member.getEmail()%>"/>
                        </div>
                        <div class="form-group">
                            <label for="phone" >
                                เบอร์โทรศัพท์ : 
                            </label>
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="<%= member.getPhone()%>"/>
                        </div>
                        <div class="form-group">
                            <label for="img">
                                change image
                            </label>
                            <input type="file" name="profileimg"/>
                            <p class="help-block">
                                profile img name
                            </p>
                        </div>
                        <%String idcard = member.getIdcard();
                                if (idcard.equals("Not verified")) {%>
                        <div class="form-group">
                            <label for="img">
                                ยืนยันตัวตนด้วย ID Card
                            </label>
                            <input type="file" name="idcardimg"/>
                            <p class="help-block">
                                idcard img name
                            </p>
                        </div>
                        <%}%>
                        <button type="submit" class="btn btn-default center-block btn-edit-pro">
                            Confirm
                        </button>
                    </form>
                </div>
                <div class="col-md-2"></div>
            </div>

        </div>


    </body>
</html>
