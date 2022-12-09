<%-- 
    Document   : userPage
    Created on : 8 Dec, 2022, 8:59:32 PM
    Author     : Rohit
--%>

<%@page import="Entities.orders"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //User user=(User) session.getAttribute("loginUser");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container-fluid ">
            <div class="container">
                <div class="card card-body p-3 m-3">
                    <h2 class="text-muted"> <%= user.getUser_name()%> </h2>
                    <h6 class="text-muted"><%= user.getUser_email()%></h6>
                    <h6 class="text-muted"><%= user.getUser_phone()%></h6>
                    <h6 class="text-muted">***** </h6>
                    <div class="text-right">
                        <a href="LoginRegisterServlet?reqType=logout" class="btn btn-outline-dark">Logout</a>
                    </div>
                </div>
            </div>
            <div class="container my-3">
                <hr/>
                <h4 class=" text-success">Your Orders</h4>
               <div class="row">
                    <%
                     if (session.getAttribute("orders") != null) {
                        List<orders> order=(List<orders>)session.getAttribute("orders");
                        for(orders odr:order){%>
                         <div class="card card-body alert-successcol-12 col-md-5 m-3">
                        <h5 class="tet-muted">Order ID : <%= odr.getChannel_order_id() %></h5>
                        <h6 class="text-muted">Order Buyer Name : <%= odr.getBuyer_name() %> </h6>
                        <h6 class="text-muted">Order Date : <%= odr.getShip_date() %> </h6>
                        <h6 class="text-muted">Phone Number : <%= odr.getBuyer_phone_no() %> </h6>
                        <h6 class="text-muted">Product name : 
                        <% for(Product ptr:odr.getProducts()){ %>
                            <%= ptr.getTitle() %> | 
                        <%}%>
                        </h6>
                        <h6 class="text-muted">Bill Price : <span class="text-success"> <%= odr.getSold_price() %> <span>&#8360;</span></span></h6>
                        <h6 class="text-muted">Order Payment Type : <%= odr.getPayment_method() %> </h6>
                        <h6 class="text-muted">Order Status:<span class="text-warning"> <%= odr.getStatus() %> </span></h6>
                        <p class="text-success"><%= odr.getShiping_addr1() +" "+odr.getShip_city()+" "+odr.getShip_state()+" "+odr.getShip_contry()+", "+odr.getShip_postal_code() %></p>
                        
                         </div>
                       <% }
                     }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
