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
<title>Cart</title>
</head>
<body>
<header id="topNav" class="topHead">
		<!-- remove class="topHead" if no topHead used! -->
		<div class="container">
			
			<!-- Logo text or image -->
			<a class="logo" href="index.jsp"> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<img 
					src="resources/images/logo.jpg" alt="Electech" width="150" height="100" />
			</a>
			<h3 style="color:#0000CD">CART</h3>
		</div>
	</header>
		
<div class="container">
	<c:choose>
	<c:when test="${empty emptymsg==true}">
    	<div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Quantity </th>
                        <th class="text-center">Discount</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody id="tbody">
                <c:forEach items="${cartlist}" var="cartlist">
                    <tr>
                        <td class="col-sm-1 col-md-1" style="text-align: left">
                        ${cartlist.product.name}
                        </td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
						${cartlist.product.price }
                        </td>                       
                        <td class="col-sm-1 col-md-1">
                        
                        <input type="text" class="form-control" id="quantity" name="quantity" value="${cartlist.quantity}" style="text-align: right" >
                        
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${cartlist.product.discount}%</strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${cartlist.total}</strong></td>
                        <td class="col-sm-1 col-md-1">
                         <a href="<c:url value='/delcart?id=${cartlist.id}' />" class="btn btn-danger" role="button" ><span class="glyphicon glyphicon-remove"></span> </a>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5> </h5></td>
                         <td class="col-sm-1 col-md-1">
                       		 <a href="updatecart?id=${cartlist.id}&pid=${cartlist.product.id}&quantity=${cartlist.quantity}" type="submit" class="btn btn-primary" role="button"> Update Cart</a>
                            
                        </td>
                    </tr>
                    </c:forEach>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Subtotal</h5></td>
                        <td class="text-right"><h5><strong>${grandtotal}</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Estimated shipping</h5></td>
                        <td class="text-right"><h5><strong>$6.94</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong>${grandtotal}</strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a href="userhome"  class="btn btn-warning" role="button"><span class="glyphicon glyphicon-shopping-cart"></span>Continue Shopping</a>
                        </td>
                        <td>
                        <a href="#"  class="btn btn-success" role="button">Check out<span class="glyphicon glyphicon-play"></span></a>
                       </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    </c:when>
					<c:otherwise>
						<hr>
						<div class="alert alert-info">
							
							<strong>Info!</strong> ${emptymsg}
							
						</div>
						<div align="right">
						<a href="userhome"  class="btn btn-warning" role="button" ><span class="glyphicon glyphicon-shopping-cart"></span>Continue Shopping</a>
						</div><hr>
					</c:otherwise>
				</c:choose>
</div>

</body>
</html>