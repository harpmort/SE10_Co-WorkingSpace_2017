<%-- 
    Document   : editspace
    Created on : Dec 9, 2017, 10:44:42 AM
    Author     : Asus
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            <div class="collapse navbar-collapse" id="mynavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="menu-bar"><a href="landing.jsp">Home</a></li>
                    <li class="menu-bar"><a href="insertcws.jsp">Add Space</a></li>
                    <li class="menu-bar"><a href="editspace.jsp">Edit Space</a></li>
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
    <sql:setDataSource var="db_coworkingspace"
                       driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/db_coworkingspace" user="root"
                       password="root" />

    <sql:query var="all" dataSource="${db_coworkingspace}" >
        SELECT name 
        FROM co_working_space c
        join member m
        on m.idmember = c.fk_idmember
        where m.username = '<%= member.getUsername()%>';
    </sql:query>
    <div class="container-fluid">
        <div class="row content">
            <div class="col-md-12">
                <div class="head-edit">
                    Edit Space :D
                </div><br>

                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-6">
                        <div class="dropdown-pos-edite-page">
                            <form action="TakespaceServlet" method="POST">
                                <select name="name" id="edit-name-room">
                                    <c:forEach var="row" items="${all.rows}">
                                        <option value="${row.name}">${row.name}</option>
                                    </c:forEach>
                                </select>
                                <input id="edit-name-room" type="submit" value="Edit" name="edit" />
                            </form>
                        </div>
                        <%int check_data = 0;
                            if (request.getAttribute("check_data") != null) {
                                check_data = (int) request.getAttribute("check_data");
                            }%>
                        <%model.Space space = (model.Space) session.getAttribute("space");%>
                        <%if (check_data != 0) {%>
                        <form action="EditspaceServlet" method="post" role="form" >
                            <div class="form-group">
                                <label for="name" >
                                    ชื่อ
                                </label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="<%= space.getName()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="location">
                                    ชื่อสถานที่
                                </label>
                                <input type="text" class="form-control" id="location" name="location" placeholder="<%= space.getLocation()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="people">
                                    จำนวนคน
                                </label>
                                <input type="text" class="form-control" id="people" name="people" placeholder="<%= space.getAmount_people()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="roomsize">
                                    ขนาดห้อง
                                </label>
                                <input type="text" class="form-control" id="roomsize" name="roomsize" placeholder="<%= space.getSize_room()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="typedesk">
                                    ประเภทโต๊ะ
                                </label>
                                <div class="type-table-pos">
                                    <%String type_desk = space.getType_desk();
                                        if (type_desk.equals("Fix Desk")) {%>
                                    <input type="radio" name="typedesk" value="1" checked="checked" /> Fix &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="typedesk" value="2"  /> Share
                                    <%} else {%>
                                    <input type="radio" name="typedesk" value="1"  /> Fix &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="typedesk" value="2"  checked="checked"/> Share
                                    <%}%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="amountdesk">
                                    จำนวนโต๊ะ
                                </label>
                                <input type="text" class="form-control" id="amountdesk" name="amountdesk" placeholder="<%= space.getTotal_desk()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="typeroom">
                                    ประเภทห้อง
                                </label>
                                <div class="type-table-pos">
                                    <%String type_room = space.getType_room();
                                        if (type_room.equals("Share Room")) {%>
                                    <input type="radio" name="typeroom" value="1" checked="checked" /> Share Room &nbsp;
                                    <input type="radio" name="typeroom" value="2"  /> Private Room &nbsp;
                                    <input type="radio" name="typeroom" value="3"  /> Meeting Room
                                    <%} else if(type_room.equals("Private Room")){%>
                                    <input type="radio" name="typeroom" value="1" > Share Room &nbsp;
                                    <input type="radio" name="typeroom" value="2" checked="checked" /> Private Room &nbsp;
                                    <input type="radio" name="typeroom" value="3"  /> Meeting Room
                                    <%} else if (type_room.equals("Meeting Room")){%>
                                    <input type="radio" name="typeroom" value="1"  /> Share Room &nbsp;
                                    <input type="radio" name="typeroom" value="2"  /> Private Room &nbsp;
                                    <input type="radio" name="typeroom" value="3" checked="checked" /> Meeting Room
                                    <%}%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="open">
                                    เวลาเปิด
                                </label>
                                <input type="text" class="form-control" id="closeopen" name="open" placeholder="<%= space.getOpen_time()%>" />
                            </div>
                            <div class="form-group">
                                <label for="close">
                                    เวลาปิด
                                </label>
                                <input type="text" class="form-control" id="close" name="close" placeholder="<%= space.getClose_time()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="price">
                                    ราคา
                                </label>
                                <input type="text" class="form-control" id="price" name="price" placeholder="<%= space.getPrice()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="description">
                                    คำอธิบาย
                                </label>
                                <input type="text" class="form-control" id="description" name="description" placeholder="<%= space.getDescription()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="img">
                                    รูป
                                </label><br>
                                <% int count = space.getImg().length;%>
                                <% for (int j = 0; j < count; j++) {%>
                                <img src="<%=space.getImg()[j]%>" style="width:35%;">
                                    <%}%>
                            </div>
                            <div class="form-group">
                                <label for="img">
                                    อัพรูป
                                </label>
                                <input multiple="multiple" type="file" name="img"/>
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
                <%}%>
            </div>
        </div>
    </div>

</body>
</html>
