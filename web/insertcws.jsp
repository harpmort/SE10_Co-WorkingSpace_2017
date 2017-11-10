<%-- 
    Document   : insertcws
    Created on : Nov 3, 2017, 5:17:35 PM
    Author     : Administrator
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="index.css">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Prompt:300">
    <title>Co-Working-Space</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
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
            <div class="collapse navbar-collapse" id="mynavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Link</a></li>
                    <li><a href="#">Link</a></li>
                    <li><a href="#">Link</a></li>
                    <li><a href="#">Link</a></li>
                    <button type="button" class="btn btn-default navbar-btn margin-3px"><a href="LogoutServlet">Logout</a></button>

                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row content">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-6">
                        <h3>
                            h3. Lorem ipsum dolor sit amet.
                        </h3><br>
                        <form action="" method="post" role="form">
                            <div class="form-group">

                                <label for="exampleInputEmail1">
                                    ชื่อ
                                </label>
                                <input type="email" class="form-control" id="exampleInputEmail1" />
                            </div>
                            <div class="form-group">

                                <label for="exampleInputPassword1">
                                    ชื่อสถานที่
                                </label>
                                <input type="password" class="form-control" id="exampleInputPassword1" />
                            </div>
                            <div class="form-group">

                                <label for="exampleInputEmail1">
                                    จำนวนคน
                                </label>
                                <input type="email" class="form-control" id="exampleInputEmail1" />
                            </div>
                            <div class="form-group">

                                <label for="exampleInputEmail1">
                                    ขนาดห้อง
                                </label>
                                <input type="email" class="form-control" id="exampleInputEmail1" />
                            </div>
                            <div class="form-group">

                                <label for="exampleInputEmail1">
                                    ประเภทโต๊ะ
                                </label>
                                <input type="email" class="form-control" id="exampleInputEmail1" />
                            </div>
                            <div class="form-group">

                                <label for="exampleInputEmail1">
                                    ประเภทห้อง
                                </label>
                                <input type="email" class="form-control" id="exampleInputEmail1" />
                            </div>
                            <div class="form-group">

                                <label for="exampleInputEmail1">
                                    เวลาเปิด
                                </label>
                                <input type="email" class="form-control" id="exampleInputEmail1" />
                            </div>
                            <div class="form-group">

                                <label for="exampleInputEmail1">
                                    เวลาปิด
                                </label>
                                <input type="email" class="form-control" id="exampleInputEmail1" />
                            </div>
                            <div class="form-group">

                                <label for="exampleInputEmail1">
                                    คำอธิบาย
                                </label>
                                <input type="email" class="form-control" id="exampleInputEmail1"/>
                            </div>
                            <div class="form-group">

                                <label for="exampleInputFile">
                                    อัพรูป
                                </label>
                                <input multiple="" type="file" id="exampleInputFile" />
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
                            h3. Lorem ipsum dolor sit amet.
                        </h3>
                    </div>
                    <div class="col-md-">
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
