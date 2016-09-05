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
                    <tr>
                        <td class="col-sm-1 col-md-1" style="text-align: left">
                        product name
                        </td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
						price
                        </td>                       
                        <td class="col-sm-1 col-md-1" style="text-align: left">
                        <input type="email" class="form-control" id="exampleInputEmail1" value="">
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>$14.61</strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>$14.61</strong></td>
                        <td class="col-sm-1 col-md-1">
                         <a href="#"  class="btn btn-danger" role="button" ><span class="glyphicon glyphicon-remove"></span> Remove</a>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5> </h5></td>
                         <td class="col-sm-1 col-md-1">
                       		 <a href="#"  class="btn btn-primary" role="button"><span class="glyphicon glyphicon-pencil"></span> Update Cart</a>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Subtotal</h5></td>
                        <td class="text-right"><h5><strong>$24.59</strong></h5></td>
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
                        <td class="text-right"><h3><strong>$31.53</strong></h3></td>
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
</div>
</body>
</html>