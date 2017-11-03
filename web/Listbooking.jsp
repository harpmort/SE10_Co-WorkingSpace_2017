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
                        <button type="button" class="btn btn-default navbar-btn margin-3px" data-toggle="modal" data-target="#loginModal">Logout</button>

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
                            <h3 class="text-center">
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
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>
                                            ID_Booking
                                        </th>
                                        <th>
                                            ชื่อสถานที่
                                        </th>
                                        <th>
                                            ชื่อผู้จอง
                                        </th>
                                        <th>
                                            วันที่จอง
                                        </th>
                                        <th>
                                            เวลาเริ่ม
                                        </th>
                                        <th>
                                            เวลาจบ
                                        </th>
                                        <th>
                                            จำนวนโต๊ะที่จอง
                                        </th>
                                        <th>
                                            ยกเลิกการจอง
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            0125
                                        </td>
                                        <td>
                                            ห้องประชุมโลเล
                                        </td>
                                        <td>
                                            POLOYAH
                                        </td>
                                        <td>
                                            21 พ.ย. 2016
                                        </td>
                                        <td>
                                            09.00
                                        </td>
                                        <td>
                                            18.00
                                        </td>
                                        <td>
                                            5
                                        </td>
                                        <td>
                                            <input type="submit" value="cancel" name="ยกเลิก" />
                                        </td>
                                    </tr>
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
