<%-- 
    Document   : index
    Created on : 7 Dec, 2022, 8:16:03 AM
    Author     : Rohit
--%>

<%@page import="Hibernate.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="bannerImage bg-warning">
        
              <%@include file="header.jsp" %>
              <div class="row my-3">
                  <div class="col-12 col-sm-5 offset-sm-1">
                      <h1 class="text-light">E-Commerce Platform</h1>
                      <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc aliquam viverra placerat. Fusce suscipit eros in justo scelerisque malesuada. Morbi sollicitudin tellus et ante auctor, quis lacinia massa aliquam. Fusce ligula est, dapibus vel tellus eget, blandit consectetur ligula. Aenean justo ligula, laoreet at consequat ac.</p>
                      <a href="login.jsp" class=" btn btn-outline-light px-4"> Log in </a>
                      <a href="register.jsp" class=" btn btn-outline-success px-4"> Register </a>
                  </div>
                  
              </div>
        
        </div>   
        
    </body>
</html>
