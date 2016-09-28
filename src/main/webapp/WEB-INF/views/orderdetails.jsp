<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js">
	
</script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<title>Order Summary</title>
<style type="text/css">
.panel {
	margin-bottom: 20px;
	margin-right: 20px;
	margin-left: 20px;
}

h4.bg-primary{
    padding: 15px;
}
.cards{
    padding-left:0;
}
.cards li {
  -webkit-transition: all .2s;
  -moz-transition: all .2s;
  -ms-transition: all .2s;
  -o-transition: all .2s;
  transition: all .2s;
  background-image: url('//c2.staticflickr.com/4/3713/20116660060_f1e51a5248_m.jpg');
  background-position: 0 0;
  float: left;
  height: 32px;
  margin-right: 8px;
  text-indent: -9999px;
  width: 51px;
}
.cards .mastercard {
  background-position: -51px 0;
}
.cards li {
  -webkit-transition: all .2s;
  -moz-transition: all .2s;
  -ms-transition: all .2s;
  -o-transition: all .2s;
  transition: all .2s;
  background-image: url('//c2.staticflickr.com/4/3713/20116660060_f1e51a5248_m.jpg');
  background-position: 0 0;
  float: left;
  height: 32px;
  margin-right: 8px;
  text-indent: -9999px;
  width: 51px;
}
.cards .amex {
  background-position: -102px 0;
}
.cards li {
  -webkit-transition: all .2s;
  -moz-transition: all .2s;
  -ms-transition: all .2s;
  -o-transition: all .2s;
  transition: all .2s;
  background-image: url('//c2.staticflickr.com/4/3713/20116660060_f1e51a5248_m.jpg');
  background-position: 0 0;
  float: left;
  height: 32px;
  margin-right: 8px;
  text-indent: -9999px;
  width: 51px;
}
.cards li:last-child {
  margin-right: 0;
}
/* images end */
.container{
    border: none;
}
.panel-footer{
    background:#fff;
}
.btn{
    border-radius: 1px;
}
.btn-sm, .btn-group-sm > .btn{
    border-radius: 1px;
}
.input-sm, .form-horizontal .form-group-sm .form-control{
    border-radius: 1px;
}

.panel-info {
    border-color: #999;
}

