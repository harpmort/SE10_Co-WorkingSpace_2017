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
                        <% if (admin.getUnReadMessage() != 0) {%>
                        <li class="menu-bar"><div class="message-main">
                                <div id="messagediv" data-toggle="messagetooltip" data-placement="bottom" title="คุณมีข้อความแจ้งเตือน!"><img class="message-img" src="img/message.png"><div class="message-count"><%= admin.getUnReadMessage()%></div></div>
                            </div></li>
                            <% } else { %>
                        <li class="menu-bar"><div class="message-main">
                                <div id="messagediv2" data-toggle="nomessagetooltip" data-placement="bottom" title="คุณไม่มีข้อความใหม่"><img class="message-img" src="img/message.png"></div>
                            </div></li>

                        <% }%>
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
                                            <c:if test="${row.idcard == 'Not verified'}" >
                                                <td>ยังไม่ได้ส่งรูป ID CARD</td>
                                            </c:if>
                                            <c:if test="${row.idcard != 'Not verified'}" >
                                                <td><a href="${row.idcard}">กดเพื่อดู Id Card ผู้ประกอบการ</a></td>
                                            </c:if>


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
