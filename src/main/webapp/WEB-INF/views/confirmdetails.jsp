<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
<title>Insert title here</title>
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
    margin-bottom: 25px;
    background-color: #DCDCDC;
    

.form-control {
    color: #212121;
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
</head>
<body>
<body>
<header id="topNav" class="topHead">
		<!-- remove class="topHead" if no topHead used! -->
		<div class="container">
			
			<!-- Logo text or image -->
			<a class="logo" href="/"> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<img 
					src="resources/images/logo.jpg" alt="Electech" width="150" height="100" />
			</a>
			
			<!-- PHONE/EMAIL -->
			<div>
			<span class="quick-contact pull-left"> <i class="fa fa-phone"></i><span
				class="glyphicon glyphicon-earphone"></span> 1800-555-1234 &bull; <a
				class="hidden-xs" href="mailto:mail@yourdomain.com">mail@domain.com</a>
			</span> 
			</div>
			<div class="pull-right nav hidden-xs">
				 <a href="${flowExecutionUrl}&_eventId_home" data-toggle="tooltip" data-placement="right" title="Back to home..Click here..."><i class="fa fa-angle-right"><span
						class="glyphicon glyphicon-home"></span></i> Home</a>&nbsp;&nbsp;&nbsp;&nbsp; 
				 <a href="${flowExecutionUrl}&_eventId_login" data-toggle="tooltip" data-placement="right" title="Already have an account?Signin here..."><i class="fa fa-angle-right"><span
						class="glyphicon glyphicon-log-in"></span></i> Login</a>&nbsp;&nbsp; 
			<!-- /LINKS -->
			</div>
			<div>
				<hr width=100% color="green" align=left>
			</div>
		</div>
	</header>
	
	<section id="login">
	<div class="container" class="well">
		<div class="row">
			<div class="col-xs-12" >
				<div class="form-wrap">
					<h1>Please Confirm Your Details</h1>
					<form:form modelAttribute="userdetails">
						<div class="form-group">
							<div class="col-sm-4 form-group">
								<form:label path="fname">First Name</form:label><br /> 
								${userdetails.fname} <br /> 
							</div>

							<div class="col-sm-4 form-group">
								<form:label path="sname">Second Name</form:label><br /> 
								${userdetails.sname} <br /> 
							</div>
							<div class="col-sm-4 form-group">
								<form:label path="lname">Last Name</form:label><br /> 
								${userdetails.lname} <br />
							</div>
						</div>
						
						<div class="form-group">
							<form:label path="dob">Date of Birth  : </form:label>${userdetails.dob}
							<br /> 
						</div>
						<div class="form-group">
							<form:label path="address">Address  :  </form:label>${userdetails.address}
							<br /> 
						</div>

						<div class="form-group">
							<form:label path="city">City      : </form:label>${userdetails.city}
							<br /> 

						</div>
						<div class="form-group">
							<form:label path="contact">Contact  : </form:label>${userdetails.contact}
							<br /> 

						</div>
						<div class="form-group">
							<form:label path="user_id">Email ID  : </form:label>${userdetails.user_id}
							<br /> 

						</div>
						<div class="form-group">
							<form:label path="password">Password  : </form:label>${userdetails.password}
							<br /> 

						</div>
						<center>
						<input name="_eventId_edit" type="submit" value="Edit"  class="btn btn-primary" style="width: 120px;" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="_eventId_submit" type="submit" value="Confirm Details"  class="btn btn-success" style="width: 120px;" />
						</center>
					</form:form>
					<p style="color: #FF0000">${msg}</p>
					<hr>
				</div>
			</div>
			<!-- /.col-xs-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container --> </section>
	
</body>
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
</html>