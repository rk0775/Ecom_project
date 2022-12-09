<%-- 
    Document   : order.jsp
    Created on : 7 Dec, 2022, 9:37:10 PM
    Author     : Rohit
--%>

<%@page import="HelperClasses.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    User u = (User) session.getAttribute("loginUser");
    if (u == null) {
        session.setAttribute("message", new Message("error", "Please login first for checkout the product...", "alert-warning"));
        response.sendRedirect("login.jsp");
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp"%>

        <div class="container-fluid ">
            <div class="row m-0 p-0">
                <div class="col-12 col-sm-5 offset-sm-1">
                    <div class="card m-1 m-sm-5 p-1 p-sm-2">
                        <h5 class="text-success ">Fill the correct information.</h5>
                        <form id="idFordm" >
                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter the full name</label>
                                <input  name="Uname" value="<%= u.getUser_name() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp">

                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Contact number</label>
                                <input  name="phone" value="<%= u.getUser_phone() %>"  type="text" class="form-control" id="phone" aria-describedby="emailHelp">

                            </div>

                            <div class="row">

                                <div class="col-12 col-sm-6">
                                    <small class="text-muted mt-1">Country</small>
                                    <select class="form-control" name="country" id="country">
                                        <option value="India">India</option>
                                        <option value="Japan">Japan</option>
                                        <option value="Pakisthan">Pakisthan</option>
                                        <option value="US">US</option>
                                    </select>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <small class="text-muted mt-1">State</small>
                                    <select class="form-control" name="state" id="state">
                                        <option value="Maharashtra">Maharashtra</option>
                                        <option value="Gujrat">Gujrat</option>
                                        <option value="UP">UP</option>
                                        <option value="MP">MP</option>
                                        <option value="La">LA</option>

                                    </select>
                                </div>

                            </div>
                            <div class="row">

                                <div class="col-12 col-sm-6">
                                    <small class="text-muted mt-1 ">City</small>
                                    <select class="form-control" name="city" id="city">
                                        <option value="Nashik">Nashik</option>
                                        <option value="Pune">Pune</option>
                                        <option value="Mumbai">Mumbai</option>

                                    </select>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <small class="text-muted mt-1 ">Postal code</small>
                                    <input name="postalCode" id="code" class="form-control" placeholder="Postal code">
                                </div>

                            </div>
                            <div class="form-group mt-2">
                                <input  name="addr1" placeholder="Enter address one" required="true" type="text" class="form-control" id="addr1" aria-describedby="emailHelp">

                            </div>
                            <div class="form-group">
                                <input  name="addr2" placeholder="Enter address second"  type="text" class="form-control" id="addr2" aria-describedby="emailHelp">

                            </div>
                            <div class="form-group">
                                <input  name="addr3" placeholder="Enter address third" type="text" class="form-control" id="addr3" aria-describedby="emailHelp">

                            </div>
                            <div class="form-group">

                                <small class="text-muted ">Payment</small>
                                <select class="form-control" name="paymentType" id="payment">
                                    <option value="phone pay">Phone Pay</option>
                                    <option value="net banking">Net Banking</option>
                                    <option value="google pay">Google Pay</option>
                                    <option value="cash on delivery">cash on delivery</option>    
                                </select>
                            </div>


                            <!-- this hidden input because seperate the login and register request  -->
                            <input type="hidden" value="register" name="orderType" />

                            <div class="text-right">
                                <button type="reset" class="btn btn-warning">Reset</button>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>

                        </form>
                    </div>
                </div>
                <div class="col-12 mt-5 col-sm-5">

                    <div class="modal-content">
                        <div class="modal-header">


                            <h5 class="modal-title text-success " id="exampleModalLabel">Your ordered products...</h5>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body cart-body"></div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" onclick="clearLocalStorage()">Close</button>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>


<script>

    function clearLocalStorage() {
        localStorage.clear();
        Windows.location.replace("order.jsp");
    }
    
    
    $("#idFordm").submit(function (e){
        e.preventDefault(); // avoid to execute the actual submit of the form.
        
        var array = [];
        var cart = JSON.parse(localStorage.getItem("cart"));
        if(cart.length==0 ){
            alert("Opps cart is emapty!!");
            return;
        }
        var totalAmt=0;
        cart.map((item) => {
            array.push(item.id);
            totalAmt+=item.price * item.count;
        })
        
        var name = $("#name").val();
        var phone = $("#phone").val();
        var addr1 = $("#addr1").val();
        var addr2 = $("#addr2").val();
        var addr3 = $("#addr3").val();
        var payment = $("#payment").val();
        var country = $("#country").val();
        var city = $("#city").val();
        var state = $("#state").val();
        var code = $("#code").val();


        $.ajax({
            type: "POST",
            url: "OrderServlet",
            data: {Uname: name, phone: phone, country: country, city: city, state: state, postalCode: code, addr1: addr1, addr2: addr2, addr3: addr3,totalAmt:totalAmt, paymentType: payment, cart: JSON.stringify(array)}, // serializes the form's elements.
            success: function (data)
            {
                swal.fire(
                    'Order place',
                    'Your order is successfully placed. thanks for shopping...',
                    'success'
                )

                localStorage.clear();
                location.replace("userPage.jsp");
            }
        });

    });


</script>