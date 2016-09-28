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

function Validate() {
	var password = document.getElementById("newpassword").value;
	var confirmPassword = document.getElementById("cpass").value;
	if (password != confirmPassword) {
		alert("Passwords do not match.");
		return false;
	}
	return true;
}

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
           <a href="userprofile" >View Profile</a>
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
                  <h4>Edit Profile </h4>
                	<form:form method="POST" commandName="edit_profile" action="${pageContext.request.contextPath}/update_profile">
						<c:choose>
							<c:when test="${click=='profile'}">
                        <div class="form-group">
                        	<div class="col-sm-4 form-group">
                            	<form:label path="fname" >First Name</form:label>
                            	<form:input path="fname" class="form-control"  required="true" autofocus="true" value="${userdetails.fname}"/>
                            	<form:errors path="fname" cssClass="error"/></td>
                        	</div>
                        
                        	<div class="col-sm-4 form-group">
                            	<form:label path="sname" >Second Name</form:label>
                            	<form:input path="sname" class="form-control"  required="true" value="${userdetails.sname}" />
                            	<form:errors path="sname" cssClass="error"/>
                        	</div>
                        	<div class="col-sm-4 form-group">
                            	<form:label path="lname" >Last Name</form:label>
                            	<form:input path="lname" class="form-control" required="true" value="${userdetails.lname}"/>
                            	<form:errors path="lname" cssClass="error"/>
                        	</div>
                        </div> 
                        <div class="form-group">
                            <form:label path="dob" >Date of Birth</form:label>
                            <form:input path="dob" class="form-control" placeholder="dd/mm/yyyy" pattern="\d{2}/\d{2}/\d{4}" required="true"  title="dd/mm/yyyy" value="${userdetails.dob}"/>
                            <form:errors path="dob" cssClass="error"/>
                        </div>
                        <div class="form-group">
                            <form:label path="address" >Address</form:label>
                            <form:input path="address"  class="form-control" required="true" value="${userdetails.address}" />
                            <form:errors path="address" cssClass="error"/>
                        </div>
                        
                         <div class="form-group">
                            <form:label path="city">City</form:label>
                            <form:input path="city" class="form-control" required="true" value="${userdetails.city}"/>
                            <form:errors path="city" cssClass="error"/>
                        </div>
                         <div class="form-group">
                            <form:label path="contact" >Contact</form:label>
                            <form:input path="contact" class="form-control"  required="true"  pattern="[0-9]{10}" title="Enter 10 digit contact number" value="${userdetails.contact}"/>
                            <form:errors path="contact" cssClass="error"/>
                        </div>
                         <div class="form-group">
                            
                            <form:hidden path="user_id" id="user_id" value="${userdetails.user_id}"/>
                            
                            
                            <form:hidden path="password"  value="${userdetails.password}" id="password" />
                           
                        </div>
                        </c:when>
                        <c:when test="${click=='password'}">
                        <div class="form-group">
                          <!--    <form:label path="password" >Old Password</form:label>
                            <form:password path="password" class="form-control" id="password" name="password" placeholder="Password" required="true" pattern=".{6,15}" title="Your password must between 6 and 15 characters"/>
                            <form:errors path="password" cssClass="error"/>-->
                            <label >Old Password</label>
                            <input type="password" class="form-control" id="oldpassword" name="oldpassword" placeholder="Password" required="true" pattern=".{6,15}" title="Your password must between 6 and 15 characters"/>
                        </div>
                        <div class="form-group">
                            <form:label path="password" >New Password</form:label>
                            <form:password path="password" class="form-control" id="newpassword" name="newpassword" placeholder="Password" required="true" pattern=".{6,15}" title="Your password must between 6 and 15 characters"/>
                            <form:errors path="password" cssClass="error"/>
                        </div>
                        <div class="form-group">
                            <b>Confirm Password</b> <br>
                            <input type="password" name="cpass" id="cpass" class="form-control" placeholder="Confirm Password" required="true">
                        </div>
                        <div>
                        	<form:hidden path="user_id"  value="${userdetails.user_id}" id="user_id" />
                        	<form:hidden path="fname"  value="${userdetails.fname}" />
                        	<form:hidden path="sname"  value="${userdetails.sname}" />
                        	<form:hidden path="lname"  value="${userdetails.lname}" />
                        	<form:hidden path="dob"  value="${userdetails.dob}" />
                        	<form:hidden path="city"  value="${userdetails.city}" />
                        	<form:hidden path="address"  value="${userdetails.address}" />
                        	<form:hidden path="contact"  value="${userdetails.contact}" />
                        	
                        
                        
                        </div>
                       
                        </c:when>
                        </c:choose>
                        <h4>
				<i style="color: red">${msg}</i>
			</h4>
                       <div class="pull-right">
                        <button type="submit" class="btn btn-success"
							style="width: 100px;" onclick="return Validate()">Save</button>
                        </div>
                    </form:form>
                  
                </div>
              </div>
            </div>
                 <div class="panel-footer">
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