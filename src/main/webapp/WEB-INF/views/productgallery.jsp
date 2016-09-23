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
<title>Insert title here</title>
<style type="text/css">
.glyphicon {
	margin-right: 5px;
}

.thumbnail {
	margin-bottom: 20px;
	padding: 0px;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	border-radius: 0px;
}

.item.list-group-item {
	float: none;
	width: 100%;
	background-color: #fff;
	margin-bottom: 10px;
}

.item.list-group-item:nth-of-type(odd):hover, .item.list-group-item:hover
	{
	background: #428bca;
}

.item.list-group-item .list-group-image {
	margin-right: 10px;
}

.item.list-group-item .thumbnail {
	margin-bottom: 0px;
}

.item.list-group-item .caption {
	padding: 9px 9px 0px 9px;
}

.item.list-group-item:nth-of-type(odd) {
	background: #eeeeee;
}

.item.list-group-item:before, .item.list-group-item:after {
	display: table;
	content: " ";
}

.item.list-group-item img {
	float: left;
}

.item.list-group-item:after {
	clear: both;
}

.list-group-item-text {
	margin: 0 0 11px;
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
			&nbsp; <a href="login"><button type="submit"
					class="btn btn-default" data-toggle="tooltip"
					data-placement="right" title="View your shopping cart">
					<span class="glyphicon glyphicon-shopping-cart"></span>
				</button></a>
		</form>

	</div>
	</header>

	<header id="topHead">
	<div class="container">


		<!-- LINKS -->

		<div class="pull-right nav hidden-xs">
			<a href="page-about-us.html"><i class="fa fa-angle-left"><span
					class="glyphicon glyphicon-hand-right"></span>Orders</i></a>&nbsp; &nbsp; <a
				href="registration"><i class="fa fa-angle-right"><span
					class="glyphicon glyphicon-user"></span></i> Register</a>&nbsp;&nbsp; <a
				href="login"><i class="fa fa-angle-right"><span
					class="glyphicon glyphicon-log-in"></span></i> Sign In</a>
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

	<!-- Logo part -->

	<!-- nav -->
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
								href="<c:url value='/productgallery?name=${category}' />">${category}</a>
							</li>
							<li role="separator" class="divider"></li>
						</c:forEach></li>

				</ul></li>


			<li><a href="about">ABOUT</a></li>
			
			<li><a href="contactus">CONTACTS</a></li>
		</ul>
	</div>
	</nav>

	<div class="container">

		<c:choose>
			<c:when test="${not empty name}">
				<h3>
					<b><%=session.getAttribute("name")%></b>
				</h3>
				<c:choose>
					<c:when test="${empty emptymsg==true}">
						<div class="well well-sm">
							<b>Filter By Brand</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="btn-group">
								<c:forEach items="${brand}" var="brand">

									<a
										href="brandgallery?name=<%= request.getParameter("name") %>&bname=${brand.brands.brand_name}"
										id="list" class="btn btn-default btn-sm"> <span
										class="glyphicon glyphicon-th-list"></span>${brand.brands.brand_name}</a>
								</c:forEach>
							</div>
						</div>
						<br>


						<div id="products" class="row list-group">

							<c:forEach items="${product}" var="product">

								<div class="item  col-md-4">
									<div class="thumbnail">
										<br> <img class="group list-group-image"
											src="${product.product_image}" alt="" /><br>
										<div class="caption">
											<h4 class="group inner list-group-item-heading">
												${product.name}</h4>
											<p style="color: #7f8496;">
												<b>Category :</b> ${product.categoryobj.name}&nbsp;&nbsp; <i
													style="color: red">${product.product_type} </i>
											</p>
											<p class="group inner list-group-item-text"><b style="color: #7f8496;">Product
												description... </b>${product.des}.</p>
											<div class="row">
												<div class="col-xs-12 col-md-6">
													<p class="lead">${product.price}/-</p>
												</div>
												<div class="col-xs-12 col-md-6">
													<a class="btn btn-success"
														href="quicklook?pid=${product.id}">Quick View</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</c:when>
					<c:otherwise>
						<hr>
						<div class="alert alert-info">
							
							<strong>Info!</strong> ${emptymsg}
						</div>
						<hr>
					</c:otherwise>
				</c:choose>

			</c:when>

		</c:choose>

	</div>

</body>
</html>