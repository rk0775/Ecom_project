<%-- 
    Document   : register
    Created on : 7 Dec, 2022, 9:20:48 AM
    Author     : Rohit
--%>

<%@page import="HelperClasses.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp"%>

        <div class="container-fluid ">
            <div class="row">
                <div class="col-12 col-sm-6 offset-sm-3">
                    <div class="card m-1 m-sm-5 p-1 p-sm-2">
                        <h3 class="text-muted text-center">Register Here!</h3>
                        <form action="LoginRegisterServlet" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter the full name</label>
                                <input  name="Uname" placeholder="john smith" required="true" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter the email</label>
                                <input  name="Uemail" required="true" placeholder="john@gmail.com" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter the phone</label>
                                <input  name="Uphone" placeholder="000-000-000" required="true" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" placeholder="enter strong password..." required="true" name="Upassword" class="form-control" id="exampleInputPassword1">
                            </div>


                            <!-- this hidden input because seperate the login and register request  -->
                            <input type="hidden" value="register" name="reqType" />

                            <div class="text-right">
                                <button type="reset" class="btn btn-warning">Reset</button>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
