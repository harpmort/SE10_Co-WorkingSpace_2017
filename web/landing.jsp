<%-- 
    Document   : landing
    Created on : Oct 27, 2017, 5:38:41 PM
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
        <link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">

        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Prompt:300">
        <title>Co-Working-Space</title>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-slider.js"></script>

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
                <% if (type != 3) {%>
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
                        <% if (true) { %>
                        <li class="menu-bar"><div class="message-main">
                                <div data-toggle="messagetooltip" data-placement="bottom" title="คุณมีข้อความแจ้งเตือน!"><img class="message-img" src="img/message.png"><div class="message-count">10</div></div>
                            </div></li>
                            <% } else { %>
                        <li class="menu-bar"><div class="message-main">
                                <div data-toggle="nomessagetooltip" data-placement="bottom" title="คุณไม่มีข้อความ"><img class="message-img" src="img/message.png"></div>
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
                        <% if (true) { %>
                        <li class="menu-bar"><div class="message-main">
                                <div data-toggle="messagetooltip" data-placement="bottom" title="คุณมีข้อความแจ้งเตือน!"><img class="message-img" src="img/message.png"><div class="message-count">10</div></div>
                            </div></li>
                            <% } else { %>
                        <li class="menu-bar"><div class="message-main">
                                <div data-toggle="nomessagetooltip" data-placement="bottom" title="คุณไม่มีข้อความ"><img class="message-img" src="img/message.png"></div>
                            </div></li>

                        <% } %>
                    </ul>
                </div>
                <%}%>

            </div>
        </nav>

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
                        <a id="advanceSearch">Advance Search</a>
                        <div id="searchPad" style="display:none" class="search-filter">
                            Type Room :
                            <input type="radio" name="typeRoom" value="1" /> Share Room
                            <input type="radio" name="typeRoom" value="2" /> Private Room<br>
                            <input type="radio" name="typeRoom" value="3" /> Meeting Room<br>
                            Type Desk : 
                            <input type="radio" name="typeDesk" value="2" /> Share Desk
                            <input type="radio" name="typeDesk" value="1" /> Fix Desk<br>
                            Price : 
                            <b class="margin-slider-right">$ 0</b>
                            <input id="ex2" type="text" class="span2" value="" data-slider-min="0" data-slider-max="1000" data-slider-step="10" data-slider-value="[0,1000]"/>
                            <b class="margin-slider-left">$ 1000</b><br>
                            <form id="formViewAll" action="SearchServlet" method="POST">
                                <a id="viewAll" type="submit">View all place.</a>
                            </form>
                        </div>
                    </div>
                </center>
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function () {
                $('[data-toggle="nomessagetooltip"]').tooltip();
                $('[data-toggle="messagetooltip"]').tooltip();
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#advanceSearch").click(function () {
                    $('#searchPad').fadeToggle();
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#ex2").slider({});
            });
        </script>
        <script type="text/javascript">
            document.getElementById("viewAll").onclick = function() {
                document.getElementById("formViewAll").submit();
            };
        </script>
    </body>
</html>
