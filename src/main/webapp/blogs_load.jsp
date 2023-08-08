<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.geekblogs.entities.Blog"%>
<%@page import="java.util.List"%>
<%@page import="com.geekblogs.helper.ConnectionProvider"%>
<%@page import="com.geekblogs.dao.BlogDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div class="row" >
	
	<%

	BlogDao d=new BlogDao(ConnectionProvider.getConnection());
	List<Blog> blog=null;
	int cid=Integer.parseInt(request.getParameter("cid"));
	if(cid==0){
		blog=d.getAllBlogs();
	}else{
		blog=d.getSelectedBlog(cid);
	}
	
	if(blog.size()==0){
		out.println("<h3 class='display-3 text-center'> No Post in this category yet...</h3>");
	}
	else
		for(Blog b: blog){

	%>
	
		
			<div class="col-md-6 mt-3">
				
				<div class="card border-secondary mb-3">
				
				<div class="card-body">
					<div class="top-right" style="float:right;margin:0 0 0 auto;">
						<%
						SimpleDateFormat sdf = new SimpleDateFormat("MMM-dd-yyyy");
						String blogAt=sdf.format(b.getBlog_createdAt());
						%>
						at: <%= blogAt%>
					</div>				
					<b> <%=b.getBlog_title() %> </b>
					<p> <%=b.getBlog_content() %> </p>
					</div>
					<%
					if (b.getBlog_image().equals("default")==false){
					
					%><img class="card-img-bottom" src="blogs_pics/<%=b.getBlog_image() %>" >
					<%
					}
					%>
				</div>
		
				
				
			</div>
					
	
	<%
		}
	%>
	
	
</div>