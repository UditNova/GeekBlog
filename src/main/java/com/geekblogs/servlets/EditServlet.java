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

import com.geekblogs.dao.Userdao;
import com.geekblogs.entities.Message;
import com.geekblogs.entities.User;
import com.geekblogs.helper.ConnectionProvider;
import com.geekblogs.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */


@WebServlet("/EditServlet")@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		/* fetching the new data */
		String userName=request.getParameter("user_name");
		String userEmail=request.getParameter("user_email");
		String userPassword=request.getParameter("user_password");
		String userOccupation=request.getParameter("user_occupation");
		Part part=request.getPart("image");
		String imgName=part.getSubmittedFileName();
	
		
		//getting the user from session
		
		HttpSession s=request.getSession();
		User user=(User) s.getAttribute("currentuser");
		user.setName(userName);
		user.setEmail(userEmail);
		user.setPassword(userPassword);
		user.setOccupation(userOccupation);
		String oldpfp=user.getProfile();
		user.setProfile(imgName);
		
		
		//updating the database
		Userdao dao=new Userdao(ConnectionProvider.getConnection());
		boolean reply=dao.updateUser(user);
		if(reply) {
			
			
			
			String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			String oldpfpPath=request.getRealPath("/")+"pics"+File.separator+oldpfp;
			
			if(!oldpfp.equals("defaultPic.jpg") ) {

				Helper.deleteFile(oldpfpPath);
				
				
			}
			
				if(Helper.saveFile(part.getInputStream(), path)){
					Message msg= new Message("Profile Updated Succesfully!!", "Success", "alert-Success");
					
					s.setAttribute("msg", msg);
					
					response.sendRedirect("profile.jsp");
					
				}
				
				else {
					Message msg= new Message("Failed to upload pic...Try again! ", "error", "alert-danger");
					
					s.setAttribute("msg", msg);
					
				}
			
			
		}else {
			
			Message msg= new Message("Something went wrong...Try again! ", "error", "alert-danger");
			
			s.setAttribute("msg", msg);
		}
		//response.sendRedirect("profile.jsp");
	}

}