.panel-heading {
    border-top-left-radius: 1px;
    border-top-right-radius: 1px;
}
.panel {
    border-radius: 1px;
}
.panel-info >{
    color: #eee;
    border-color: #999;
}
.panel-info > .panel-heading {
    background-image: linear-gradient(to bottom, #555 0px, #888 100%);
}

hr {
    border-color: #999 -moz-use-text-color -moz-use-text-color;
}

.panel-footer {
    border-bottom-left-radius: 1px;
    border-bottom-right-radius: 1px;
    border-top: 1px solid #999;
}

.btn-link {
    color: #888;
}

hr{
    margin-bottom: 10px;
    margin-top: 10px;
}

/** MEDIA QUERIES **/
@media only screen and (max-width: 989px){
    .span1{
        margin-bottom: 15px;
        clear:both;
    }
}

@media only screen and (max-width: 764px){
    .inverse-1{
        float:right;
    }
}

@media only screen and (max-width: 586px){
    .cart-titles{
        display:none;
    }
    .panel {
        margin-bottom: 1px;
    }
}

.form-control {
    border-radius: 1px;
}

@media only screen and (max-width: 486px){
    .col-xss-12{
        width:100%;
    }
    .cart-img-show{
        display: none;
    }
    .btn-submit-fix{
        width:100%;
    }
    
}



    
</style>
<script type="text/javascript">

function fun()
{
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!

var yyyy = today.getFullYear();
if(dd<10){
    dd='0'+dd
} 
if(mm<10){
    mm='0'+mm
} 
var today = dd+'/'+mm+'/'+yyyy;
document.getElementById("DATE").value = today;
}
</script>

</head>
<body onload="fun()">
	<header id="topNav" class="topHead"> <!-- remove class="topHead" if no topHead used! -->
	<div class="container">

		<!-- Logo text or image -->
		<a class="logo" href="index.jsp"> <img src="resources/images/logo.jpg" alt="Electech" width="150"
			height="100" style="margin-left:20px" />
		</a>
		<form class="navbar-form navbar-right" role="search"
			name="searchproduct" action="searchproduct" method="POST">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search"
					name="pname" required="true">
			</div>
			<button type="submit" class="btn btn-default" value="Search">
				<span class="glyphicon glyphicon-search"></span>
			</button>
		</form>

	</div>
	</header>
	<header id="topHead">
	<div class="container">


		<!-- LINKS -->

		<div class="pull-right nav hidden-xs">
			<i class="fa fa-angle-left" style="color: #0000CD"><span
				class="glyphicon glyphicon-user"> </span>Welcome <%=session.getAttribute("welcomemsg")%>
			</i>&nbsp; &nbsp; <a href="vieworders"><i
				class="fa fa-angle-left"><span
					class="glyphicon glyphicon-hand-right"></span>Orders</i></a>&nbsp; &nbsp; <a
				href="mycart"><i class="fa fa-angle-left" data-toggle="tooltip"
				data-placement="right" title="View your shopping cart"><span
					class="glyphicon glyphicon-shopping-cart"></span>Cart(${cartsize})</i></a>&nbsp;
			&nbsp; <a href="logout"><i class="fa fa-angle-left"><span
					class="glyphicon glyphicon-off"></span>Logout</i></a>


		</div>
		<!-- PHONE/EMAIL -->
		<span class="quick-contact pull-left"> <i class="fa fa-phone"></i><span
			class="glyphicon glyphicon-earphone"></span> 1800-555-1234 &bull; <a
			class="hidden-xs" href="mailto:mail@yourdomain.com">mail@domain.com</a>
		</span>
		<!-- /LINKS -->

		<div>
			<hr width=100% align=left>
		</div>

		<!-- TOP NAV -->

	</div>
	</header>
	<nav class="navbar navbar-inverse navbar-fixed">
	<div class="container-fluid">

		<ul class="nav navbar-nav">
			<li class="active"><a href="index">HOME</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">SHOP <span class="caret"></span></a>
				<ul class="dropdown-menu">

					<li><c:forEach var="category" items="${category}">
							<li><a
								href="<c:url value='/shopproduct?name=${category}' />">${category}</a>
							</li>
							<li role="separator" class="divider"></li>
						</c:forEach></li>

				</ul></li>
			<li><a href="userprofile">PROFILE</a></li>
			
			<li><a href="contactus">CONTACTS</a></li>
		</ul>
	</div>
	</nav>
	
<h3>Order Summary</h3><br>
		<form:form modelAttribute="details">
		<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <b>Shipping to : </b>${details.user.fname } ${details.user.sname } ${details.user.lname }
    </div>
    <div class="col-sm-4">
      <b>Order Id : </b>${details.order_no}
    </div>
    <div class="col-sm-4">
        <b>Order Date : </b><input name="order_date" id="DATE"  style="background-color:white">
   </div>
  </div>
</div>
	<!-- panel preview -->
	<div class="col-sm-5">
		
		<br/><br/>
		
		<div class="panel panel-default">
			<div class="panel-body form-horizontal payment-form">
			<b>Your details</b><br/><br/>
				<div class="form-group">
					<label for="concept" class="col-sm-3 control-label">Name</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="name" name="name" value="${details.user.fname } ${details.user.sname } ${details.user.lname }"
							disabled="true">
					</div>
				</div>
				<div class="form-group">
					<label for="description" class="col-sm-3 control-label">Email
						ID</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="user_id" value="${details.user.user_id}"
							name="user_id" disabled="true">
					</div>
				</div>
				<div class="form-group">
					<label for="amount" class="col-sm-3 control-label">Contact</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="amount" name="amount" value="${details.user.contact}"
							disabled="true">
					</div>
				</div>
				<div class="form-group">
					<label for="status" class="col-sm-3 control-label">Address</label>
					<div class="col-sm-9">
						<textarea class="form-control" id="address" rows="5"
							name="address" disabled="true">${details.user.address}</textarea>
					</div>
				</div>


			</div>
		</div>
		
	</div>
	<!-- / panel preview -->
	
	
	<div class="col-sm-5">
	<br/><br/>
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-body form-horizontal payment-form">
					<div class="form-group">
						
							<label path="address">Billing Address</label>
							<div style="margin-right: 20px;margin-left: 20px;" >
							<textarea name="Text1" cols="30" rows="5" id="billing_address"
								path="billing_address" class="form-control" disabled="true">${details.billing_address}</textarea>
						</div>
							
						<hr style="border: 1px dashed #dddddd;">
						
						<b>Shipping Address</b>

						
							<label path="address"> </label>
							<div style="margin-right: 20px;margin-left: 20px;" >
							<textarea name="Text1" cols="30" rows="5" id="shipping_address"
								path="shipping_address" class="form-control" disabled="true">${details.shipping_address}</textarea>
							</div>
					</div>
				</div>

			</div>






		</div>
		</div>
            
            <div class="row">
                <div class="col-xs-10" style="margin-right: 100px;margin-left: 30px;">
                <h4 class="bg-primary">Cart Preview:</h4>
                    <div class="table-responsive">
                        <table class="table preview-table">
                            <thead>
                                <tr>
                        <th >Product Name</th>
                        <th >Price</th>
                        <th>Quantity </th>
                        <th >Discount</th>
                        <th >Total</th>
                        <th> </th>
                     </tr>
                            </thead>
                            <tbody>
                            
                            	<c:forEach items="${cartlist}" var="cart">
                            	<tr>
                            	<td><c:out value="${cart.product.name}"></c:out></td>
                            	<td><c:out value="${cart.product.price}"></c:out></td>
                            	<td><c:out value="${cart.quantity}"></c:out></td>
                            	<td><c:out value="${cart.product.discount}"></c:out></td>
                            	<td><c:out value="${cart.total}"></c:out></td>
                            	
                            	<td>   </td>
                            	
                            	</tr>
                            	</c:forEach>
                            </tbody> <!-- preview content goes here-->
                        </table>
                    </div>                            
                </div>
            </div>
            
            <div class="form-group" align="right" style="margin-right: 100px">
                 <h3><strong>Grand Total  : <%=session.getAttribute("grandtotal") %></strong></h3></td>
                       	         
                 
                
            </div><br><br>
            
            <!--CREDIT CART PAYMENT-->
            
                
            <h4 class="bg-primary">Payment Information</h4>
            
                    <div class="panel panel-info" style="margin-right: 100px;margin-left: 100px;">
                        <div class="panel-heading"><span><i class="glyphicon glyphicon-lock"></i></span> Secure Payment</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-12"><strong>Card Type:</strong></div>
                                <div class="col-md-12">
                                    <select id="CreditCardType" name="CreditCardType" class="form-control">
                                        <option value="5">Visa</option>
                                        <option value="6">MasterCard</option>
                                        <option value="7">American Express</option>
                                        <option value="8">Discover</option>
                                    </select>
                                </div>
                                <!-- to display validation messages -->
							<c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('CreditCardType')}"
								var="err">
								<div>
									<span>${err.text}</span>
								</div>
							</c:forEach>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Credit Card Number:</strong></div>
                                <div class="col-md-12"><input type="text" class="form-control" name="cardnumber" title="Enter minimum 13 valid card number" pattern="[0-9]{13,16}"/></div>
                            	
                            </div>
                            <c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('cardnumber')}"
								var="err">
								<div>
									<span>${err.text}</span>
								</div>
							</c:forEach>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Name On Card:</strong></div>
                                <div class="col-md-12"><input type="text" class="form-control" name="car_name" /></div>
                            	<c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('car_name')}"
								var="err">
								<div>
									<span>${err.text}</span>
								</div>
							</c:forEach>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Card CVV:</strong></div>
                                <div class="col-md-12"><input type="text" class="form-control" name="car_code" title="Enter 3 digit valid  Cvvnumber" pattern="[0-9]{3}" /></div>
                            <c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('car_code')}"
								var="err">
								<div>
									<span>${err.text}</span>
								</div>
							</c:forEach>
							</div>
                            
                            <div class="form-group">
                                <div class="col-md-12">
                                    <strong>Expiration Date</strong>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control" name="expmonth">
                                        <option value="">Month</option>
                                        <option value="01">01</option>
                                        <option value="02">02</option>
                                        <option value="03">03</option>
                                        <option value="04">04</option>
                                        <option value="05">05</option>
                                        <option value="06">06</option>
                                        <option value="07">07</option>
                                        <option value="08">08</option>
                                        <option value="09">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                </select>
                                <c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('expmonth')}"
								var="err">
								<div>
									<span>${err.text}</span>
								</div>
								</c:forEach>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control" name="expyear">
                                        <option value="">Year</option>
                                        <option value="2015">2015</option>
                                        <option value="2016">2016</option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                        <option value="2023">2023</option>
                                        <option value="2024">2024</option>
                                        <option value="2025">2025</option>
                                </select>
                                <c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('expyear')}"
								var="err">
								<div>
									<span>${err.text}</span>
								</div>
							</c:forEach>
                                </div>
                            </div><br/><br/><br/><br/>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <span>Pay secure using your credit card.</span>
                                </div>
                                <div class="col-md-12">
                                    <ul class="cards">
                                        <li class="visa hand">Visa</li>
                                        <li class="mastercard hand">MasterCard</li>
                                        <li class="amex hand">Amex</li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <br/><br/><br/><br/>
                        </div>
                    </div>
                    <!--CREDIT CART PAYMENT END-->
             <input name="_eventId_edit" type="submit" value="Edit Order Details" class="btn btn-success btn-submit-fix " 
             style="width:200px;height:40px;font-size:16px;margin-left: 100px" />        
				<input name="_eventId_submit" type="submit" value="Place Your Order" class="btn btn-warning pull-right" 
				style="width:200px;height:40px;font-size:16px;margin-right: 100px" />
		
         
          <br/><br/>     <br/><br/>      
	
	
	
	</form:form>
	

</body>
</html>