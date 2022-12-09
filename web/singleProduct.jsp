<%-- 
    Document   : singleProduct.jsp
    Created on : 7 Dec, 2022, 6:21:08 PM
    Author     : Rohit
--%>

<%@page import="Entities.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Product product = (Product) session.getAttribute("product");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%@include file="header.jsp"%>

        <div class="container">
            <div class="row my-1">
                <div class="col-12 col-sm-5 offset-sm-1">
                    <div class="card text-center">
                        <img class="img-fluid" style="height:340px;width:100%" src="Files/Images/<%= product.getImages().get(0).getImageUrl()%>"/>
                    </div>
                    <div class="row">
                        <% for (int i = 1; i < product.getImages().size(); i++) {%>
                        <div class="col-12 col-sm-4 m-0 p-1">
                            <img class="img-fluid" style="height:190px;width:100%" src="Files/Images/<%= product.getImages().get(i).getImageUrl()%>"/>
                        </div>
                        <%}%>
                    </div>
                </div>
                <div class="col-12 col-sm-5 pt-5">
                    <div class="">
                        <h2 class="text-success"><%= product.getTitle()%></h2>
                        <p class="text-muted"><%= product.getDiscription()%></p>
                        <h6 class="text-muted">Brand : <%= product.getBrand()%></h6>
                        <h6 class="text-muted">Color : <%= product.getColor()%></h6>
                        <h4 class="text-success"><%= product.getMrp()%> <span>&#8360;</span></h4>
                        <div class="text-right">
                            <button onclick="addToCart('<%= product.getProduct_ref_id()%>', '<%= product.getTitle()%>', '<%= product.getMrp()%>')" class="btn btn-outline-danger">Add to cart</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
