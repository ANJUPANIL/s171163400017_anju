 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
<title>Insert title here</title>
</head>

<style>
#login {
	padding-top: 20px
}

#login .form-wrap {
	width: 45%;
	margin: 0 auto;
}

#login h1 {
	color: #1fa67b;
	font-size: 18px;
	text-align: center;
	font-weight: bold;
	padding-bottom: 20px;
}

#login .form-group {
	margin-bottom: 25px; # login .btn.btn-custom { font-size : 14px;
	margin-bottom: 20px;
}

.form-control {
	color: #212121;
}

.btn-custom {
	color: #fff;
	background-color: #1fa67b;
}

.btn-custom:hover, .btn-custom:focus {
	color: #fff;
}

#footer {
	color: #6d6d6d;
	font-size: 12px;
	text-align: center;
}

#footer p {
	margin-bottom: 0;
}

#footer a {
	color: inherit;
}
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$(".tip-right").tooltip({
			placement : 'right'
		});

	});

	function Validate() {
		var password = document.getElementById("password").value;
		var confirmPassword = document.getElementById("confirm_password").value;
		if (password != confirmPassword) {
			alert("Passwords do not match.");
			return false;
		}
		return true;
	}
</script>
<body>
	<header id="topNav" class="topHead"> <!-- remove class="topHead" if no topHead used! -->
	<div class="container">

		<!-- Logo text or image -->
		<a class="logo" href="/"> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<img
			src="resources/images/logo.jpg" alt="Electech" width="150"
			height="100" />
		</a>

		<!-- PHONE/EMAIL -->
		<div>
			<span class="quick-contact pull-left"> <i class="fa fa-phone"></i><span
				class="glyphicon glyphicon-earphone"></span> 1800-555-1234 &bull; <a
				class="hidden-xs" href="mailto:mail@yourdomain.com">mail@domain.com</a>
			</span>
		</div>
		<div class="pull-right nav hidden-xs">
			<a href="index" data-toggle="tooltip" data-placement="right"
				title="Back to home..Click here..."><i class="fa fa-angle-right"><span
					class="glyphicon glyphicon-home"></span></i> Home</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="login" data-toggle="tooltip" data-placement="right"
				title="Already have an account?Signin here..."><i
				class="fa fa-angle-right"><span
					class="glyphicon glyphicon-log-in"></span></i> Login</a>&nbsp;&nbsp;
			<!-- /LINKS -->
		</div>
		<div>
			<hr width=100% color="green" align=left>
		</div>
	</div>
	</header>


	<section id="login">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="form-wrap">
					<h1>Create Account</h1>
					<form:form modelAttribute="userdetails">
						<div class="form-group">
							<div class="col-sm-4 form-group">
								<form:label path="fname">First Name</form:label>
								<form:input path="fname" class="form-control" id="fname"
									required="true" autofocus="true" />
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('fname')}"
									var="err">
									<div>
										<span>${err.text}</span>
									</div>
								</c:forEach>
							</div>

							<div class="col-sm-4 form-group">
								<form:label path="sname">Second Name</form:label>
								<form:input path="sname" class="form-control" id="sname"
									required="true" />
								<!-- to display validation messages -->
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('sname')}"
									var="err">
									<div>
										<span>${err.text}</span>
									</div>
								</c:forEach>
							</div>
							<div class="col-sm-4 form-group">
								<form:label path="lname">Last Name</form:label>
								<form:input path="lname" class="form-control" id="lname"
									required="true" />
								<!-- to display validation messages -->
								<c:forEach
									items="${flowRequestContext.messageContext.getMessagesBySource('lname')}"
									var="err">
									<div>
										<span>${err.text}</span>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="form-group">
							<form:label path="dob">Date of Birth</form:label>
							<form:input path="dob" class="form-control" id="dob"
								placeholder="dd/mm/yyyy" pattern="\d{2}/\d{2}/\d{4}"
								required="true" title="dd/mm/yyyy" />
							<!-- to display validation messages -->
							<c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('dob')}"
								var="err">
								<div>
									<span>${err.text}</span>
								</div>
							</c:forEach>
						</div>
						<div class="form-group">
							<form:label path="address">Address</form:label>
							<form:textarea name="Text1" cols="40" rows="5" id="address"
								path="address" class="form-control" required="true" />
							<!-- to display validation messages -->
							<c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('address')}"
								var="err">
								<div>
									<span>${err.text}</span>
								</div>
							</c:forEach>
						</div>

						<div class="form-group">
							<form:label path="city">City</form:label>
							<form:input path="city" class="form-control" id="city"
								required="true" />
							<!-- to display validation messages -->
							<c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('city')}"
								var="err">
								<div>
									<span>${err.text}</span>
								</div>
							</c:forEach>
						</div>
						<div class="form-group">
							<form:label path="contact">Contact</form:label>
							<form:input path="contact" class="form-control" id="contact"
								required="true" pattern="[0-9]{10}"
								title="Enter 10 digit contact number" />
							<!-- to display validation messages -->
							<c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('contact')}"
								var="err">
								<div>
									<span>${err.text}</span>
								</div>
							</c:forEach>
						</div>
						<div class="form-group">
							<form:label path="user_id">Email ID</form:label>
							<form:input path="user_id" class="form-control" id="user_id"
								placeholder="somebody@example.com" required="true"
								pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" />
							<!-- to display validation messages -->
							<c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('user_id')}"
								var="err">
								<div>
									<span>${err.text}</span>
								</div>
							</c:forEach>
							<c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('msg')}"
								var="err">
								<div style="color: #FF0000" size="5px">
									<span>${err.text}</span>
								</div>
							</c:forEach>
						</div>
						<div class="form-group">
							<form:label path="password">Password</form:label>
							<form:password path="password" class="form-control" id="password"
								placeholder="Password" required="true" pattern=".{6,15}"
								title="Your password must between 6 and 15 characters" />
							<!-- to display validation messages -->
							<c:forEach
								items="${flowRequestContext.messageContext.getMessagesBySource('password')}"
								var="err">
								<div>
									<span>${err.text}</span>
								</div>
							</c:forEach>
						</div>
						<div class="form-group">
							<b>Confirm Password</b> <br> <input type="password"
								name="cpass" id="confirm_password" class="form-control"
								placeholder="Confirm Password" required="true">
						</div>
						<input name="_eventId_submit" type="submit" value="Submit"
							id="btn-login"
							class="btn btn-custom btn-lg btn-block btn-success" />
						<!--  <input type="submit" id="btn-login" class="btn btn-custom btn-lg btn-block btn-success" value="Register" onclick="return Validate()" > -->

					</form:form>
					
						
					<hr>
				</div>
			</div>
			<!-- /.col-xs-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container --> </section>
	<footer id="footer" align="center">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<p>Page © - 2016</p>
				<p>
					Powered by <strong><a href="index">Eletech</a></strong>
				</p>
			</div>
		</div>
	</div>
	</footer>
</body>

</html>