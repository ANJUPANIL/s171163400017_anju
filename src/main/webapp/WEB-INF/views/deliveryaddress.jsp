<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@page import="java.io.Console"%>
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
<title>Delivery Address</title>
<style type="text/css">
.panel {
	margin-bottom: 20px;
	margin-right: 20px;
	margin-left: 20px;
}
</style>
</head>
<body>
	<header id="topNav" class="topHead"> <!-- remove class="topHead" if no topHead used! -->
	<div class="container">

		<!-- Logo text or image -->
		<a class="logo" href="index.jsp"><img src="resources/images/logo.jpg" alt="Electech" width="150"
			height="100" style="margin-left:20px" />
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
			</i>&nbsp; &nbsp; <a href="vieworders"><i
				class="fa fa-angle-left"><span
					class="glyphicon glyphicon-hand-right"></span>Orders</i></a>&nbsp; &nbsp; <a
				href="mycart"><i class="fa fa-angle-left" data-toggle="tooltip"
				data-placement="right" title="View your shopping cart"><span
					class="glyphicon glyphicon-shopping-cart"></span>Cart(<%=session.getAttribute("cartsize")%>)</i></a>&nbsp;
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

	<!-- panel preview -->
	<form:form modelAttribute="details">
	<div class="col-sm-6">
		<h4>Order Delivery Details</h4>
		
		<div class="panel panel-default">
			<div class="panel-body form-horizontal payment-form">
				<b>Your details</b><br />
				<br />
				<div class="form-group">
					<label for="concept" class="col-sm-3 control-label">Name</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="name" name="name"
							value="${details.user.fname } ${details.user.sname } ${details.user.lname } "
						disabled="true">
					</div>
				</div>
				<div class="form-group">
					<label for="description" class="col-sm-3 control-label">Email
						ID</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="user_id"
							name="user_id" value="${details.user.user_id}" disabled="true">
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
	<br />
	<br />
	<div class="col-sm-5">

		<div class="row">
			<div class="panel panel-default">
				<div class="panel-body form-horizontal payment-form">
					<div class="form-group">

						<label path="billing_address">Billing Address</label>
						<div style="margin-right: 20px; margin-left: 20px;">
							<textarea name="billing_address" cols="30" rows="5" id="billing_address"
								path="billing_address" class="form-control" required="true" >${details.user.address}</textarea>
						
						</div>
						
						
						<hr style="border: 1px dashed #dddddd;">

						<b>Shipping Address</b> <label path="shipping_address"> </label>
						<div style="margin-right: 20px; margin-left: 20px;">
							<textarea name="shipping_address" cols="30" rows="5" id="shipping_address"
								path="shipping_address" class="form-control" required="true">${details.user.address}</textarea>
						</div>
					</div>
				</div>

			</div>



		</div>
		<c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('msg')}"
								var="err">
								<div style="color: #FF0000" size="5px">
									<span>${err.text}</span>
								</div>
							</c:forEach>
		<input class="btn btn-warning pull-right" name="_eventId_submit"
			type="submit" value="Deliver to this address" /> <br />
		<br /> <br />
		<br />
	
	</div>
	
	</form:form>

</body>
</html>