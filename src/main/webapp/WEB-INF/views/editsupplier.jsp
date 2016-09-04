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
<form:form method="POST" commandName="edit_supplier"
		action="${pageContext.request.contextPath}/update_supplier">
			<div align="center" class="table-responsive">
			<h2>Edit Supplier&nbsp;&nbsp;&nbsp;</h2>
   							
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
						<form:input path="name" size="40" class="form-control" value="${sdata.name}"/><br /> 
						<form:errors path="name" cssClass="error" />
					</td>
				</tr>
				
				<tr class="form-group">
					<td style="width: 25%">
						<form:label path="address">Address:</form:label>
					</td>
					<td> 
						<form:input cols="40" rows="5" path="address" class="form-control" value="${sdata.address}" /><br /> 
						<form:errors path="address" cssClass="error" />
					</td>
				</tr>
				
			  <tr class="form-group">
							<td><form:label path="city">City:</form:label></td>
							<td><form:input path="city" class="form-control" value="${sdata.city}" /><br /> 
							<form:errors path="city" cssClass="error" /></td>
				</tr>
				
				<tr class="form-group">
							<td><form:label path="state">State:</form:label></td>
							<td><form:input path="state" class="form-control" value="${sdata.state}" /><br /> 
							<form:errors path="state" cssClass="error" /></td>
				</tr>
				
				<tr class="form-group">
							<td><form:label path="pin">Pincode:</form:label></td>
							<td><form:input path="pin" class="form-control" value="${sdata.pin}" /><br /> 
							<form:errors path="pin" cssClass="error" /></td>
				</tr>
				
				<tr class="form-group">
							<td><form:label path="email">Email ID:</form:label></td>
							<td><form:input path="email" class="form-control" value="${sdata.email}" /><br /> 
							<form:errors path="email" cssClass="error" /></td>
				</tr>
				
				<tr class="form-group">
							<td><form:label path="contact">Contact :</form:label></td>
							<td><form:input path="contact" class="form-control" value="${sdata.contact}" /><br /> 
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