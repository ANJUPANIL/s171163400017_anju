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
<title>Admin Home</title>
<style type="text/css">

#t-cards {
    padding-top: 80px;
    padding-bottom: 80px;
    background-color: #345;    
}


.panel.panel-card {
    position: relative;
    height: 241px;
    border: none;
    overflow: hidden;
    
}
.panel.panel-card .panel-heading {
    position: relative;
    z-index: 2;
    height: 120px;
    border-bottom-color: #fff;
    overflow: hidden;
    
    -webkit-transition: height 600ms ease-in-out;
            transition: height 600ms ease-in-out;
}
.panel.panel-card .panel-heading img {
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 1;
    width: 120%;
    
    -webkit-transform: translate3d(-50%,-50%,0);
            transform: translate3d(-50%,-50%,0);
}
.panel.panel-card .panel-heading button {
    position: absolute;
    top: 10px;
    right: 15px;
    z-index: 3;
}
.panel.panel-card .panel-figure {
    position: absolute;
    top: auto;
    left: 50%;
    z-index: 3;
    width: 70px;
    height: 70px;
    background-color: #fff;
    border-radius: 50%;
    opacity: 1;
    -webkit-box-shadow: 0 0 0 3px #fff;
            box-shadow: 0 0 0 3px #fff;
    
    -webkit-transform: translate3d(-50%,-50%,0);
            transform: translate3d(-50%,-50%,0);
    
    -webkit-transition: opacity 400ms ease-in-out;
            transition: opacity 400ms ease-in-out;
}

.panel.panel-card .panel-body {
    padding-top: 40px;
    padding-bottom: 20px;

    -webkit-transition: padding 400ms ease-in-out;
            transition: padding 400ms ease-in-out;
} 

.panel.panel-card .panel-thumbnails {
    padding: 0 15px 20px;
}
.panel-thumbnails .thumbnail {
    width: 50px;
    max-width: 100%;
    margin: 0 auto;
    background-color: #fff;
} 


.panel.panel-card:hover .panel-heading {
    height: 55px;
    
    -webkit-transition: height 400ms ease-in-out;
            transition: height 400ms ease-in-out;
}
.panel.panel-card:hover .panel-figure {
    opacity: 0;
    
    -webkit-transition: opacity 400ms ease-in-out;
            transition: opacity 400ms ease-in-out;
}
.panel.panel-card:hover .panel-body {
    padding-top: 20px;
    
    -webkit-transition: padding 400ms ease-in-out;
            transition: padding 400ms ease-in-out;
}
</style>
</head>
<body>
<header id="topNav" class="topHead">
		<!-- remove class="topHead" if no topHead used! -->
		<div class="container">
			
			<!-- Logo text or image -->
			<a class="logo" href="/"><img 
					src="resources/images/logo.jpg" width="150" height="100" style="margin-left:20px"/>
			</a>
			<div class="pull-right nav hidden-xs">
				<i class="fa fa-angle-left" style="color:#0000CD"><span class="glyphicon glyphicon-user"></span>Welcome Admin</i>&nbsp; &nbsp;
				<a href="logout"><i class="fa fa-angle-left"><span
						class="glyphicon glyphicon-off"></span>Logout</i></a>
		</div>
	</header>
	<nav class="navbar navbar-inverse navbar-fixed">
			<div class="container-fluid">

				<ul class="nav navbar-nav">
					<li class="active"><a href="#">HOME</a></li>
					<li><a href="brand">BRAND</a></li>
					<li><a href="category">CATEGORY</a></li>
					<li><a href="supplier">SUPPLIER</a></li>
					<li><a href="product">PRODUCT</a></li>
				</ul>
			</div>
		</nav>
		<section id="t-cards">
    <div class="container">
        <div class="row">
             <div class="col-sm-6 col-md-3">
                <div class="panel panel-default panel-card">
                    <div class="panel-heading">
                        <img src="http://lmsoftech.com/banner-enuke-e-commerce.png" />
                        
                    </div>
                    <div class="panel-figure">
                        <img class="img-responsive img-circle" src="resources/images/adminicon.jpg" />
                    </div>
                    <div class="panel-body text-center">
                        <h4 class="panel-header"><a href="brand">Brand</a></h4>
                        <small>A short description goes here.</small>
                    </div>
                    <div class="panel-thumbnails">
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <span class="glyphicon glyphicon-plus btn btn-success" ></span>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <span class="glyphicon glyphicon-edit btn btn-primary"></span>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <span class="glyphicon glyphicon-remove btn btn-warning"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>   
    		</div>
		    <div class="col-sm-6 col-md-3">
        	    <div class="panel panel-default panel-card">
                    <div class="panel-heading">
                        <img src="http://smartlinks.ca/wp-content/uploads/2015/08/Digital-Marketing-Niagra.jpg" />
                        
                    </div>
                    <div class="panel-figure">
                        <img class="img-responsive img-circle" src="resources/images/adminicon.jpg" />
                    </div>
                    <div class="panel-body text-center">
                        <h4 class="panel-header"><a href="category">Category</a></h4>
                        <small>A short description goes here.</small>
                    </div>
                    <div class="panel-thumbnails">
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <span class="glyphicon glyphicon-plus btn btn-success" ></span>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <span class="glyphicon glyphicon-edit btn btn-primary"></span>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <span class="glyphicon glyphicon-remove btn btn-warning"></span>
                                </div>
                            </div>
                        </div>
                    </div>
            	</div>   
    		</div>
            <div class="col-sm-6 col-md-3">
                <div class="panel panel-default panel-card">
                    <div class="panel-heading">
                        <img src="http://lmsoftech.com/banner-enuke-e-commerce.png" />
                        
                    </div>
                    <div class="panel-figure">
                        <img class="img-responsive img-circle" src="resources/images/adminicon.jpg" />
                    </div>
                    <div class="panel-body text-center">
                        <h4 class="panel-header"><a href="supplier">Supplier</a></h4>
                        <small>A short description goes here.</small>
                    </div>
                    <div class="panel-thumbnails">
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <span class="glyphicon glyphicon-plus btn btn-success" ></span>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <span class="glyphicon glyphicon-edit btn btn-primary"></span>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <span class="glyphicon glyphicon-remove btn btn-warning"></span>
                                </div>
                            </div>
                           </div>
                    </div>
            	</div>   
    		</div>
            <div class="col-sm-6 col-md-3">
                <div class="panel panel-default panel-card">
                    <div class="panel-heading">
                        <img src="http://smartlinks.ca/wp-content/uploads/2015/08/Digital-Marketing-Niagra.jpg" />
                    </div>
                    <div class="panel-figure">
                        <img class="img-responsive img-circle" src="resources/images/adminicon.jpg" />
                    </div>
                    <div class="panel-body text-center">
                        <h4 class="panel-header"><a href="product">Product</a></h4>
                        <small>A short description goes here.</small>
                    </div>
                    <div class="panel-thumbnails">
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <span class="glyphicon glyphicon-plus btn btn-success" ></span>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <span class="glyphicon glyphicon-edit btn btn-primary"></span>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <span class="glyphicon glyphicon-remove btn btn-warning"></span>
                                </div>
                            </div>
                        </div>
                    </div>
            	</div>   
    		</div>
	    </div>
    </div>
</section>

<br><br>
</body>
</html>