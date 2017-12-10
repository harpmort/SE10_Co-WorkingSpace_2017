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
                System.out.println("strhr :"+check);
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
                    <% if (check == 1) {%>
                    <%model.Member member = (model.Member) session.getAttribute("member");
                        int type = (int) session.getAttribute("type");%>
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
                                        <a href="Profile.jsp" >View Profile</a>
                                    </li>
                                    <li>
                                        <a href="LogoutServlet">Logout</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>

                    </div>
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
                    </div>
                </center>
            </div>
        </div>

        <div class="col-md-1"></div>

        <% int i = 0; %>

        <div class="col-md-10">

            <c:forEach var="row" items="${sessionScope.space.detail_space}">

                <div class="col-md-4">
                    <form action="ViewdetailspaceServlet" method="POST">
                        <div class="w3-card-4 card-margin">
                            <div class="panel-thumbnail">
                                <img src="${row.img[0]}" class="img-responsive" style="width: 100%">
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



            </c:forEach>
        </div>

        <div class="col-md-1"></div>

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
    </body>
</html>
