<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js">
</script>

<title>User Home</title>
</head>
<style>
.panel-default{
    text-align:center;
    cursor:pointer;
    font-family: 'Raleway',sans-serif;
}
.panel-default > .panel-footer {
    color: #fff;
    background-color: #47c8ed;    
    display:none;
    text-shadow: 1px 1px 1px rgba(150, 150, 150, 1);
}
.panel-default i{
    font-size: 5em;
    }	
	
</style>
<script type="text/javascript">

$(function(){
	$('.panel').hover(function(){
	        $(this).find('.panel-footer').slideDown(250);
	    },function(){
	        $(this).find('.panel-footer').slideUp(250); //.fadeOut(205)
	    });
	})
</script>
<body>
<header id="topNav" class="topHead">
		<!-- remove class="topHead" if no topHead used! -->
		<div class="container">
			
			<!-- Logo text or image -->
			<a class="logo" href="index.jsp"> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<img 
					src="resources/images/logo.jpg" alt="Electech" width="150" height="100" />
			</a>
			<form class="navbar-form navbar-right" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
					<button type="submit" class="btn btn-default">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				
			</form>
			
		</div>
	</header>
	<header id="topHead">
		<div class="container">


			<!-- LINKS -->
			
			<div class="pull-right nav hidden-xs">
				<i class="fa fa-angle-left" style="color:#0000CD"><span class="glyphicon glyphicon-user">
								</span>Welcome <%= session.getAttribute( "welcomemsg" )%> </i>&nbsp; &nbsp;
				<a href="page-about-us.html"><i class="fa fa-angle-left"><span
						class="glyphicon glyphicon-hand-right"></span>Orders</i></a>&nbsp; &nbsp;
				
				<a href="mycart"><i class="fa fa-angle-left" data-toggle="tooltip" data-placement="right" title="View your shopping cart"><span
						class="glyphicon glyphicon-shopping-cart"></span>Cart</i></a>&nbsp; &nbsp;
				
				<a href="logout"><i class="fa fa-angle-left"><span
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
					<li class="active"><a href="userhome">HOME</a></li>
					<li><a href="#">PROFILE</a></li>
					<li><a href="blog">BLOG</a></li>
					<li><a href="contactus">CONTACTS</a></li>
				</ul>
			</div>
</nav>
<center><h2 style="color:#0000CD">SHOP</h2></center>

<div class="container">
	<div class="row">
		<div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/mobile.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Mobiles</h4>
                </div>
                <div class="panel-footer"><a href="shopproduct?name=Mobiles" style="color:#0000CD">SHOP NOW!</a></div>
            </div>
									       </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/laptop.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Laptops</h4>
                </div>
                <div class="panel-footer"><a href="shopproduct?name=Laptops" style="color:#0000CD">SHOP NOW!</a></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/tablet.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Tablets</h4>
                </div>
                <div class="panel-footer"><a href="shopproduct?name=Tablets" style="color:#0000CD">SHOP NOW!</a></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/desktop.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Desktop</h4>
                </div>
                <div class="panel-footer"><a href="shopproduct?name=Desktop" style="color:#0000CD">SHOP NOW!</a></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/car.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Car Accessories</h4>
                </div>
                <div class="panel-footer"><a href="shopproduct?name=Car Accessories" style="color:#0000CD">SHOP NOW!</a></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/camera.png" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Cameras</h4>
                </div>
                <div class="panel-footer"><a href="shopproduct?name=Cameras" style="color:#0000CD">SHOP NOW!</a></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-body" align="center">                    
                    
                    <img src="resources/images/security.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" />
                    <h4>Security System</h4>
                </div>
                <div class="panel-footer"><a href="shopproduct?name=Security System" style="color:#0000CD" data-target-id="home">SHOP NOW!</a></div>
            </div>
        </div>
	</div>
</div>



		
	
</body>
</html>