<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
.mag {
	width: 200px;
	margin: 0 auto;
	float: none;
}

.mag img {
	max-width: 100%;
}

.magnify {
	position: relative;
	cursor: none
}

.magnify-large {
	position: absolute;
	display: none;
	width: 175px;
	height: 175px;
	-webkit-box-shadow: 0 0 0 7px rgba(255, 255, 255, 0.85), 0 0 7px 7px
		rgba(0, 0, 0, 0.25), inset 0 0 40px 2px rgba(0, 0, 0, 0.25);
	-moz-box-shadow: 0 0 0 7px rgba(255, 255, 255, 0.85), 0 0 7px 7px
		rgba(0, 0, 0, 0.25), inset 0 0 40px 2px rgba(0, 0, 0, 0.25);
	box-shadow: 0 0 0 7px rgba(255, 255, 255, 0.85), 0 0 7px 7px
		rgba(0, 0, 0, 0.25), inset 0 0 40px 2px rgba(0, 0, 0, 0.25);
	-webkit-border-radius: 100%;
	-moz-border-radius: 100%;
	border-radius: 100%
}
</style>
<script type="text/javascript">
	!function($) {

		"use strict"; // jshint ;_;

		/* MAGNIFY PUBLIC CLASS DEFINITION
		 * =============================== */

		var Magnify = function(element, options) {
			this.init('magnify', element, options)
		}

		Magnify.prototype = {

			constructor : Magnify

			,
			init : function(type, element, options) {
				var event = 'mousemove', eventOut = 'mouseleave';

				this.type = type
				this.$element = $(element)
				this.options = this.getOptions(options)
				this.nativeWidth = 0
				this.nativeHeight = 0

				this.$element.wrap('<div class="magnify" \>');
				this.$element.parent('.magnify').append(
						'<div class="magnify-large" \>');
				this.$element.siblings(".magnify-large").css("background",
						"url('" + this.$element.attr("src") + "') no-repeat");

				this.$element.parent('.magnify').on(event + '.' + this.type,
						$.proxy(this.check, this));
				this.$element.parent('.magnify').on(eventOut + '.' + this.type,
						$.proxy(this.check, this));
			}

			,
			getOptions : function(options) {
				options = $.extend({}, $.fn[this.type].defaults, options,
						this.$element.data())

				if (options.delay && typeof options.delay == 'number') {
					options.delay = {
						show : options.delay,
						hide : options.delay
					}
				}

				return options
			}

			,
			check : function(e) {
				var container = $(e.currentTarget);
				var self = container.children('img');
				var mag = container.children(".magnify-large");

				// Get the native dimensions of the image
				if (!this.nativeWidth && !this.nativeHeight) {
					var image = new Image();
					image.src = self.attr("src");

					this.nativeWidth = image.width;
					this.nativeHeight = image.height;

				} else {

					var magnifyOffset = container.offset();
					var mx = e.pageX - magnifyOffset.left;
					var my = e.pageY - magnifyOffset.top;

					if (mx < container.width() && my < container.height()
							&& mx > 0 && my > 0) {
						mag.fadeIn(100);
					} else {
						mag.fadeOut(100);
					}

					if (mag.is(":visible")) {
						var rx = Math.round(mx / container.width()
								* this.nativeWidth - mag.width() / 2)
								* -1;
						var ry = Math.round(my / container.height()
								* this.nativeHeight - mag.height() / 2)
								* -1;
						var bgp = rx + "px " + ry + "px";

						var px = mx - mag.width() / 2;
						var py = my - mag.height() / 2;

						mag.css({
							left : px,
							top : py,
							backgroundPosition : bgp
						});
					}
				}

			}
		}

		/* MAGNIFY PLUGIN DEFINITION
		 * ========================= */

		$.fn.magnify = function(option) {
			return this
					.each(function() {
						var $this = $(this), data = $this.data('magnify'), options = typeof option == 'object'
								&& option
						if (!data)
							$this.data('tooltip', (data = new Magnify(this,
									options)))
						if (typeof option == 'string')
							data[option]()
					})
		}

		$.fn.magnify.Constructor = Magnify

		$.fn.magnify.defaults = {
			delay : 0
		}

		/* MAGNIFY DATA-API
		 * ================ */

		$(window).on('load', function() {
			$('[data-toggle="magnify"]').each(function() {
				var $mag = $(this);
				$mag.magnify()
			})
		})

	}(window.jQuery);
</script>
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
							<li><a
								href="<c:url value='/productgallery?name=${category}' />">${category}</a>
							</li>
							<li role="separator" class="divider"></li>
						</c:forEach></li>

				</ul></li>
			<c:choose>
				<c:when test="${empty userid or loggedout==true}">

					<li><a href="about">ABOUT</a></li>
				</c:when>
				<c:when test="${not empty userid }">
					<li><a href="profile">PROFILE</a></li>
				</c:when>
			</c:choose>

			<li><a href="blog">BLOG</a></li>
			<li><a href="contactus">CONTACTS</a></li>
		</ul>


	</div>
	</nav>
	<div class="container">
		<div class="row">
			<hr>
			<div class="col-md-4">
				<div class="mag">

					<img data-toggle="magnify" src="${product.product_image}" alt="">
				</div>
			</div>
			<!--/span-->


			<div class="col-md-4">
				<h3 style="color: #0000CD">
					<b>${product.name}</b>
				</h3>
				<p style="color: #7f8496;">
					<b>Category : </b>${product.categoryobj.name}&nbsp;&nbsp; <i
						style="color: red">${product.product_type} </i>
				</p>
				<br>

				<h4>Brand</h4>
				&nbsp;&nbsp;${product.brands.brand_name}

				<h4>Description</h4>
				&nbsp;&nbsp;${product.des}

				<h4>Price</h4>
				&nbsp;&nbsp;${product.price}

				<h4>Discount</h4>
				&nbsp;&nbsp;${product.discount} %


			</div>
			<div class="col-xs-12 col-md-8" align="right">
				<a class="btn btn-primary" href="addcart?id=${product.id}"><span
					class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<c:choose>
					<c:when test="${empty userid or loggedout ==true}">
						<c:choose>
							<c:when test="${not empty name and quick=='gallery'}">
								<a href="productgallery?name=${product.categoryobj.name}"
									class="btn btn-warning" role="button"><span
									class="glyphicon glyphicon-shopping-cart"></span>Continue
									Shopping</a>
							</c:when>
							<c:when test="${not empty type and quick=='type'}">
								<a href="producttype?type=${product.product_type}"
									class="btn btn-warning" role="button"><span
									class="glyphicon glyphicon-shopping-cart"></span>Continue
									Shopping</a>
							</c:when>
						</c:choose>
					</c:when>
					<c:when test="${not empty userid }">
						<a href="shopproduct?name=${product.categoryobj.name}"
							class="btn btn-warning" role="button"><span
							class="glyphicon glyphicon-shopping-cart"></span>Continue
							Shopping</a>
					</c:when>

				</c:choose>
			</div>

		</div>
		<!--/row-->
		<hr>


	</div>

</body>
</html>