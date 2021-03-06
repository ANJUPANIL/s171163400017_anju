<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js">
	
</script>


<title>Shop Product</title>
</head>
<script>
	$(document).ready(function() {

		$(".tip-right").tooltip({
			placement : 'right'
		});

	});

	function myFunction() {
		alert("${msg}")

	}
</script>

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

	<h3>
		<b><%=session.getAttribute("name")%></b>
	</h3>

	<div class="container">
		<div class="row">
			<div class="col-md-9 well admin-content">

				<section id="plans">
				
						<c:choose>
							<c:when test="${empty emptymsg==true}">
								<c:forEach items="${product}" var="product">
									<!-- item -->
									<div class="col-md-5 text-center" style="width:275px;height:500px">
										<div class="panel panel-warning panel-pricing">
											<div class="panel-heading">
												<i class="fa fa-desktop"></i> <a
													href="quicklook?pid=${product.id}"><img
													src="${product.product_image}" width="200px" height="200px"
													data-toggle="tooltip" data-placement="right"
													title="Quick View" /></a> </i>
											</div>
											<div class="panel-body text-center">
												<p style="color: red">${product.product_type}</p>
												<h4>
													<p>
														<strong>${product.name}</strong>
													</p>
												</h4>
											</div>
											<ul class="list-group text-center">
												<li class="list-group-item"><b>Brand : </b><i
													class="fa fa-check"></i>${product.brands.brand_name}</li>
												<!--  <li class="list-group-item"><b>Description : </b><i
													class="fa fa-check"></i> ${product.des}</li>-->
												<li class="list-group-item"><b>Price : </b><i
													class="fa fa-check"></i> ${product.price}&nbsp;&nbsp;&nbsp;<i style="background-color:yellow">${product.discount} %off</i></li>
												
											</ul>

											<div class="panel-footer">
												<a href="<c:url value='/addcart?id=${product.id}' />"
													class="btn btn-block btn-primary"><span
					class="glyphicon glyphicon-shopping-cart"></span>  Add to Cart</a>
											</div>
										</div>
									</div>
									<!-- /item -->

								</c:forEach>
							</c:when>
							<c:otherwise>

								<div class="alert alert-info col-md-8 ">

									<strong>Info!</strong> ${emptymsg}
								</div>



							</c:otherwise>
						</c:choose>
					
				</section>
			</div>
			<h4>
				<i style="color: red">${msg}</i>
			</h4>
			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked admin-menu ">

					<li align="center" class="btn btn-lg btn-block btn-primary">SHOP</li>

					<li><c:forEach var="category" items="${category}">
							<li><a
								href="<c:url value='/shopproduct?name=${category}' />">${category}</a>
							</li>
							<li role="separator" class="divider"></li>
						</c:forEach></li>

				</ul>
			</div>
			<br />

			<div class="col-md-3">
				<div class="panel panel-primary">
					<div class="panel-heading" align="center">Filter By Brand</div>
					<div class="panel-body">
						<div class="form-group">
							<ul class="nav nav-pills nav-stacked admin-menu ">
								<c:forEach items="${brand}" var="brand">

									<li><a
										href="shopbrandproduct?name=<%= request.getParameter("name") %>&bname=${brand.brands.brand_name}">${brand.brands.brand_name}</a>
									<li>
								</c:forEach>
							</ul>
						</div>


					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>