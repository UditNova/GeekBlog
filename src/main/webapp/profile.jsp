
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.geekblogs.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.geekblogs.helper.ConnectionProvider"%>
<%@page import="com.geekblogs.dao.BlogDao"%>
<%@page import="com.geekblogs.entities.Message"%>
<%@page import="com.geekblogs.entities.User"%>
<%@page import="com.geekblogs.servlets.*"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 
 

<%@page errorPage="errorpage.jsp" %> 

<%
	User user=(User)session.getAttribute("currentuser");
	if(user==null){
		
		response.sendRedirect("loginpage.jsp");
	}


%>


 	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile</title>

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
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><i class='fas fa-atom'></i>GeekBlogs</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"> Homepage <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Fiter with
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Data Structures</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Projects</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Programming Languages</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Frequently asked</a>
        </div>
      </li>      
      <li class="nav-item">
        <a class="nav-link" href="#">  Connect </a>
      </li>
     
      <li class="nav-item">
        <a class="nav-link " href="#">More...</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link " href="#" data-toggle="modal" data-target="#addBlog" id="add-blog"><i class='fas fa-edit'></i>Create Blog</a>
      </li>
      
    </ul>
    
    <ul class="navbar-nav mr-right">
    	
    	 <li class="nav-item">  
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profileModal"> <i class="fa fa-user-circle"></i> <%=user.getName() %></a>
      </li>
    	
    	<li class="nav-item">  
        	<a class="nav-link" href="LogoutServlet"> <i class="fa fa-user-plus"></i> Logout</a>
      	</li>
    	
    </ul>
    
  </div>
