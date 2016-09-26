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
<title>Insert title here</title>
<style type="text/css">
#toTop{
	position: fixed;
	bottom: 10px;
	right: 10px;
	cursor: pointer;
	display: none;
	border-radius: 50%;
	}
.panel
{
    margin-bottom: 20px;
    margin-right: 50px;
    margin-left: 50px;
}

</style>
<script type="text/javascript">

    $(document).ready(function(){

        $(".tip-right").tooltip({placement : 'right'});

    });
    
    $(document).ready(function(){
        $('body').append('<div id="toTop" class="btn btn-info"><span class=" glyphicon glyphicon-arrow-up"></span></div>');
      	$(window).scroll(function () {
  			if ($(this).scrollTop() != 0) {
  				$('#toTop').fadeIn();
  			} else {
  				$('#toTop').fadeOut();
  			}
  		}); 
      $('#toTop').click(function(){
          $("html, body").animate({ scrollTop: 0 }, 600);
          return false;
      });
  });

    </script>

</head>
<body>
<header id="topNav" class="topHead">
		<!-- remove class="topHead" if no topHead used! -->
		<div class="container">
			
			<!-- Logo text or image -->
			<a class="logo" href="index.jsp"> <img 
					src="resources/images/logo.jpg" alt="Electech" width="150" height="100" style="margin-left:20px" />
			</a>
			<form class="navbar-form navbar-right" role="search" name="searchproduct" action="searchproduct" method="POST">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search" name="pname">
				</div>
				<button type="submit" class="btn btn-default" value="Search" >
					<span class="glyphicon glyphicon-search"></span>
				</button>&nbsp;
				<a href="login"><button type="submit" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="View your shopping cart">
					<span class="glyphicon glyphicon-shopping-cart"></span>
				</button></a>
			</form>

		</div>
	</header>
	
	<header id="topHead">
		<div class="container">


			<!-- LINKS -->
			
			<div class="pull-right nav hidden-xs">
				<a href="login"><i class="fa fa-angle-left"><span
						class="glyphicon glyphicon-hand-right"></span>Orders</i></a>&nbsp; &nbsp; <a
					href="registration"><i class="fa fa-angle-right"><span
						class="glyphicon glyphicon-user"></span></i> Register</a>&nbsp;&nbsp; <a
					href="login"><i class="fa fa-angle-right"><span
						class="glyphicon glyphicon-log-in"></span></i> Sign In</a>
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
	
<!-- Logo part -->

<!-- nav -->
	<nav class="navbar navbar-inverse navbar-fixed">
			<div class="container-fluid">

				<ul class="nav navbar-nav">
					<li class="active"><a href="index">HOME</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">SHOP <span class="caret"></span></a>
						<ul class="dropdown-menu">
							
							<li><c:forEach  var="category" items="${category}">
								<li><c:choose>
								<c:when test="${empty userid or loggedout==true}">
									<a href="<c:url value='/productgallery?name=${category}' />">${category}</a>
								</c:when>
								<c:when test="${not empty userid }">
									<a href="<c:url value='/shopproduct?name=${category}' />">${category}</a>
								</c:when>
								</c:choose>
								</li>
								<li role="separator" class="divider"></li>
							</c:forEach></li>
							
						</ul></li>


					<li><a href="about">ABOUT</a></li>
					
					<li><a href="contactus">CONTACTS</a></li>
				</ul>
			</div>
		</nav>
		<h3 style="color:#0000CD">&nbsp;&nbsp;ABOUT</h3><br>
		<div class="panel panel-info">
  		<div class="panel-body">
    		<b>About Our Store</b><br><br>
    		<p align="justify">
    		 Comfort is a very important thing nowadays because it is a condition of satisfaction and calmness.
    		 It is clear that our way of life must be as comfortable as possible. Home electronics satisfy our
    		  wishes and make our life more pleasant. We must admit that our way of life depends on quality of 
    		  different goods of popular brands.  You know, we have many devoted customers all over the world, and this fact proves that we sell only quality commodities. 
    		  Recipe of our success is a fair price and premium quality.We understand that it is very complicated to amaze present clients, they are so whimsical, but our products are very flexible and reliable.</p>
  			<center><img src="resources/images/about.png"  ></center><br><br>
  			<p align="justify">
  			Here you can find something more than just home electronics; you can find real comfort and satisfaction here! 
  			Our goods are the combination of perfect design and an ideal functionality. We have a tremendous variety of different models. 
  			Nowadays clients’ claims become so scrupulous that sometimes it is very hard to satisfy them. But we provide only real bestsellers and our
  			products have a great number of options that can really help you.You’ll be amazed with its simplicity and durability.
  			</p><br>
  			<p align="justify">
  			Our manufacturers and vendors provide only new technologies and it is very important because nowadays we see a furious development of electronics 
  			industry. We also provide different economical, social and even technological researches. The main goal of their analysis is to find out the changes 
  			of clients’ demands and other useful data. We are trying to introduce positive results of our explorations.
  			</p><br>
  			
  			<p align="justify">
  			If you want to know more information about our goods, terms, guarantees and other features, you can address our superb 24/7 support system. 
  			Also you can save some money at our store because we always provide different promos and you can get good discount and other benefits.
  			</p><br>
  		
  		</div>
</div>
</body>
</html>