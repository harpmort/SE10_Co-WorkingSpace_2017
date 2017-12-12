<%-- 
    Document   : Approvelessor
    Created on : Dec 11, 2017, 5:20:25 PM
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
                        <div class="col-md-4 list-book">
                            <h3 class="text-center">
                                คำร้องการยืนยันตัวตนของผู้ประกอบการ
                            </h3>
                        </div>
                        <div class="col-md-4">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8 underline-head">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>ชื่อผู้ประกอบการ</th>
                                        <th>Link Id Card</th>
                                        <th>ยันยืนผู้ประกอบการ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="row" items="${sessionScope.viewapporve.lapprove}">
                                        <tr class="success">
                                            <td>${row.username}</td>
                                            <td>${row.firstname}</td>
                                            <td><a href="${row.idcard}">กดเพื่อดู Id Card ผู้ประกอบการ</a></td>

                                    <form action="ApproveServlet" method="POST">
                                        <td class="success">
                                            <button class="btn btn-sm btn-info" type="submit" name="username" value="${row.username}">
                                                ยืนยัน
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
