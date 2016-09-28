<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<title>User Home</title>
</head>
<style>
.panel-default{
    text-align:center;
    cursor:pointer;
    font-family: 'Raleway',sans-serif;
}
.panel-default > .panel-footer {
    color: #fff;
    background-color: #47c8ed;    
    display:none;
    text-shadow: 1px 1px 1px rgba(150, 150, 150, 1);
}
.panel-default i{
    font-size: 5em;
    }	
	
</style>
<script type="text/javascript">

$(function(){
	$('.panel').hover(function(){
	        $(this).find('.panel-footer').slideDown(250);
	    },function(){
	        $(this).find('.panel-footer').slideUp(250); //.fadeOut(205)
	    });
	})
</script>
<body>
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
			&nbsp;
			<c:choose>
				<c:when test="${empty userid or loggedout==true}">
					<a href="login"><button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-shopping-cart"></span>
						</button></a>
				</c:when>
			</c:choose>
		</form>

	</div>
	</header>

	<header id="topHead">
	<div class="container">


		<!-- LINKS -->
		<c:choose>
			<c:when test="${empty userid or loggedout==true}">
				<div class="pull-right nav hidden-xs">
					<a href="login"><i class="fa fa-angle-left"><span
							class="glyphicon glyphicon-hand-right"></span>Orders</i></a>&nbsp; &nbsp;
					<a href="register" id="registration"><i class="fa fa-angle-right"><span
							class="glyphicon glyphicon-user"></span></i> Register</a>&nbsp;&nbsp; <a
						href="login"><i class="fa fa-angle-right"><span
							class="glyphicon glyphicon-log-in"></span></i> Sign In</a>
				</div>
			</c:when>
			<c:when test="${not empty userid }">
				<div class="pull-right nav hidden-xs">
					<i class="fa fa-angle-left" style="color: #0000CD"><span
						class="glyphicon glyphicon-user"> </span>Welcome <%=session.getAttribute("welcomemsg")%>
					</i>&nbsp; &nbsp; <a href="vieworders"><i
						class="fa fa-angle-left"><span
							class="glyphicon glyphicon-hand-right"></span>Orders</i></a>&nbsp; &nbsp;

					<a href="mycart"><i class="fa fa-angle-left"
						data-toggle="tooltip" data-placement="right"
						title="View your shopping cart"><span
							class="glyphicon glyphicon-shopping-cart"></span>Cart(${cartsize})</i></a>&nbsp;
					&nbsp; <a href="logout"><i class="fa fa-angle-left"><span
							class="glyphicon glyphicon-off"></span>Logout</i></a>


				</div>
			</c:when>
		</c:choose>

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
							<li><c:choose>
								<c:when test="${empty userid or loggedout==true}">
									<a href="<c:url value='/productgallery?name=${category}' />">${category}</a>
								</c:when>
								<c:when test="${not empty userid }">
									<a href="<c:url value='/shopproduct?name=${category}' />">${category}</a>
								</c:when>
							</c:choose>
							</li>
							<li role="separator" class="divider"></li>
						</c:forEach></li>

				</ul></li>
			<c:choose>
				<c:when test="${empty userid or loggedout==true}">

					<li><a href="about">ABOUT</a></li>
				</c:when>
				<c:when test="${not empty userid }">
					<li><a href="userprofile">PROFILE</a></li>
				</c:when>
			</c:choose>

			<li><a href="contactus">CONTACTS</a></li>
		</ul>


	</div>
	</nav>
<center><h2 style="color:#0000CD">SHOP</h2></center>

<div class="container">
	<div class="row">
		<div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/mobile.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Mobiles</h4>
                </div>
                <div class="panel-footer"><c:choose>
								<c:when test="${empty userid or loggedout==true}">
									<a href="<c:url value='/productgallery?name=Mobiles' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
								<c:when test="${not empty userid }">
									<a href="<c:url value='/shopproduct?name=Mobiles' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
							</c:choose></div>
            </div>
									       </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/laptop.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Laptops</h4>
                </div>
                <div class="panel-footer"><c:choose>
								<c:when test="${empty userid or loggedout==true}">
									<a href="<c:url value='/productgallery?name=Laptops' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
								<c:when test="${not empty userid }">
									<a href="<c:url value='/shopproduct?name=Laptops' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
							</c:choose></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/tablet.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Tablets</h4>
                </div>
                <div class="panel-footer"><c:choose>
								<c:when test="${empty userid or loggedout==true}">
									<a href="<c:url value='/productgallery?name=Tablets' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
								<c:when test="${not empty userid }">
									<a href="<c:url value='/shopproduct?name=Tablets' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
							</c:choose></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/desktop.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Desktops</h4>
                </div>
                <div class="panel-footer"><c:choose>
								<c:when test="${empty userid or loggedout==true}">
									<a href="<c:url value='/productgallery?name=Desktops' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
								<c:when test="${not empty userid }">
									<a href="<c:url value='/shopproduct?name=Desktops' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
							</c:choose></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/car.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Car Accessories</h4>
                </div>
                <div class="panel-footer"><c:choose>
								<c:when test="${empty userid or loggedout==true}">
									<a href="<c:url value='/productgallery?name=Car Accessories' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
								<c:when test="${not empty userid }">
									<a href="<c:url value='/shopproduct?name=Car Accessories' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
							</c:choose></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/camera.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Cameras</h4>
                </div>
                <div class="panel-footer"><c:choose>
								<c:when test="${empty userid or loggedout==true}">
									<a href="<c:url value='/productgallery?name=Cameras' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
								<c:when test="${not empty userid }">
									<a href="<c:url value='/shopproduct?name=Cameras' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
							</c:choose></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/security.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Security System</h4>
                </div>
                <div class="panel-footer"><c:choose>
								<c:when test="${empty userid or loggedout==true}">
									<a href="<c:url value='/productgallery?name=Security System' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
								<c:when test="${not empty userid }">
									<a href="<c:url value='/shopproduct?name=Security System' />" style="color:#0000CD">SHOP NOW!!</a>
								</c:when>
							</c:choose></div>
            </div>
        </div>
	</div>
</div>



		
	
</body>
</html>