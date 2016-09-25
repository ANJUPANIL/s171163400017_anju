<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<title>Orders</title>
<style type="text/css">
.panel
{
    margin-bottom: 20px;
    margin-right: 50px;
    margin-left: 50px;
}
</style>

</head>
<body>
<header id="topNav" class="topHead"> <!-- remove class="topHead" if no topHead used! -->
	<div class="container">

		<!-- Logo text or image -->
		<a class="logo" href="index.jsp"> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
			&nbsp;<img src="resources/images/logo.jpg" alt="Electech" width="150"
			height="100" />
		</a>
		<form class="navbar-form navbar-right" role="search"
			name="searchproduct" action="searchproduct" method="POST">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search"
					name="pname">
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
			</i>&nbsp; &nbsp; <a href="page-about-us.html"><i
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
	
	
		<h3 style="color:#0000CD">&nbsp;&nbsp;Orders</h3><br>
			<div class="panel panel-info">
				<div class="panel-body ">
					<br><b>Your Order Details</b>
					<div align="center" class="table-responsive">
				<br>
							<table class="table">
								<tr style="font-weight: bold;">
									<td>OrderID#</td>
									<td>Product Name</td>
									<td>Billing Address</td>
									<td>Shipping Address</td>
									<td>Order Date</td>
									<td>Grand Total</td>
									
								</tr>
								<tr>
									<c:forEach items="${orderlist}" var="o">
									<tr>
									<td style="font-weight: bold;">${o.order_no}</td>
									<td>${o.cartobj.product.name}</td>
									<td>${o.billing_address}</td>
									<td>${o.shipping_address}</td>
									<td>${o.order_date}</td>
									<td>${o.grandtotal}</td>
									
									</tr>

									</c:forEach>									
								</tr>
								</table>
								</div>
							
				</div>

			</div>
		
	
</body>
</html>