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
<title>Edit Category</title>
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
					<li class="active"><a href="category">CATEGORY</a></li>
					<li><a href="supplier">SUPPLIER</a></li>
					<li><a href="product">PRODUCT</a></li>
				</ul>
			</div>
	</nav>
	
<form:form method="POST" commandName="edit_category"
		action="${pageContext.request.contextPath}/update_category">
			<div align="center" class="table-responsive">
			<h2>Edit Category Details</h2>
   				<br>			
   				<table style="width: 40%" class="table-striped table-condensed">
   					
    				<tr class="form-group" style="font-weight: bold;">
					<td style="width: 25%">
						<form:label path="id">Category ID:</form:label>
					</td>
					<td> 
						 ${cdata.id}<form:input type="hidden" path="id" size="40" class="form-control" value="${cdata.id}" /><br /> 
						<form:errors path="id" cssClass="error" />
					</td>
				</tr>
				
				<tr class="form-group">
					<td style="width: 25%">
						<form:label path="name">Category Name:</form:label>
					</td>
					<td> 
						<form:input path="name" size="40" class="form-control" value="${cdata.name}"/><br /> 
						<form:errors path="name" cssClass="error" />
					</td>
				</tr>
				<tr class="form-group">
				<td><form:label path="brands.brand_id">Brand</form:label></td>
				<td>
					<form:select path="brands.brand_id" class="form-control">
                            <c:forEach items="${brand}" var="brandlist">
                            <c:choose>
                                <c:when test="${brandlist.brand_id == cdata.brands.brand_id}">
                                    <form:option value="${brandlist.brand_id}" selected="${brandlist.brand_id}">${brandlist.brand_name}</form:option>
                                </c:when>
                                <c:otherwise>
                                    <form:option value="${brandlist.brand_id}">${brandlist.brand_name}</form:option>
                                </c:otherwise>
                            </c:choose>
                               
                            </c:forEach>
                    </form:select>
                        			
					<br /> 
						<form:errors path="brands.brand_id" cssClass="error" />
				</td>
			</tr>	
				<tr class="form-group">
					<td style="width: 25%">
						<form:label path="des">Description:</form:label>
					</td>
					<td> 
						<form:input path="des" size="40" class="form-control" value="${cdata.des}"/><br /> 
						<form:errors path="des" cssClass="error" />
					</td>
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