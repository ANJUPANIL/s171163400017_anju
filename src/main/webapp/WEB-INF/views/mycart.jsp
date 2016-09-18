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
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<title>Cart</title>
</head>
<body>
<header id="topNav" class="topHead"> <!-- remove class="topHead" if no topHead used! -->
	<div class="container">

		<!-- Logo text or image -->
		<a class="logo" href="index.jsp"> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
			&nbsp;<img src="resources/images/logo.jpg" alt="Electech" width="150"
			height="100" />
		</a>
		<form class="navbar-form navbar-right" role="search"
			name="searchproduct" action="searchproduct" method="POST">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search"
					name="pname">
			</div>
			<button type="submit" class="btn btn-default" value="Search">
				<span class="glyphicon glyphicon-search"></span>
			</button>
		</form>

	</div>
	</header>
	<header id="topHead">
	<div class="container">


		<!-- LINKS -->

		<div class="pull-right nav hidden-xs">
			<i class="fa fa-angle-left" style="color: #0000CD"><span
				class="glyphicon glyphicon-user"> </span>Welcome <%=session.getAttribute("welcomemsg")%>
			</i>&nbsp; &nbsp; <a href="page-about-us.html"><i
				class="fa fa-angle-left"><span
					class="glyphicon glyphicon-hand-right"></span>Orders</i></a>&nbsp; &nbsp; <a
				href="mycart"><i class="fa fa-angle-left" data-toggle="tooltip"
				data-placement="right" title="View your shopping cart"><span
					class="glyphicon glyphicon-shopping-cart"></span>Cart(${cartsize})</i></a>&nbsp;
			&nbsp; <a href="logout"><i class="fa fa-angle-left"><span
					class="glyphicon glyphicon-off"></span>Logout</i></a>


		</div>
		<!-- PHONE/EMAIL -->
		<span class="quick-contact pull-left"> <i class="fa fa-phone"></i><span
			class="glyphicon glyphicon-earphone"></span> 1800-555-1234 &bull; <a
			class="hidden-xs" href="mailto:mail@yourdomain.com">mail@domain.com</a>
		</span>
		<!-- /LINKS -->

		<div>
			<hr width=100% align=left>
		</div>

		<!-- TOP NAV -->

	</div>
	</header>
	<nav class="navbar navbar-inverse navbar-fixed">
	<div class="container-fluid">

		<ul class="nav navbar-nav">
			<li class="active"><a href="index">HOME</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">SHOP <span class="caret"></span></a>
				<ul class="dropdown-menu">

					<li><c:forEach var="category" items="${category}">
							<li><a
								href="<c:url value='/shopproduct?name=${category}' />">${category}</a>
							</li>
							<li role="separator" class="divider"></li>
						</c:forEach></li>

				</ul></li>
			<li><a href="userprofile">PROFILE</a></li>
			<li><a href="blog">BLOG</a></li>
			<li><a href="contactus">CONTACTS</a></li>
		</ul>
	</div>
	</nav>

<h3 style="color:#0000CD">CART</h3>		
<div class="container">

	<c:choose>
	<c:when test="${empty emptymsg==true}">
	<form:form method="POST" commandName="cart"
		action="${pageContext.request.contextPath}/updatecart">
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
                       
                        
                        <form:input path="quantity" type="text" class="form-control" id="quantity" name="quantity" value="${cartlist.quantity}" style="text-align: right" />
                        
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
                       		 <a href="updatecart?id=${cartlist.id}&pid=${cartlist.product.id}" type="submit" class="btn btn-primary" role="button"> Update Cart</a>
                            
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
                        <td class="text-right"><h5><strong>&#8377;50</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        
                        <% double t=(double)session.getAttribute("grandtotal") ;
                        	double gt=t+50;
                        
                        %>

                        <td class="text-right"><h3><strong><%=gt %></strong></h3></td>
                        
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
    </form:form>
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