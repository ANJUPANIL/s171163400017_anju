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
<title>Contacts</title>
<style type="text/css">

.panel
{
    margin-bottom: 20px;
    margin-right: 120px;
    margin-left: 120px;
}


</style>
</head>
<body>
<header id="topNav" class="topHead">
		<!-- remove class="topHead" if no topHead used! -->
		<div class="container">
			
			<!-- Logo text or image -->
			<a class="logo" href="index"> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<img 
					src="resources/images/logo.jpg" alt="Electech" width="150" height="100" />
			</a>
			<form class="navbar-form navbar-right" role="search" name="searchproduct" action="searchproduct" method="POST">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search" name="pname">
				</div>
				<button type="submit" class="btn btn-default" value="Search" >
					<span class="glyphicon glyphicon-search"></span>
				</button>&nbsp;
				
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
								<a href="page-about-us.html"><i class="fa fa-angle-left"><span
								class="glyphicon glyphicon-hand-right"></span>Orders</i></a>&nbsp; &nbsp;
				 				<a href="registration"><i class="fa fa-angle-right"><span
									class="glyphicon glyphicon-user"></span></i> Register</a>&nbsp;&nbsp; 
								<a href="login"><i class="fa fa-angle-right"><span
									class="glyphicon glyphicon-log-in"></span></i> Sign In</a>
						</div>
					</c:when>
					<c:when test="${not empty userid }">
						<div class="pull-right nav hidden-xs">
							<i class="fa fa-angle-left" style="color:#0000CD"><span class="glyphicon glyphicon-user">
								</span>Welcome <%= session.getAttribute( "welcomemsg" )%> </i>&nbsp; &nbsp;
							<a href="page-about-us.html"><i class="fa fa-angle-left"><span
								class="glyphicon glyphicon-hand-right"></span>Orders</i></a>&nbsp; &nbsp;
				
							<a href="mycart"><i class="fa fa-angle-left" data-toggle="tooltip" data-placement="right" title="View your shopping cart"><span
								class="glyphicon glyphicon-shopping-cart"></span>Cart(${cartsize})</i></a>&nbsp; &nbsp;
				
							<a href="logout"><i class="fa fa-angle-left"><span
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
							
							<li><c:forEach  var="category" items="${category}">
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
					
					<li><a href="blog">BLOG</a></li>
					<li><a href="contactus">CONTACTS</a></li>
				</ul>
			</div>
		</nav>
		
	<!-- Contact us part -->
	<h3 style="color:#0000CD">CONTACTS</h3><br>	
	<div class="panel panel-default">
  	<div class="panel-body">
    <h4><b>Contact info</b></h4><br><br>

		We are always ready to help you. There are many ways to contact us. 
		You may drop us a line, give us a call or send an email, choose what suits you most.<br><br><br>
		<p style="color:#7f8496;">
		<b>Address:</b>The Company Name Inc. 9870 St Vincent Place, Glasgow, DC 45 Fr 45.<br>
		<b>Telephone:</b> +1 800 603 6035<br>
		<b>FAX:</b>+1 800 889 9898<br>
		<b>E-mail:</b>mail@demolink.org<br>
    	</p>
  </div>
</div>
<div class="container">
<div class="panel panel-default">
  	<div class="panel-body">
  	<h4><b>Contact Form</b></h4><br><br>
	<div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="well well-sm">
        
          <form class="form-horizontal" action="" method="post">
          <fieldset>
            <br>
    	
            <!-- Name input-->
            <div class="form-group">
              <label class="col-md-3 control-label" for="name">Name</label>
              <div class="col-md-9">
                <input id="name" name="name" type="text" placeholder="Your name" class="form-control" required="true" >
              </div>
            </div>
    
            <!-- Email input-->
            <div class="form-group">
              <label class="col-md-3 control-label" for="email">Your E-mail</label>
              <div class="col-md-9">
                <input id="email" name="email" type="text" placeholder="Your email" class="form-control" required="true" >
              </div>
            </div>
    
            <!-- Message body -->
            <div class="form-group">
              <label class="col-md-3 control-label" for="message">Your message</label>
              <div class="col-md-9">
                <textarea class="form-control" id="message" name="message" placeholder="Please enter your message here..." rows="5" required="true"></textarea>
              </div>
            </div>
    
            <!-- Form actions -->
            <div class="form-group">
              <div class="col-md-12 text-right">
                <button type="submit" class="btn btn-primary btn-lg">Submit</button>
              </div>
            </div>
          </fieldset>
          </form>
        </div>
      </div>
	</div>
	</div>
	</div>
</div>
<br>
<br>
<br>
</body>


</html>