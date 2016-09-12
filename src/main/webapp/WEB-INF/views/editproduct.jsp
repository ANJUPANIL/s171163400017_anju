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
<title>Edit product</title>
</head>
<body>
<form:form method="POST" commandName="edit_product"
		action="${pageContext.request.contextPath}/update_product" enctype="multipart/form-data">
			<div align="center" class="table-responsive">
			<h2>Edit product&nbsp;&nbsp;&nbsp;</h2>
   							
   				<table style="width: 45%" align="center" class="table-striped table-condensed">
   					
    				<tr class="form-group" style="font-weight: bold;">
					<td style="width: 25%">
						<form:label path="id">Product ID:</form:label>
					</td>
					<td> 
						 ${pdata.id}<form:input type="hidden" path="id" size="40" class="form-control" value="${pdata.id}" /><br /> 
						<form:errors path="id" cssClass="error" />
					</td>
				</tr>
				
				<tr class="form-group">
					<td style="width: 25%">
						<form:label path="name">Product Name:</form:label>
					</td>
					<td> 
						<form:input path="name" size="40" class="form-control" value="${pdata.name}"/><br /> 
						<form:errors path="name" cssClass="error" />
					</td>
				</tr>
				
				<tr class="form-group">
					<td style="width: 25%">
						<form:label path="des">Description:</form:label>
					</td>
					<td> 
						<form:input cols="40" rows="5" path="des" class="form-control" value="${pdata.des}" /><br /> 
						<form:errors path="des" cssClass="error" />
					</td>
				</tr>
				
			<tr class="form-group">
							<td><form:label path="categoryobj.id">Category:</form:label></td>
							<td>
								<form:select path="categoryobj.id" class="form-control">
                            	<c:forEach items="${category}" var="catlist">
                            	<c:choose>
                                <c:when test="${catlist.id == pdata.categoryobj.id}">
                                    <form:option value="${catlist.id}" selected="${catlist.id}">${catlist.name}</form:option>
                                </c:when>
                                <c:otherwise>
                                    <form:option value="${catlist.id}">${catlist.name}</form:option>
                                </c:otherwise>
                            </c:choose>
                               
                            </c:forEach>
								</form:select> <br/>
							<form:errors path="categoryobj.id" cssClass="error" /></td>
				</tr>
				
				<tr class="form-group">
							<td><form:label path="brands.brand_id">Brand:</form:label></td>
							<td> 
								
								<form:select path="brands.brand_id" class="form-control">
                            	<c:forEach items="${brand}" var="brandlist">
                            	<c:choose>
                                <c:when test="${brandlist.brand_id == pdata.brands.brand_id}">
                                    <form:option value="${brandlist.brand_id}" selected="${brandlist.brand_id}">${brandlist.brand_name}</form:option>
                                </c:when>
                                <c:otherwise>
                                    <form:option value="${brandlist.brand_id}">${brandlist.brand_name}</form:option>
                                </c:otherwise>
                            </c:choose>
                               
                            </c:forEach>
                    </form:select><br/>
								
							<form:errors path="brands.brand_id" cssClass="error" /></td>
				</tr>
				
				<tr class="form-group">
							<td><form:label path="product_type">Type:</form:label></td>
							<td><form:input path="product_type" class="form-control" value="${pdata.product_type}" /><br /> 
							<form:errors path="product_type" cssClass="error" /></td>
							
				</tr>
				
				
				<tr class="form-group">
							<td><form:label path="sup.id">Supplier:</form:label></td>
							<td>
								<form:select path="sup.id" class="form-control">
                            	<c:forEach items="${supplier}" var="suplist">
                            	<c:choose>
                                <c:when test="${suplist.id == pdata.sup.id}">
                                    <form:option value="${suplist.id}" selected="${suplist.id}">${suplist.name}</form:option>
                                </c:when>
                                <c:otherwise>
                                    <form:option value="${suplist.id}">${suplist.name}</form:option>
                                </c:otherwise>
                            </c:choose>
                               
                            </c:forEach>
								</form:select> <br/>
								
							<form:errors path="sup.id" cssClass="error" /></td>
				</tr>
				
				<tr class="form-group">
							<td><form:label path="price">Price:</form:label></td>
							<td><form:input path="price" class="form-control" value="${pdata.price}" /><br /> 
							<form:errors path="price" cssClass="error" /></td>
				</tr>
				
				<tr class="form-group">
							<td><form:label path="discount">Discount:</form:label></td>
							<td><form:input path="discount" class="form-control" value="${pdata.discount}" /><br /> 
							<form:errors path="discount" cssClass="error" /></td>
				</tr>
				
				<tr class="form-group">
							<td><form:label path="product_image">Image:</form:label></td>
           					<td><input type="file" name="prdfile" /></td>
           					<td><img src="${pdata.getProduct_image()}" height="150px" width="150px"></td>
           					           					
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