</nav>
	
	<!-- end of navbar -->
	
	
	<!--  Message module-->
				<%
								
					Message m=(Message)session.getAttribute("msg");
					if(m!=null){						
				%>	
								
				<div class="alert <%=m.getCssClass() %>" role="alert">
					<%=m.getContent() %>
				</div>
							
				<%
					session.removeAttribute("msg");
				}
							
				%>
	<!-- End of Message module-->
				
	<!-- main body -->
		
		<main>
			
			<div class="container l-10">
				
				<div class="row mt-4">
					<!-- first column -->
					<div class="col-md-4">
						<!-- categories -->
						<div class="list-group text-center">
							  <a href="#" onclick="getBlogs(0, this) " class=" c-link list-group-item list-group-item-action active">
							    All Categories
							  </a>
							  <%
								BlogDao d=new BlogDao(ConnectionProvider.getConnection());
								ArrayList<Category> l1=d.getCategories();
								for(Category c1:l1){
								%>
								<a href="#" onclick="getBlogs(<%=c1.getCat_id() %>, this)" class=" c-link list-group-item list-group-item-action"><%=c1.getCat_name() %></a>
								<%
								}
								%>							  	  
						</div>											
					</div>
					<!-- second column -->
					<div class="col-md-8">
						
						<!-- all posts -->
						
						<!-- loader -->
						<div class="container text-center mt-3" id="loader">
							<div class="spinner-border" role="status">
  								
							</div>
							<h3 style="color: green;">please wait...</h3>					
						</div>
						<div class="container-fluid" id="post_container">
							
						</div>
					</div>
				</div>
				
			</div>
			
		</main>	
		
	<!-- end of main body -->
		
	
	<!-- start of profile modal -->
		
		<!-- Modal -->
		<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header primary-background text-white">
		        <h5 class="modal-title " id="exampleModalLabel">Geekblogs</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        
		        <div class="container text-center" >
		        	<img alt="profile_pic" src="pics/<%=user.getProfile() %>" class="img-fluid" style="border-radius:50%; max-width:100px;">		        	<br>
		        	<h5 class="modal-title mt-3 " id="exampleModalLabel"><%=user.getName() %></h5>
		        	
		        	
		        	<!-- details -->
		        	<div id="profile-details">
		        		
				        <table class="table">
						  <thead>
						    <tr>
						      <th scope="col">Id: </th>
						      <td scope="col"><%=user.getId() %></td>
						      
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">Email: </th>
						      <td><%=user.getEmail() %></td>
						      
						    </tr>
						    <tr>
						      <th scope="row">Gender: </th>
						      <td><%=user.getGender() %></td>
						     
						    </tr>
						    <tr>
						      <th scope="row">Occupation: </th>
						      <td><%=user.getOccupation() %></td>
						     
						    </tr>
						     </tr>
						    <tr>
						      <th scope="row">Member Since: </th>
						      <td><%=user.getDateTime()%></td>
						     
						    </tr>
						  </tbody>
						</table>	
		        	</div>
				        	
	<!-- edit-profile -->
		        	<div id="profile-edit" style="display: none;">
		        		
		        		<h3 class="mt-3">Edit Profile </h3>
		        		<form action="EditServlet" method="post" enctype="multipart/form-data">
		        			<table class="table">
		        			
		        					<tr>
		        						<th>Id:</th>
		        						<td ><%=user.getId() %></td>
		        					</tr>
		        					
		        					<tr>
		        						<th>Username: </th>
		        						<td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
		        					</tr>
		        					
		        					<tr>
		        						<th>Email: </th>
		        						<td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
		        					</tr>
		        					
		        					<tr>
		        						<th>Password: </th>
		        						<td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>
		        					</tr>
		        					
		        					<tr>
		        						<th>Gender:</th>
		        						<td><%=user.getGender() %>
		        					</tr>
		        					
		        					<tr>
		        						<th>Occupation: </th>
		        						<td><input type="text" class="form-control" name="user_occupation" value="<%=user.getOccupation().toUpperCase()%>"></td>
		        					</tr>
		        					
		        					<tr>
		        						<th>New Pic:</th>
		        						<td><input type="file" name="image" class="form-control"></td>
		        					</tr>
		        							        					
		        			</table>
		        			
		        			
		        					<div class="container">
		        						<button type="submit" class="btn btn-outline-primary">Save</button>
		        					</div>
		        					
		        		</form>
		        	</div>
		        	
		        
		        </div>
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
		      </div>
		    </div>
		  </div>
		</div>

	<!-- end of profile modal -->


	<!-- Create post Modal -->
			
		<!-- Modal -->
		<div class="modal fade" id="addBlog" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <div class="container text-center"><h5 class="modal-title" id="blogTitle">New Blog</h5></div>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      
		      <form id="add-blog-form"  method="post">
		      
			      	<div class="form-group">
			      		<input type="text" name="blog_title"  placeholder="Insert title here..." class="form-control">
			      	</div>		      	
			      	
			      	<div>
			      		<textarea rows="5" name="blog_content" style="height:200px; " class="form-control" placeholder="The best post type to share thoughts, ideas or reviews. Members can also add pictures and gifs."></textarea>
			      	</div>		      	
			      	
			      	<div class="form-group">
			      		<label>Select image here...</label> <br>  
			      		<input name="image" type="file" >
			      	</div>
			      			      	
			      	<div class="form-group">
			      		<select name="cid" class="form-control">	
			      			<option selected disabled >---Select Category---</option>	      		
			      			<%
			      				BlogDao blogD=new BlogDao(ConnectionProvider.getConnection());
			      				ArrayList<Category> list= blogD.getCategories();
			      				for( Category c:list){
			      			%>
			      			
			      			<option value="<%=c.getCat_id()%>"><%=c.getCat_name() %></option>
			      			<%
			      				}
			      			%>
			      		</select>
			      	</div>
		      		   
		      		<div class="container text-center">
		        		<button type="submit" class="btn btn-primary">Post</button>
		        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>		        	
		       		 </div>
		      		      	
		      </form>
		        
		      </div>
		      
		    </div>
		  </div>
		</div>
	<!-- end of post modal -->
	
		
	
	
	
		<!-- js -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"  integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js' ></script>
		<script type="text/javascript">
			
			$(document).ready(function(){
				
				let editStatus=false;
				
				$('#edit-profile-button').click(function() {
					
					if(editStatus==false){
						
		
						$("#profile-details").hide()
						$("#profile-edit").show();
						editStatus=true;
						$(this).text("Back")
						
					}else{
						
						$("#profile-details").show()
						$("#profile-edit").hide();
						editStatus=false;
						$(this).text("Edit")
						
					}
					
				})
			});
			
		</script>
		
		<!-- adding blog to database -->
		<script type="text/javascript">
		
			$(document).ready(function(e){
				
				$("#add-blog-form").on("submit", function (event) {
					//preventing synchronous flow of form
					event.preventDefault();
					console.log("Form successfully submitted!! ")
					//creating an object of form to send data through ajax to servlet
					let form=new FormData(this);
					//requesting to server
					$.ajax({
						url:"AddBlogServlet",
						type:'POST',
						data: form,
						success: function (data, textstatus, jqXHR) {
							//success..
							console.log("here is: "+data);
							if(data.trim()=='done'){
								swal({
								    title: "Good Job!",
								    text: "Post Successfully created!",
								    type: "success"
								}).then(function() {
								    window.location = "profile.jsp";
								});
								
							}
							else{
								swal("Error!!","Oops! Something went wrong... ","error");
							}
							
						},
						error: function (jqHXR, textstatus, errorThrown) {
							//error..
						},
						//to show type of data you are sending to servlet 
						processData: false,
						contentType: false
						
					})
					
					
				})
				
			})
		
		</script>
		
		<!-- fetching blogs -->
		<script>
			
			
			function getBlogs(cat_id, temp) {
				$("#loader").show();
				$("#post_container").hide();
				$(".c-link").removeClass('active');
				
				$.ajax({					
					url: "blogs_load.jsp",
					data: {cid: cat_id},
					success: function (data, textstatus, jqXHR) {
						/* console.log(data); */
						$("#loader").hide();
						$("#post_container").show();
						$("#post_container").html(data);
						$(temp).addClass('active');
					}
				})
			}
		
		
			$(document).ready(function (e){
				let allblogsref=$('.c-link')[0]
				getBlogs(0,allblogsref)
				
			})
		
		</script>	
	
</body>
</html>