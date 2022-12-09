<%-- 
    Document   : login
    Created on : 7 Dec, 2022, 9:07:57 AM
    Author     : Rohit
--%>

<%@page import="HelperClasses.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//at the first we find the user login or not
    Message msg = (Message) session.getAttribute("message");
%>
<!DOCTYPE html>
<html>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp"%>

        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-sm-6 offset-sm-3">
                    <div class="card m-1 m-sm-5 p-1 p-sm-2">
                        <h3 class="text-muted text-center">Login Here!</h3>

                        <% if (msg != null) {%>

                        <div class="alert <%= msg.type%>"><%= msg.message%></div>
                        <%
                                session.removeAttribute("message");
                            }%>

                        <form action="LoginRegisterServlet" method="post" >
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Check me out</label>
                            </div>
                            <!-- this hidden input because seperate the login and register request  -->
                            <input type="hidden" value="login" name="reqType" />
                            <div class="text-right">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
