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
<title>Profile</title>
<script type="text/javascript">
$(document).ready(function(){

    $(".tip-right").tooltip({placement : 'right'});

});

</script>

</head>
<body>
<header id="topNav" class="topHead">
		<!-- remove class="topHead" if no topHead used! -->
		<div class="container">
			
			<!-- Logo text or image -->
			<a class="logo" href="index.jsp"> <img 
					src="resources/images/logo.jpg" alt="Electech" width="150" height="100" style="margin-left:20px"/>
			</a>
			<form class="navbar-form navbar-right" role="search" name="searchproduct" action="searchproduct" method="POST">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search" name="pname" required="true">
				</div>
				<button type="submit" class="btn btn-default" value="Search" >
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
				<a href="vieworders"><i class="fa fa-angle-left"><span
						class="glyphicon glyphicon-hand-right"></span>Orders</i></a>&nbsp; &nbsp;
				
				<a href="mycart"><i class="fa fa-angle-left" data-toggle="tooltip" data-placement="right" title="View your shopping cart"><span
						class="glyphicon glyphicon-shopping-cart"></span>Cart(${cartsize})</i></a>&nbsp; &nbsp;
				
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
					<li class="active"><a href="index">HOME</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">SHOP <span class="caret"></span></a>
						<ul class="dropdown-menu">
							
							<li><c:forEach  var="category" items="${category}">
								<li><a href="<c:url value='/shopproduct?name=${category}' />">${category}</a>
								</li>
								<li role="separator" class="divider"></li>
							</c:forEach></li>
							
						</ul></li>
					<li><a href="userprofile">PROFILE</a></li>
					
					<li><a href="contactus">CONTACTS</a></li>
				</ul>
			</div>
</nav>
<div class="container">
      <div class="row">
      <div class="col-md-5 toppad  pull-right col-md-offset-3 ">
           <a href="userprofileedit?click=profile" >Edit Profile</a>
       <br>
		<p class=" text-info"><%= new java.util.Date() %> </p>
      </div>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">${userdetails.fname} ${userdetails.sname} ${userdetails.lname}</h3>
            </div>
            <div class="panel-body">
              <div class="row">
               <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="resources/images/profile.jpg" class="img-circle img-responsive"> </div> 
                <div class=" col-md-12 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <tr>
                        <td >Email ID</td>
                        <td style="color:#7f8496;">${userdetails.user_id}</td>
                      </tr>
                      
                      <tr>
                        <td>Date of Birth</td>
                        <td style="color:#7f8496;">${userdetails.dob}</td>
                      </tr>
                      <tr>
                   		<td>Address</td>
                        <td style="color:#7f8496;">${userdetails.address}</td>
                       </tr>
                       <tr>
                   		<td>City</td>
                        <td style="color:#7f8496;">${userdetails.city}</td>
                       </tr>
                         
                      <tr>
                        <td>Contact Number</td>
                        <td style="color:#7f8496;">${userdetails.contact}</td>
                      </tr>
                        
                     
                    </tbody>
                  </table>
                  
                  
                </div>
              </div>
            </div>
                 <div class="panel-footer" height="100px">
                       <!-- <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>--> 
                       <a href="userprofileedit?click=password" class="btn btn-primary">Change Password</a>
                 
                        <span class="pull-right">
                            <a href="userprofileedit?click=profile" data-toggle="tooltip" data-placement="right" title="Edit your profile" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                         </span>
                         <br>
                         
                    </div>
            
          </div>
        </div>
      </div>
    </div>
</body>
</html>