<%-- 
    Document   : header
    Created on : 7 Dec, 2022, 8:42:36 AM
    Author     : Rohit
--%>
<%@page import="Entities.User"%>
<%@include file="Files/fileProvider.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//at the first we find the user login or not
    User user = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Files/style.css" rel="stylesheet" type="text/css">
        <script src="Files/cartScript.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </head>
    <body>
        <div class="container-fluid">

            <nav class="navbar navbar-expand-lg navbar-light bg-warning">
                <a class="navbar-brand" href="#">Ecom</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ProductServlet?pno=1&action=fetchAll">Product</a>
                        </li>

                        <% if (user == null) { %>
                        <li class="nav-item">
                            <a href="login.jsp" class="nav-link ">Login</a>
                        </li>
                        <li class="nav-item">
                            <a href="register.jsp" class="nav-link ">Register</a>
                        </li>
                        <%} else if (user.getUser_type().equalsIgnoreCase("admin_user")) {%>
                        <li class="nav-item">
                            <a href="addProduct.jsp" class="nav-link "><%= user.getUser_name().split(" ")[0]%></a>

                        </li>
                        <li class="nav-item">
                            <a href="LoginRegisterServlet?reqType=logout" class="nav-link ">logout</a>

                        </li>
                        <%} else {%>
                        <li class="nav-item">
                            <a href="userPage.jsp" class="nav-link "><%= user.getUser_name().split(" ")[0]%></a>
                        </li>
                        <% }%>
                    </ul>
                    <i class="mx-4 fa fa-shopping-basket pointer text-muted" data-toggle="modal"
                       data-target="#cart"> <small class="text-small cart-num"></small></i>

                    <form action="ProductServlet" class="form-inline my-2 my-lg-0">
                        <input name="key" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <input type="hidden" name="action" value="search" />
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </nav>
        </div>

        <!-- Modal -->
        <div class="modal fade " id="cart" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">


                        <h4 class="modal-title text-muted" id="exampleModalLabel">
                            Ecom Shopping Cart</h4>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body cart-body"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                                data-dismiss="modal">Close</button>
                        <a href="order.jsp" type="button"
                           class="checkout-btn btn btn-primary">Checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
