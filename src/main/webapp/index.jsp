<%@page import="com.geekblogs.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GeekBlog</title>
 <!-- <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
 -->
<!--bootstrap css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- mycss -->
<link rel="stylesheet" href="css/style.css" type="text/css">

<!-- fontscss -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- banner backgroung -->
<style>
		
		 .banner-background{
			clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 64% 87%, 33% 94%, 0 89%, 0 0);
		}
		 
</style>


</head>
<body>
	
	
	<!-- navbar -->
	<%@include file="navbar.jsp" %>
	
	
	<!-- Banner -->
	<div class="container-fluid p-0 m-0 banner-background" >
		
		<div class="jumbotron primary-background text-white">
			<div class="container">
				<h3 class="display-3">Welcome to GeekBlogs </h3>
				
				<p>Geekblogs is a simple Hugo theme for personal blogs. It is intentionally designed as a fast and lean theme and may not fit the requirements of complex projects. If a more feature-complete theme is required there are a lot of got alternatives out there. This post helps you to get started with the Geekblog theme, including initial setup and basic configuration.</p>
				
				<a href="registerpage.jsp" class="btn-outline-light btn-lg" name="signup" > <i class="fa fa-external-link"></i> Signup for free!</a>
				<a href="loginpage.jsp" class="btn-outline-light btn-lg" name="login" > <i class="	fa fa-user-circle fa-spin"></i> Login!</a>
				
			</div>
		</div>
		
	</div>
	
	
	<!-- Adding Cards -->
	<div class="container">
    <div class="row">
        <div class="col-md-4">
        	<div class="card">
        		<div class="card-body">
        			<h5 class="card-title">Software development</h5>
        			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Go somewhere</a>
        		</div>    
        	</div>    
        </div>
        <div class="col-md-4">
        	<div class="card">
        		<div class="card-body">
        			<h5 class="card-title">Software development</h5>
        			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Go somewhere</a>
        		</div>    
        	</div>          	
        </div>
        <div class="col-md-4">
        	<div class="card">
        		<div class="card-body">
        			<h5 class="card-title">Software development</h5>
        			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Go somewhere</a>
        		</div>    
        	</div>    
        </div>
    </div>
    <br>
   <div class="row">
        <div class="col-md-4">
        	<div class="card">
        		<div class="card-body">
        			<h5 class="card-title">Software development</h5>
        			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Go somewhere</a>
        		</div>    
        	</div>    
        </div>
        <div class="col-md-4">
        	<div class="card">
        		<div class="card-body">
        			<h5 class="card-title">Software development</h5>
        			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Go somewhere</a>
        		</div>    
        	</div>          	
        </div>
        <div class="col-md-4">
        	<div class="card">
        		<div class="card-body">
        			<h5 class="card-title">Software development</h5>
        			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Go somewhere</a>
        		</div>    
        	</div>    
        </div>
    </div>
</div>
	
	
	
	
	<!-- js -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"  integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	
	<!-- bootstrap js test -->
	<!-- <script type="text/javascript">
		$(document).ready(function(){
			alert("document loaded")
			
		})
	</script> -->
	
	<!-- myjavascript -->
	<script type="text/javascript" src="js/myscript.js"></script>
	
</body>
</html>