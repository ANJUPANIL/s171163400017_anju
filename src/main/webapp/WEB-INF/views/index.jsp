<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html lang="en">
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
	<link type="text/css" rel="stylesheet" href="src/main/webapp/WEB-INF/resources/css/mycss.css" />
	<script type="text/javascript" href="src/main/webapp/WEB-INF/resources/js/myjs.js"></script>

<title>Shopping Cart</title>

</head>
<style>
  #toTop{
	position: fixed;
	bottom: 10px;
	right: 10px;
	cursor: pointer;
	display: none;
	border-radius: 50%;
}
 .navbar { margin-bottom:0px !important; }
.carousel-caption { margin-top:0px !important }
 .panel
{
    margin-bottom: 20px;
    margin-right: 10px;
    margin-left: 10px;
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
				<input type="text" class="form-control" placeholder="Search" data-toggle="tooltip" data-placement="right" title="Search your required products"
					name="pname">
			</div>
			<button type="submit" class="btn btn-default" value="Search">
				<span class="glyphicon glyphicon-search"></span>
			</button>
			&nbsp;
			<c:choose>
				<c:when test="${empty userid or loggedout==true}">
					<a href="login"><button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-shopping-cart"></span>
						</button></a>
				</c:when>
			</c:choose>
		</form>

	</div>
	</header>

	<header id="topHead">
	<div class="container">


		<!-- LINKS -->
		<c:choose>
			<c:when test="${empty userid or loggedout==true}">
				<div class="pull-right nav hidden-xs">
					<a href="page-about-us.html"><i class="fa fa-angle-left"><span
							class="glyphicon glyphicon-hand-right"></span>Orders</i></a>&nbsp; &nbsp;
					<a href="registration"><i class="fa fa-angle-right"><span
							class="glyphicon glyphicon-user"></span></i> Register</a>&nbsp;&nbsp; <a
						href="login"><i class="fa fa-angle-right"><span
							class="glyphicon glyphicon-log-in"></span></i> Sign In</a>
				</div>
			</c:when>
			<c:when test="${not empty userid }">
				<div class="pull-right nav hidden-xs">
					<i class="fa fa-angle-left" style="color: #0000CD"><span
						class="glyphicon glyphicon-user"> </span>Welcome <%=session.getAttribute("welcomemsg")%>
					</i>&nbsp; &nbsp; <a href="page-about-us.html"><i
						class="fa fa-angle-left"><span
							class="glyphicon glyphicon-hand-right"></span>Orders</i></a>&nbsp; &nbsp;

					<a href="mycart"><i class="fa fa-angle-left"
						data-toggle="tooltip" data-placement="right"
						title="View your shopping cart"><span
							class="glyphicon glyphicon-shopping-cart"></span>Cart(${cartsize})</i></a>&nbsp;
					&nbsp; <a href="logout"><i class="fa fa-angle-left"><span
							class="glyphicon glyphicon-off"></span>Logout</i></a>


				</div>
			</c:when>
		</c:choose>

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

					<li><c:forEach var="category" items="${category}">
							<li><c:choose>
								<c:when test="${empty userid or loggedout==true}">
									<a href="<c:url value='/productgallery?name=${category}' />">${category}</a>
								</c:when>
								<c:when test="${not empty userid }">
									<a href="<c:url value='/shopproduct?name=${category}' />">${category}</a>
								</c:when>
							</c:choose></li>
							<li role="separator" class="divider"></li>
						</c:forEach></li>

				</ul></li>
			<c:choose>
				<c:when test="${empty userid or loggedout==true}">

					<li><a href="about">ABOUT</a></li>
				</c:when>
				<c:when test="${not empty userid }">
					<li><a href="userprofile">PROFILE</a></li>
				</c:when>
			</c:choose>

			<li><a href="blog">BLOG</a></li>
			<li><a href="contactus">CONTACTS</a></li>
		</ul>


	</div>
	</nav>
		
<!-- slider part -->
	
	<div id="carousel-example" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
			<li data-target="#carousel-example" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example" data-slide-to="1"></li>
			<li data-target="#carousel-example" data-slide-to="2"></li>
		</ol>

		<div class="carousel-inner">
			<div class="item active">
				<img
					src="resources/images/banner02.jpg"
						width="1600" height="600">
				<div class="carousel-caption">
					<button type="button" class="btn btn-primary">SHOP NOW!</button>
					<p>
						<font face="Monotype Corsiva" size="4px">Enjoy the fabulous
							experience while shopping......!</font>
					</p>
				</div>
			</div>
			<div class="item">
				<img
					src="resources/images/banner2.jpg" width="1600" height="600">
				<div class="carousel-caption">
					<h2>
						<font color="black">iPhone 6s</font>
					</h2>
					<button type="button" class="btn btn-primary">SHOP NOW!</button>
					<p>
						<font face="Monotype Corsiva" size="4px">Enjoy the fabulous
							experience while shopping......!</font>
					</p>
				</div>
			</div>
			
			<div class="item">
				<img src="resources/images/banner4.jpg"
					width="1600" height="600">
				<div class="carousel-caption">
					<button type="button" class="btn btn-primary">SHOP NOW!</button>
					<p>
						<font face="Monotype Corsiva" size="4px">Enjoy the fabulous
							experience while shopping......!</font>
					</p>
				</div>
			</div>
			<div class="item">
				<img src="resources/images/banner5.jpg"
					width="1600" height="600">
				<div class="carousel-caption">
					<button type="button" class="btn btn-primary">SHOP NOW!</button>
					<p>
						<font face="Monotype Corsiva" size="4px">Enjoy the fabulous
							experience while shopping......!</font>
					</p>
				</div>
			</div>
			<div class="item">
				<img
					src="resources/images/banner-01.jpg"
					width="1600" height="600">
				<div class="carousel-caption">
					<button type="button" class="btn btn-primary">SHOP NOW!</button>
					<p>
						<font face="Monotype Corsiva" size="4px">Enjoy the fabulous
							experience while shopping......!</font>
					</p>
				</div>
			</div>
		</div>

		<a class="left carousel-control" href="#carousel-example"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span>
		</a> <a class="right carousel-control" href="#carousel-example"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
	<br>
	<br>
	
<!-- Panel 1 -->

<div class="row">
  <div class="col-md-4">
  <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><center><font color="blue"><a href="<c:url value='/producttype?type=New' />" >NEW ARRIVALS</a></font></center></h3>
  </div>
  <div class="panel-body"><div class="col-md-6">
    <img src="resources/images/newproduct1.jpg" width="150" height="125"></div>
   <div class="col-md-4"> <h5><font color="blue">Desktop</font></h5>
    <p>Twisted Veins Three 3 Pack of 3-ft High Speed</p></div>
    <div><hr width=100% align=left></div>
  <br><div class="col-md-6"><img src="resources/images/newproduct2.jpg" width="150" height="125"></div>
  <div class="col-md-4"> <h5><font color="blue">Cameras</font></h5>
    <p>TaoTronics Car HD Dashboard Camera </p></div>
  </div>
</div></div>

  <div class="col-md-4"><div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><center><font color="blue"><a href="<c:url value='/producttype?type=On Sale' />">ON SALE</a></font></center></h3>
  </div>
  <div class="panel-body"><div class="col-md-6">
    <img src="resources/images/onsale1.JPG" width="150" height="125"></div>
   <div class="col-md-4"> <h5><font color="blue">Car accessories</font></h5>
    <p>BOSS Audio BV9986BI In Dash</p></div>
    <div><hr width=100% align=left></div>
  <br><div class="col-md-6"><img src="resources/images/onsale2.jpg" width="150" height="125"></div>
  <div class="col-md-4"> <h5><font color="blue">Desktop</font></h5>
    <p>Logitech Wireless Illuminated Keyboard</p></div>
    
  </div>
</div></div>
  <div class="col-md-4"><div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><center><font color="blue"><a href="<c:url value='/producttype?type=Top Rated' />">TOP RATED PRODUCTS</a></font></center></h3>
  </div>
  <div class="panel-body"><div class="col-md-6">
    <img src="resources/images/toprated1.png" width="150" height="125"></div>
   <div class="col-md-4"> <h5><font color="blue">Laptop</font></h5>
    <p>MacBook Air</p></div>
    <div><hr width=100% align=left></div>
  <br><div class="col-md-6"><img src="resources/images/toprated2.jpg" width="150" height="125"></div>
  <div class="col-md-4"> <h5><font color="blue">Tablet</font></h5>
    <p>iPad Air </p></div>
    
  </div>
</div></div></div><br>

<!-- Vertical slider -->

<div class="container">
	<div class="row well"> <div class="col-xs-8 col-sm-6 col-md-12">
		<h3><center><font color="blue"><a href="userhome">Browse Our Categories</a></font></center></h3><br>
              
<!-- vertical 1 -->
 
<div class="row">
<div class="col-md-6">
              <div id="myCarousel" class="vertical-slider carousel vertical slide col-md-6" data-ride="carousel">

             <!--   <div class="col-md-4">
                    <span data-slide="next" class="btn-vertical-slider glyphicon glyphicon-circle-arrow-up "
                        style="font-size: 30px"></span>  
                </div>
                <div class="col-md-8"> 
                </div>
            </div>
            <br />-->
            <!-- Carousel items -->
            
            <div class="carousel-inner">
                <div class="item active">
                    <div class="row">
                        <div class="col-xs-6 col-sm-5 col-md-6">
                            <a href="http://dotstrap.com/"> <img src="resources/images/mobile.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" /></a>
                        </div>
                        <div class="col-xs-6 col-sm-5 col-md-6">
                         <p style="text-indent: 3em;">  Mobiles</p>
                        </div>
                    </div>
                    <!--/row-fluid-->
                </div>
                <!--/item-->
                <div class="item ">
                    <div class="row">
                        <div class="col-xs-6 col-sm-5 col-md-6">
                            <a href="http://dotstrap.com/"> <img src="resources/images/laptop.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" /></a>
                        </div>
                        <div class="col-xs-6 col-sm-5 col-md-6">
                           <p style="text-indent: 3em;"> Laptops</p>
                        </div>
                    </div>
                    <!--/row-fluid-->
                </div>
                <!--/item-->
                <div class="item ">
                    <div class="row">
                      <div class="col-xs-6 col-sm-5 col-md-6">
                            <a href="http://dotstrap.com/"> <img src="resources/images/tablet.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" /></a>
                        </div>
                        <div class="col-xs-6 col-sm-5 col-md-6">
                            <p style="text-indent: 3em;"> Tablets</p>
                        </div>
                    </div>
                    <!--/row-fluid-->
                </div>
                <!--/item-->
                <div class="item ">
                    <div class="row">
                      <div class="col-xs-6 col-sm-5 col-md-6">
                            <a href="http://dotstrap.com/"> <img src="resources/images/desktop.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" /></a>
                        </div>
                        <div class="col-xs-6 col-sm-5 col-md-6">
                            <p style="text-indent: 3em;"> Desktops</p>
                        </div>
                    </div>
                    <!--/row-fluid-->
                </div>
                <!--/item-->
            </div>
            
<!-- 
            <div class="row">
                <div class="col-md-4">
                    <span data-slide="prev" class="btn-vertical-slider glyphicon glyphicon-circle-arrow-down"
                        style="color: Black; font-size: 30px"></span>
                </div>
                <div class="col-md-6">
                </div>
            </div>
             -->
             </div>
             </div>
<div class="col-md-6">
              <div id="myCarousel" class="vertical-slider carousel vertical slide col-md-12" data-ride="carousel">

             <!--   <div class="col-md-4">
                    <span data-slide="next" class="btn-vertical-slider glyphicon glyphicon-circle-arrow-up "
                        style="font-size: 30px"></span>  
                </div>
                <div class="col-md-8"> 
                </div>
            </div>
            <br />-->
            <!-- Carousel items -->
            
            <div class="carousel-inner">
                <div class="item active">
                    <div class="row">
                        <div class="col-xs-6 col-sm-5 col-md-6">
                            <a href="http://dotstrap.com/"> <img src="resources/images/car.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" /></a>
                        </div>
                        <div class="col-xs-6 col-sm-5 col-md-6">
                            Car Accessories
                        </div>
                    </div>
                    <!--/row-fluid-->
                </div>
                <!--/item-->
                <div class="item ">
                    <div class="row">
                        <div class="col-xs-6 col-sm-5 col-md-6">
                            <a href="http://dotstrap.com/"> <img src="resources/images/security.jpg" width="150" height="150" class="thumbnail"
                                alt="Image" /></a>
                        </div>
                        <div class="col-xs-6 col-sm-5 col-md-6">
                            Security Systems
                        </div>
                    </div>
                    <!--/row-fluid-->
                </div>
                <!--/item-->
                <div class="item ">
                    <div class="row">
                      <div class="col-xs-6 col-sm-5 col-md-6">
                            <a href="http://dotstrap.com/"> <img src="resources/images/camera.png" width="150" height="150" class="thumbnail"
                                alt="Image" /></a>
                        </div>
                        <div class="col-xs-6 col-sm-5 col-md-6">
                            Cameras
                        </div>
                    </div>
                    <!--/row-fluid-->
                </div>
                <!--/item-->
            </div>
            
<!-- 
            <div class="row">
                <div class="col-md-4">
                    <span data-slide="prev" class="btn-vertical-slider glyphicon glyphicon-circle-arrow-down"
                        style="color: Black; font-size: 30px"></span>
                </div>
                <div class="col-md-8">
                </div>
            </div>
             -->
             </div>
             
 </div>
 
 
 
             
        </div>
</div>
	</div>
</div>



</body>

<footer role="contentinfo" class="site-footer" id="colophon" style=background:#b1b0b0;padding:20px 0;color:#a8a8a8;>
  <div class="container">
    <div class="row">
     <!--   <div id="accordion" class="collapse-footer">-->
        <div class="panel">
          <div class="panel-heading">
            <h4 class="panel-title">Main Navigation </h4>
          </div>
         <!--  <div class="panel-collapse collapse" id="collapseOne" style="height: 0px;">--> 
            <div class="panel-body">
              <div class="row">
                <div class="col-lg-6">
                  
                  <div class="menu-main-menu-container">
                    <ul class="nav nav-footer" id="menu-main-menu-1">
                      <li class="active"><a href="index">Home</a></li>
                      
                      <li><a href="about">About</a></li>
                      <li><a href="blog">Blog</a></li>
                      
                      <li><a href="contactus">Contacts</a></li>
                    </ul>
                  </div>
                </div>
                
                <div class="col-lg-3  col-sm-6">
                  <h4 class="title"><span>Get the latest news delivered daily!</span></h4>
                  <p>Give us your email and you will be daily updated with the latest events, in detail!</p>
                  <div class="clear"> </div>
                  <div class="form-group">
                    <input type="email" name="email" id="email" class="form-control input-md" placeholder="Email Address" required="true">
				</div>
                  <a class="btn btn-primary btn-sm" href="#">Subcribe</a> </div>
                  
              </div>
            </div>
          </div>
        </div>
      </div>
   
  
  <!-- Copyright -->
  <div class="copyright">
    <div class="container">
      <div class="row copyright-img">
        <div class="col-lg-4 col-sm-4"> Total Control True Independence </div>
        <div class="col-lg-8 col-sm-8 text-right" id="footertext"> Copyright © 2016 ElecTech </div>
      </div>
    </div>
  </div>
  <!-- /Copyright -->
</html>
