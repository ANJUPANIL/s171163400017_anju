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
<title>Edit Product</title>
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
					<li class="active"><a href="brand">BRAND</a></li>
					<li><a href="category">CATEGORY</a></li>
					<li><a href="supplier">SUPPLIER</a></li>
					<li><a href="product">PRODUCT</a></li>
				</ul>
			</div>
	</nav>
	
<form:form method="POST" commandName="edit_brand"
		action="${pageContext.request.contextPath}/update_brand">
			<div align="center" class="table-responsive">
			<h2>Edit Brand Details</h2>
   					<br>		
   				<table style="width: 40%" class="table-striped table-condensed">
   					
   					<div class="form-group">
    				<tr style="font-weight: bold;">
					<td style="width: 25%">
						<form:label path="brand_id" >Brand ID:</form:label>
					</td>
					<td> 
						 ${bdata.brand_id}<form:input type="hidden" path="brand_id" size="40" class="form-control" value="${bdata.brand_id}" /><br />  
						<form:errors path="brand_id" cssClass="error" />
					</td>
				</tr>
				</div>
				
				<div class="form-group">
				<tr>
					<td style="width: 25%">
					
						<form:label path="brand_name">Brand Name:</form:label>
					</td>
					<td> 
						<form:input path="brand_name" size="40" class="form-control" value="${bdata.brand_name}" required="true"/><br /> 
						<form:errors path="brand_name" cssClass="error" />
					</td>
				</tr>
				</div>
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