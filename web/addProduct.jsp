<%-- 
    Document   : addProduct
    Created on : 7 Dec, 2022, 1:22:27 PM
    Author     : Rohit
--%>

<%@page import="HelperClasses.Message"%>
<%@page import="Entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--This page can access only Admin user -->
<%
    User u = (User) session.getAttribute("loginUser");
    if (u == null || u.getUser_type().equalsIgnoreCase("normal_user")) {
        session.setAttribute("message", new Message("error", "Opps! ,You can not access this page..", "alert-danger"));
        response.sendRedirect("login.jsp");
    }
    Message msg = (Message) session.getAttribute("message");
    session.removeAttribute("message");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <%@include file="header.jsp"%>
            </div>
            <div class="row">
                <div class="col-12 col-sm-10 offset-sm-1">
                    <div class="card m-1 m-sm-5 p-1 p-sm-2">
                        <h3 class="text-muted text-center">Add the new product.</h3>

                        <% if (msg != null) {%>
                        <div class="alert <%= msg.type%>"><%= msg.message%></div>
                        <%}%>

                        <form action="ProductServlet" method="post" enctype="multipart/form-data">

                            <div class="row mt-2">
                                <div class=" col-12 col-sm-6">
                                    <input name="pName" class="form-control" type="text" placeholder="Enter product title" />
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input name="pBrand" type="text"class="form-control" placeholder="Enter product brand" />
                                </div>  
                            </div>
                            <div class="row mt-2">
                                <div class="col-12 col-sm-6">
                                    <input name="pPrice" type="text" class="form-control" placeholder="Enter product price" />
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input name="pQuantity" type="text" class="form-control" placeholder="Enter product quantity" />
                                </div>  
                            </div>

                            <div class="form-group mt-2">
                                <input  name="pColor" type="text" placeholder="Enter product color..." class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                            </div>

                            <div class="form-group mt-2">
                                <input  name="pImage" type="file" multiple placeholder="select Images" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                            </div>

                            <label class="">Enter discription of product</label>
                            <textarea name="pDiscription" class="form-control" rows="7"></textarea>
                            <input type="hidden" value="add" name="action" />
                            <!-- this hidden input because seperate the login and register request  -->
                            <input type="hidden" value="register" name="reqType" />

                            <div class="text-right my-2">
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
