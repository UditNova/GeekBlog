package com.geekblogs.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.geekblogs.dao.BlogDao;
import com.geekblogs.entities.Blog;
import com.geekblogs.entities.User;
import com.geekblogs.helper.ConnectionProvider;
import com.geekblogs.helper.Helper;

/**
 * Servlet implementation class AddBlogServlet
 */
@WebServlet("/AddBlogServlet")
@MultipartConfig
public class AddBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBlogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int cat_id=Integer.parseInt(request.getParameter("cid"));
		String blog_title=request.getParameter("blog_title");
		String blog_content=request.getParameter("blog_content");
		Part part=request.getPart("image");
		//out.println("image is: "+part.getSubmittedFileName());
		
		//taking user id from session
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("currentuser");
		
		//creating Blog object and setting data
		Blog b=new Blog(blog_title, blog_content, null, null, cat_id, user.getId(), part.getSubmittedFileName());
		BlogDao blog_dao=new BlogDao(ConnectionProvider.getConnection());
		if(blog_dao.saveBlog(b)) {			
			String path=request.getRealPath("/")+"blogs_pics"+File.separator+part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			//out.println("Data is saved to database."+ path);
			out.println("done");
		}
		else {
			out.println("Error");
		}
	}

}
