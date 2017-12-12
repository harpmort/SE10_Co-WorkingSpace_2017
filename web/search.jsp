<%-- 
    Document   : search
    Created on : Nov 1, 2017, 12:57:50 PM
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
        <% int check = 0;
            if (session.getAttribute("check") != null) {
                check = (int) session.getAttribute("check");
            }%>

        <% int pos = 0;
            if (session.getAttribute("pos") != null) {
                pos = (int) session.getAttribute("pos");
            }%>
        <% int i = 0;
            if (session.getAttribute("i") != null) {
                i = (int) session.getAttribute("i");
            }%>
        <nav class="navbar navbar-default navbar-edit navbar-static-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand brand-edit" href="index.jsp">
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
                    <%int type = (int) session.getAttribute("type");%>
                    <% if (check == 1) {%>

                    <%if (type != 3) {%>
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
                            <% if (member.getUnReadMessage() != 0) {%>
                            <li class="menu-bar"><div class="message-main">
                                    <div id="messagediv" data-toggle="messagetooltip" data-placement="bottom" title="คุณมีข้อความแจ้งเตือน!"><img class="message-img" src="img/message.png"><div class="message-count"><%= member.getUnReadMessage()%></div></div>
                                </div></li>
                                <% } else { %>
                            <li class="menu-bar"><div class="message-main">
                                    <div id="messagediv2" data-toggle="nomessagetooltip" data-placement="bottom" title="คุณไม่มีข้อความใหม่"><img class="message-img" src="img/message.png"></div>
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
                            <% if (admin.getUnReadMessage() != 0) {%>
                            <li class="menu-bar"><div class="message-main">
                                    <div id="messagediv" data-toggle="messagetooltip" data-placement="bottom" title="คุณมีข้อความแจ้งเตือน!"><img class="message-img" src="img/message.png"><div class="message-count"><%= admin.getUnReadMessage()%></div></div>
                                </div></li>
                                <% } else { %>
                            <li class="menu-bar"><div class="message-main">
                                    <div id="messagediv2" data-toggle="nomessagetooltip" data-placement="bottom" title="คุณไม่มีข้อความใหม่"><img class="message-img" src="img/message.png"></div>
                                </div></li>

                            <% } %>
                        </ul>
                    </div>
                    <%}%>
                    <%} else if (check != 1) {%>
                    <ul class="nav navbar-nav navbar-right">
                        <button type="button" class="btn btn-default navbar-btn"  data-toggle="modal" data-target="#registerModal">Sign up</button>
                        <button type="button" class="btn btn-default navbar-btn margin-3px" data-toggle="modal" data-target="#loginModal">Login</button>
                    </ul><%}%>
                </div>
            </div>
        </nav>
        <!-- <img  class="img-cover " src="img/img-slide2.jpg" style="width: 100%"> -->
        <div class="head-bg-cover" >
            <div class="head-bg-cover" >
                <div class="align-center">
                    <center><p class="head-name">CO-WORKING SPACE</p>
                        <div class="row">
                            <form action="SearchServlet" method="POST">
                                <div class="col-md-12">
                                    <div class=" input-group search-bar">
                                        <input name="search" type="text" class="form-control" placeholder="Location or Lessor or Type Room or Type Desk.." />
                                        <span class="input-group-btn">
                                            <button class="btn btn-default btn-search" type="submit"> 
                                                <span class="glyphicon glyphicon-search"></span> 
                                            </button>
                                        </span>
                                    </div>
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
                                    <input id="ex2" type="text" class="span2" name="price" value="" data-slider-min="0" data-slider-max="1000" data-slider-step="10" data-slider-value="[0,1000]"/>
                                    <b class="margin-slider-left">$ 1000</b><br>
                                    </form>
                                    <form id="formViewAll" action="SearchServlet" method="POST">
                                        <input name="all" type="text" class="form-control" placeholder="Location or Lessor or Type Room or Type Desk.."  style="display: none" value="all"/>
                                        <a id="viewAll" type="submit">View all place.</a>
                                    </form>
                                </div>

                        </div>

                    </center>
                </div>
            </div>
        </div>

        <div class="col-md-1"></div>

        <div class="col-md-10">

            <% int count = 0; %>
            <% int check_search = (int) session.getAttribute("check_search");%>

            <c:forEach var="row" items="${sessionScope.space.detail_space}">
                <% if (count >= i && count <= pos) { %>
                <div class="col-md-4">
                    <form action="ViewdetailspaceServlet" method="POST">
                        <div class="w3-card-4 card-margin">
                            <div class="panel-thumbnail ">
                                <img src="${row.img[0]}" class="img-crop">
                            </div>
                            <div class="panel-body">
                                <p class="lead" >${row.name} by ${row.username}</p>
                                <p>${row.location}</p>
                            </div>
                            <div class="panel-footer">
                                <button class="btn btn-sm  center-block btn-info" type="submit" name="name" value="${row.name}">
                                    View Detail Space
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

                <% } %>
                <% if (count <= pos) {
                        count++;
                    }%>

            </c:forEach>

        </div>

        <div class="col-md-1"></div>


        <div class="col-md-5"></div>
        <div class="col-md-1 margin-bott-nextbtn">
            <% if (count >= i && i >= 11) { %>
            <form action="SearchServlet" method="POST">
                <div class="row input-group search-bar">
                    <input name="search" type="text" style="display: none"/>
                    <button class="btn btn-default btn-search" type="submit">Back</button>
                </div>
            </form>
            <% } %>
        </div>
        <div class="col-md-1 margin-bott-nextbtn">
            <% if (count > pos) { %>
            <form action="search.jsp" method="POST">
                <% session.setAttribute("i", count); %>
                <% session.setAttribute("pos", count + 11); %>
                <% session.setAttribute("space", session.getAttribute("space")); %>
                <% String text = (String) session.getAttribute("text");%>
                <button class="btn btn-default btn-search" type="submit" value="<%=text%>">
                    Next
                </button>
            </form>
            <% } %>
        </div>
        <div class="col-md-5"></div>   


        <!-- Login Modal -->
        <div id="loginModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Login Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Login</h4>
                    </div>
                    <div class="modal-body">
                        <form action="LoginServlet" method="post">
                            <% if (check == 2) {%>
                            <h3 style="text-align: center;color: red;">กรอกรหัสผ่านผิด</h3>
                            <%} else if (check == 3) {%>
                            <h3 style="text-align: center;color: red;">ไม่พบชื่อผู้ใช้นี้</h3><%}%>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" class="form-control" id="username" name="username">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password">
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
        <!-- Register Modal -->
        <div id="registerModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Register Modal content-->
                <div class="modal-content">
                    <form action="RegisterServlet" method="POST" id="register_form">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title register-modal-step1">Sign up : Step 1</h4>
                            <h4 class="modal-title register-modal-step2">Sign up : Step 2</h4>
                        </div>
                        <div class="modal-body">
                            <div class=" register-modal-step1">
                                <p>Please enter your information in to the fill.</p>
                                <p id="errorregister-m"></p>
                                <div class="form-group" id="form_fname">
                                    <label for="firstname">First name</label>
                                    <input type="text" class="form-control" id="firstname" name="firstname">
                                    <p class="errorregister-m" id="error_fname"></p>
                                </div>
                                <div class="form-group" id="form_lname">
                                    <label for="lastname">Last name</label>
                                    <input type="text" class="form-control" id="lastname" name="lastname">
                                    <p class="errorregister-m" id="error_lname"></p>
                                </div>
                                <div class="form-group" id="form_uname">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" id="username_r" name="username">
                                    <p class="errorregister-m" id="error_uname"></p>
                                </div>
                                <div class="form-group" id="form_pword">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password_r" name="password">
                                    <p class="errorregister-m" id="error_pword"></p>
                                </div>
                                <div class="form-group" id="form_email">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email">
                                    <p class="errorregister-m" id="error_email"></p>
                                </div>
                                <div class="form-group" id="form_phone">
                                    <label for="phone">Phone</label>
                                    <input type="text" class="form-control" id="phone" name="phone">
                                    <p class="errorregister-m" id="error_phone"></p>
                                </div>
                                <div class="form-group">
                                    <label for="profileimg">Profile Image</label>
                                    <input type="file" id="profileimg" name="profileimg"/>
                                </div>
                                <p>Who are you?</p>
                                <ul class="who-selector-register">
                                    <li><input type="radio" id="rental" name="who-selector" value="2">
                                        <label for="rental">Rental</label></li>
                                    <li><input type="radio" id="lessor" name="who-selector" value="1">
                                        <label for="lessor">Lessor</label></li>
                                </ul><br>
                            </div>
                            <div class="register-modal-step2">
                                <p>Upload file to identity yours.</p>
                                <div class="form-group">
                                    <label for="idcardimg">ID Card Image</label>
                                    <p>Image file size should be smaller than 1 MB</p>
                                    <input type="file" name="idcardfile"/>
                                </div>
                                <div class="g-recaptcha" data-sitekey="6LeDNzcUAAAAANv5hg7ttwK6tdLrcXIjcCnTMl4E"></div>
                            </div>
                            <% if (check == 4) {%>
                            <div class="register-modal-complete">
                                <p>You registration has been complete. </p>
                            </div>
                            <%}%>
                            <% if (check == 8) {%>
                            <div class="register-modal-existed">
                                <p>Your email has been existed, Please use another email. </p>
                            </div>
                            <%}%>
                            <% if (check == 16) {%>
                            <div class="register-modal-recap">
                                <p>Something wrong, Please register again.</p>
                            </div>
                            <%}%>
                        </div>
                        <div class="modal-footer modal-edit">
                            <button type="submit" value="submit" class="btn btn-primary" id="submit_bttn">Submit</button>
                            <button type="button" class="btn btn-primary" id="button-register-nextstep">Next</button>
                            <button id="back_bttn" type="button" class="btn btn-default" id="button-register-close">Back</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" id="button-register-close">Close</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
        <!-- Search Modal -->
        <div id="searchModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Search Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <center><h3>ไม่พบรายการที่ทำการค้นหา</h3></center>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
        <% if (check_search == 0) { %>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#searchModal').modal('show');
            });
        </script>
        <%}%>

        <% if (check == 2 || check == 3) { %>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#loginModal').modal('show');
            });
        </script>
        <%} else if (check == 4 || check == 8 || check == 16) {%>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#registerModal').modal('show');
                alertregister();
            });
        </script>
        <%}
            check = 0;%>

        <script type="text/javascript">
            $(document).ready(function () {
                $(".register-modal-step2").hide();
                $("#back_bttn").hide();
                $("#submit_bttn").hide();
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#button-register-nextstep").click(function () {
                    $(".register-modal-step1").hide();
                    $(".register-modal-step2").show();
                    $("#back_bttn").show();
                    $("#button-register-nextstep").hide();
                    $("#submit_bttn").show();
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#back_bttn").click(function () {
                    $(".register-modal-step1").show();
                    $(".register-modal-step2").hide();
                    $("#back_bttn").hide();
                    $("#button-register-nextstep").show();
                    $("#submit_bttn").hide();
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#button-register-close").click(function () {
                    $(".register-modal-step1").delay(1000).show(0);
                    $(".register-modal-step2").delay(1000).hide(0);
                    $("#back_bttn").delay(1000).hide(0);
                    $("#button-register-nextstep").delay(1000).show(0);
                    $("#submit_bttn").delay(1000).hide(0);
                    $(".register-modal-complete").hide();
                    $(".register-modal-existed").hide();
                    $(".register-modal-recap").hide();
                });
            });
        </script>
        <script type="text/javascript">
            function alertregister() {
                $(".register-modal-step1").hide();
                $(".register-modal-step2").hide();
                $("#back_bttn").hide();
                $("#button-register-nextstep").hide();
                $("#submit_bttn").hide();
            }
        </script>
        <script type="text/javascript">
            var head_replacetxt = "<p class=\"errorregister-m\" id=\"";
            var error_end_replacetxt = "\">Required</p>";
            var unerror_end_replacetxt = "\"></p>";
            var form_fname = $('#form_fname');
            var form_lname = $('#form_lname');
            var form_uname = $('#form_uname');
            var form_pword = $('#form_pword');
            var form_email = $('#form_email');
            var form_phone = $('#form_phone');
            var fname = $("#firstname");
            var lname = $("#lastname");
            var uname = $("#username_r");
            var pword = $("#password_r");
            var email = $("#email");
            var phone = $("#phone");
            var email_flag = true;
            $(document).ready(function () {
                deactivate_next();
                fname.blur(function () {
                    if ($(this).val().length === 0) {
                        $("#error_fname").replaceWith(head_replacetxt + "error_fname" + error_end_replacetxt);
                        form_fname.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else {
                        $("#error_fname").replaceWith(head_replacetxt + "error_fname" + unerror_end_replacetxt);
                        form_fname.removeClass('has-error', 'has-feedback');
                        activate_next();
                    }
                });
                lname.blur(function () {
                    if ($(this).val().length === 0) {
                        $("#error_lname").replaceWith(head_replacetxt + "error_lname" + error_end_replacetxt);
                        form_lname.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else {
                        $("#error_lname").replaceWith(head_replacetxt + "error_lname" + unerror_end_replacetxt);
                        form_lname.removeClass('has-error', 'has-feedback');
                        activate_next();
                    }
                });
                uname.blur(function () {
                    if ($(this).val().length === 0) {
                        $("#error_uname").replaceWith(head_replacetxt + "error_uname" + error_end_replacetxt);
                        form_uname.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else {
                        $("#error_uname").replaceWith(head_replacetxt + "error_uname" + unerror_end_replacetxt);
                        form_uname.removeClass('has-error', 'has-feedback');
                        activate_next();
                    }
                });
                pword.blur(function () {
                    if ($(this).val().length === 0) {
                        $("#error_pword").replaceWith(head_replacetxt + "error_pword" + error_end_replacetxt);
                        form_pword.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else if ($(this).val().length < 8) {
                        $("#error_pword").replaceWith(head_replacetxt + "error_pword\">Password will contain with more than 8 character</p>");
                        form_pword.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else {
                        $("#error_pword").replaceWith(head_replacetxt + "error_pword" + unerror_end_replacetxt);
                        form_pword.removeClass('has-error', 'has-feedback');
                        activate_next();
                    }
                });
                email.blur(function () {
                    if ($(this).val().length === 0) {
                        $("#error_email").replaceWith(head_replacetxt + "error_email" + error_end_replacetxt);
                        form_email.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else {
                        if (isEmail(email.val())) {
                            $("#error_email").replaceWith(head_replacetxt + "error_email" + unerror_end_replacetxt);
                            form_email.removeClass('has-error', 'has-feedback');
                            activate_next();
                            email_flag = false;
                        } else {
                            $("#error_email").replaceWith(head_replacetxt + "error_email\">Email not correct.</p>");
                            form_email.addClass('has-error', 'has-feedback');
                            deactivate_next();
                        }
                    }
                });
                phone.blur(function () {
                    if ($(this).val().length === 0) {
                        $("#error_phone").replaceWith(head_replacetxt + "error_phone" + error_end_replacetxt);
                        form_phone.addClass('has-error', 'has-feedback');
                        deactivate_next();
                    } else {
                        $("#error_phone").replaceWith(head_replacetxt + "error_phone" + unerror_end_replacetxt);
                        form_phone.removeClass('has-error', 'has-feedback');
                        activate_next();
                    }
                });
                $("#idcardimg").blur(function () {
                    if ($(this).val().length === 0) {
                        alert("If you not upload your ID Card, your profile status are not verify\n\
            and it's impact on your credibility.");
                    }
                });
            });
            function activate_next() {
                $(document).ready(function () {
                    if (fname.val().length === 0 || lname.val().length === 0 || uname.val().length === 0
                            || pword.val().length < 8 || email.val().length === 0 || phone.val().length === 0 || email_flag) {
                    } else {
                        $("#button-register-nextstep").removeClass('disabled');
                        $("#button-register-nextstep").removeAttr("disabled");
                    }
                });
            }
            function deactivate_next() {
                $(document).ready(function () {
                    $("#button-register-nextstep").addClass('disabled');
                    $("#button-register-nextstep").attr("disabled", true);
                });
            }
            function isEmail(email) {
                var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                return regex.test(email);
            }


        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#submit_bttn").click(function (e) {
                    e.preventDefault();
                    $("#register_form").submit();
                });
            });
        </script>
        <% if (check == 2 || check == 3) { %>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#loginModal').modal('show');
            });
        </script>
        <%} else if (check == 4) {%>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#regiserrorModal').modal('show');
            });
        </script>
        <%}%>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".register-modal-step2").hide();
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#button-register-nextstep").click(function () {
                    $(".register-modal-step1").hide();
                    $(".register-modal-step2").show();
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#button-register-close").click(function () {
                    $(".register-modal-step1").delay(1000).show(0);
                    $(".register-modal-step2").delay(1000).hide(0);
                });
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
            document.getElementById("viewAll").onclick = function () {
                document.getElementById("formViewAll").submit();
            };
            </script>
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
