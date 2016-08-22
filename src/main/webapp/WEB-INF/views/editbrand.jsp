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
<form:form method="POST" commandName="edit_brand"
		action="${pageContext.request.contextPath}/update_brand">
			<div align="center" class="table-responsive">
			<h2>Edit Brand&nbsp;&nbsp;&nbsp;</h2>
   							
   				<table style="width: 40%">
   					
   					<div class="form-group">
    				<tr>
					<td style="width: 25%">
						<form:label path="id">Brand ID:</form:label>
					</td>
					<td> 
						<form:input path="id" size="40" class="form-control" value="${bdata.id}"/><br /> 
						<form:errors path="id" cssClass="error" />
					</td>
				</tr>
				</div>
				<div class="form-group">
				<tr>
					<td style="width: 25%">
						<form:label path="name">Brand Name:</form:label>
					</td>
					<td> 
						<form:input path="name" size="40" class="form-control" value="${bdata.name}"/><br /> 
						<form:errors path="name" cssClass="error" />
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