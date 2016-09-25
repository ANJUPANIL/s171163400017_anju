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
<title>Insert title here</title>
</head>

<style>
#login {
	padding-top: 50px
}

#login .form-wrap {
	width: 30%;
	margin: 0 auto;
}

#login h1 {
	color: #1fa67b;
	font-size: 18px;
	text-align: center;
	font-weight: bold;
	padding-bottom: 20px;
}

#login h3 {
	color: #1fa67b;
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

	function myFunction() {
		alert("${msg}")

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
			<a href="register" id="registration" data-toggle="tooltip"
				data-placement="right" title="New to Eletech?Register here..."><i
				class="fa fa-angle-right"><span class="glyphicon glyphicon-user"></span></i>
				Register</a>&nbsp;&nbsp;
			<!-- /LINKS -->
		</div>
		<div>
			<hr width=100% color="green" align=left>
		</div>
	</div>
	</header>

	<p style="color: #008000">${msg}</p>
	<section id="login">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="form-wrap">
					<h1>Log in with your email account</h1>
					<%-- <form class="login-form" action="<c:url value= 'j_spring_security_check'/>" method="POST"> --%>
					<form class="login-form" action="<c:url value='j_spring_security_check'/>" method="POST">

					<c:if test="${not empty error}">
						<div class="error" style="color: #ff0000;">${error}</div>
					</c:if>
					<div>
						<c:if test="${not empty msg}">
							<div class="msg">${msg}
								<br> <br>
							</div>
						</c:if>
					</div>
					<input type="text" placeholder="somebody@example.com" class="form-control"
						name="j_username" required="true" autofocus="true" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"  /> <br>
					<input type="password" placeholder="password" class="form-control"
						name="j_password" required="true" /><br><br>
					<input type ="submit" class="btn btn-custom btn-lg btn-block btn-success" value="Log in"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>

					<!--   <form:form method="POST" action="loginsubmit" commandName="check_login">
                        <div class="form-group">
                            <form:label path="user_id" class="sr-only">Email</form:label>
                            <form:input path="user_id" class="form-control" placeholder="somebody@example.com" required="true" autofocus="true" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" />
                            <form:errors path="user_id" cssClass="error"/>
                        </div>
                        <div class="form-group">
                            <form:label path="password" class="sr-only">Password</form:label>
                            <form:password path="password" class="form-control" placeholder="Password" required="true"/>
                            <form:errors path="password" cssClass="error"/>
                        </div>
                        <input type="submit" id="btn-login" class="btn btn-custom btn-lg btn-block btn-success" value="Log in">
                    </form:form>-->

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