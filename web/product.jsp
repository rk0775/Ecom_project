<%-- 
    Document   : product.jsp
    Created on : 7 Dec, 2022, 4:52:20 PM
    Author     : Rohit
--%>

<%@page import="HelperClasses.StringOperation"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row m-0 p-0">
            <%@include file="header.jsp"%>
        </div>

        <div   class="mt-3 container">
            <div class="row my-3">
                <%
                    if (session.getAttribute("products") != null) {
                        List<Product> products = (List<Product>) session.getAttribute("products");
                        for (Product pr : products) {
                %>

                <div class="col-12 col-sm-4 col-md-3 mt-5" >
                    <div class="card card-body m-0 p-0">

                        <img onclick="SingleProduct('<%= pr.getProduct_ref_id()%>')" src="Files/Images/<%= pr.getImages().get(0).getImageUrl()%>" style="max-height:200px;width:100%" class="img-fluid">

                        <h5 onclick="SingleProduct('<%= pr.getProduct_ref_id()%>')" class="text-Dark mx-1 mt-1 pointer"><%= pr.getTitle()%> ( <%= pr.getBrand()%> )</h5>
                        <p class="text-muted mx-1" ><%= StringOperation.shortDisProvider(pr.getDiscription(), 20)%></p>


                        <div class="row mx-1"> 
                            <div class="col-9"><h6 class="text-success" ><%= pr.getMrp()%> <span>&#8360;</span></h6></div>
                            <div class="col-3 text-right pointer"><i onclick="addToCart('<%= pr.getProduct_ref_id()%>', '<%= pr.getTitle()%>', '<%= pr.getMrp()%>')" class="fa fa-cart-plus"></i></div>
                        </div>

                    </div>
                </div>
                <%
                        }//for loop end here
                        session.removeAttribute("products");
                    }//if condition end here
                %>


            </div>


        </div> 

        <div class="container my-5">
            <!-- user info pagination  code -->
            <ul class="pagination justify-content-end">
                <%
                    int totalPage = ((Integer) session.getAttribute("totalProductCount") / (Integer) session.getAttribute("purPageLimit")) + 1;
                    int pageno = Integer.parseInt(request.getParameter("pageNo"));

                    if (pageno == 1) {
                %>
                <li class="page-item "><a class="page-link">&laquo;</a></li>
                    <%
                    } else {
                    %>
                <li class="page-item  "><a href="ProductServlet?action=fetchAll&pno=<%= pageno - 1%>" class="page-link">&laquo;</a></li>
                    <%
                        }
                        for (int i = 1; i <= totalPage; i++) {
                            if (pageno == i) {
                    %>
                <li class="page-item active "><a class="page-link"><%= i%></a></li>
                    <%
                    } else {
                    %>
                <li class="page-item"><a href="ProductServlet?action=fetchAll&pno=<%= i%>" class="page-link"><%= i%></a></li>
                    <%
                            }

                        }
                        if (pageno == totalPage) {
                    %>
                <li class="page-item "><a class="page-link">&raquo;</a></li>
                    <%
                    } else {
                    %>
                <li class="page-item  "><a href="ProductServlet?action=fetchAll&pno=<%= pageno + 1%>" class="page-link">&raquo;</a></li>
                    <%
                        }%>
            </ul>   
            <!-- user info pagination end -->


        </div>
    </body>
</html>

<script>

    function SingleProduct(id) {
        window.location.replace("ProductServlet?id=" + id + "&action=fetchSingle");
    }
</script>
