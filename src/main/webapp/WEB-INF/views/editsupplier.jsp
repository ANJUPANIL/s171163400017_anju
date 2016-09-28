<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>Edit Supplier</title>
</head>
<body>
<header id="topNav" class="topHead">
		<!-- remove class="topHead" if no topHead used! -->
		<div class="container">
			
			<!-- Logo text or image -->
			<a class="logo" href="/"><img 
					src="resources/images/logo.jpg" width="150" height="100" style="margin-left:20px" />
			</a>
			<div class="pull-right nav hidden-xs">
				<i class="fa fa-angle-left" style="color:#0000CD">
						<span class="glyphicon glyphicon-user"></span>Welcome Admin</i>&nbsp; &nbsp;
				<a href="logout"><i class="fa fa-angle-left"><span
						class="glyphicon glyphicon-off"></span>Logout</i></a>
		</div>
	</header>
	<nav class="navbar navbar-inverse navbar-fixed">
			<div class="container-fluid">

				<ul class="nav navbar-nav">
					<li><a href="adminhome">HOME</a></li>
					<li><a href="brand">BRAND</a></li>
					<li ><a href="category">CATEGORY</a></li>
					<li class="active"><a href="supplier">SUPPLIER</a></li>
					<li><a href="product">PRODUCT</a></li>
				</ul>
			</div>
	</nav>
	
<form:form method="POST" commandName="edit_supplier"
		action="${pageContext.request.contextPath}/update_supplier">
			<div align="center" class="table-responsive">
			<h2>Edit Supplier Details</h2>
   						<br>	
   				<table style="width: 40%" class="table-striped table-condensed">
   					
    				<tr class="form-group" style="font-weight: bold;">
					<td style="width: 25%">
						<form:label path="id">Supplier ID:</form:label>
					</td>
					<td> 
						${sdata.id}<form:input type="hidden" path="id" size="40" class="form-control" value="${sdata.id}" /><br /> 
						<form:errors path="id" cssClass="error" />
					</td>
				</tr>
				
				<tr class="form-group">
					<td style="width: 25%">
						<form:label path="name">Supplier Name:</form:label>
					</td>
					<td> 
						<form:input path="name" size="40" class="form-control" value="${sdata.name}" required="true"/><br /> 
						<form:errors path="name" cssClass="error" />
					</td>
				</tr>
				
				<tr class="form-group">
					<td style="width: 25%">
						<form:label path="address">Address:</form:label>
					</td>
					<td> 
						<form:input cols="40" rows="5" path="address" class="form-control" value="${sdata.address}" required="true" /><br /> 
						<form:errors path="address" cssClass="error" />
					</td>
				</tr>
				
			  <tr class="form-group">
							<td><form:label path="city">City:</form:label></td>
							<td><form:input path="city" class="form-control" value="${sdata.city}" required="true" /><br /> 
							<form:errors path="city" cssClass="error" /></td>
				</tr>
				
				<tr class="form-group">
							<td><form:label path="state">State:</form:label></td>
							<td><form:input path="state" class="form-control" value="${sdata.state}" required="true" /><br /> 
							<form:errors path="state" cssClass="error" /></td>
				</tr>
				
				<tr class="form-group">
							<td><form:label path="pin">Pincode:</form:label></td>
							<td><form:input path="pin" class="form-control" value="${sdata.pin}" required="true" /><br /> 
							<form:errors path="pin" cssClass="error" /></td>
				</tr>
				
				<tr class="form-group">
							<td><form:label path="email">Email ID:</form:label></td>
							<td><form:input path="email" class="form-control" value="${sdata.email}" required="true" /><br /> 
							<form:errors path="email" cssClass="error" /></td>
				</tr>
				
				<tr class="form-group">
							<td><form:label path="contact">Contact :</form:label></td>
							<td><form:input path="contact" class="form-control" value="${sdata.contact}" required="true" /><br /> 
							<form:errors path="contact" cssClass="error" /></td>
				</tr>
				
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td colspan="2">
						<button type="submit" class="btn btn-success"
							style="width: 150px;">Submit</button>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="error">${error}</td>
				</tr>
				
			</table>
		</div>
	</form:form>
</body>
</html>