<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Oops!</title>
		
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
		
		<div class="container text-center" style="padding-top:10%;">
				<img alt="error" src="pics/error.png" class="img-fluid" style="height:20%; width:20%;">
				<h3 class="display-3">Sorry! Something went wrong...</h3>
				<%= exception %><br>
				<a href="index.jsp" class="btn primary-background text-white mt-3">Home</a>
		</div>
		
		
		
	</body>
</html>