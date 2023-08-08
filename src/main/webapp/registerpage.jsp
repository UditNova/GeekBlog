<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up</title>
	
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
			
			padding-bottom:10%;
		}
		
		
		 
</style>


</head>
<body>
	
		
		
		
		<main class="primary-background	p-5 banner-background" style="height:110vh ">
				
			<div class="container">
			
				<div class="col-md-6 offset-md-3">
					
					<div class="card "  >
						
						<div class="card-header text-center primary-background text-white">
							<i class="fa fa-3x fa-user-circle"></i>
							<h5>Register here!</h5>
						
						</div>
						
						<div class="card-body">
						
							<form action="Registerservlet" method="post" id="reg-form">
								
								
  								<div class="form-group">
    								<label for="user_name">Username</label>
    								<input type="text" name="user_name"class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter user_name">
    								
  								</div>
								
  								<div class="form-group">
    								<label for="exampleInputEmail1">Email address</label>
    								<input type="email" name="user_email"class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    								<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  								</div>
  								
  								<div class="form-group">
    								<label for="gender">Your Gender</label><br>
    								<input type="radio" id="gender" name="gender" value="male">Male
    								<input type="radio" id="gender" name="gender" value="female">Female
  								</div>
  								
  								
  								<div class="form-group">
    								<label for="exampleInputPassword1">Password</label>
    								<input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  								</div>
  								
  								
  								<div class="form-group">
    								<label for="occupation">Your Occupation</label>
    								<input type="text" name="occupation" class="form-control" id="occupation" placeholder="e.g., student,employee">
  								</div>
  								
  								
  								
  								<div class="form-check">
    								<input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
    								<label class="form-check-label" for="exampleCheck1">I agree terms and conditions</label>
  								</div>
  								<br>
  								<div class="container text-center" id="loader" style="display:none;">
  									<i class="fa fa-refresh fa-spin fa-2x" ></i>
  									<p>Please wait...</p>
  								</div>
  								
  								<br>
 								 <button type="submit" class="btn btn-primary">Submit</button>
							</form>
						
						</div>
						
					</div>
					
				</div>
				
			
			</div>
				
			
			
		</main>
		
		
	
	
		<!-- js -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"  integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	
	<!-- alert for successful registration -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- Ajax to inload -->
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			console.log("loded.....")
			
			$('#reg-form').on('submit', function(event){
				
				event.preventDefault();
				
				
				
				//grabbing the user data
				let form=new FormData(this);
				
				//hiding the submit button & showing loader
				$("#submit-btn").hide();
				$("#loader").show();
				
				//sending to register servlet
				$.ajax({
					
					url:"Registerservlet",
					type:'POST',
					data: form,
					success:function(data, textstatus, jqXHR){
						
						console.log(data)
						
						//hiding loader & showing the submit button
						$("#submit-btn").show();
						$("#loader").hide();
						
						if(data.trim()=='done')
						{
							swal("Successfully registered! Redirecting to login page.")
							.then((value) => {
							  window.location="loginpage.jsp"
							});
							
						}else{
							swal(data);
							
						}
						
						
					},
					error: function(jqXHR, textstatus, errorThrown){
						console.log(jqXHR)
						
						$("#submit-btn").show();
						$("#loader").hide();
						swal("Something went wrong!")
						
					},
					processData: false,
					contentType: false
				
				});
				
				
			});
			
		
		});
		
	
	</script>
</body>
</html>