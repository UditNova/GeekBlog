package com.geekblogs.servlets;

import java.io.IOException;
import com.geekblogs.dao.*;
import java.io.PrintWriter;
import com.geekblogs.entities.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.geekblogs.helper.ConnectionProvider;

/**
 * Servlet implementation class Registerservlet
 */
@MultipartConfig
@WebServlet("/Registerservlet")
public class Registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registerservlet() {
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
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//fetch all form data
		String check=req.getParameter("check");
		
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();

		if(check==null) {
			
			out.println("box not checked");
		}else {
			//fetching rest of the data
			String name=req.getParameter("user_name");
			String email=req.getParameter("user_email");
			String password=req.getParameter("user_password");
			String gender=req.getParameter("gender");
			String occupation=req.getParameter("occupation");
			
			//creating user object and setting data to that object
			User user=new User(name,email,password,gender,occupation);
			
			
			//create a userdao object
			Userdao dao=new Userdao(ConnectionProvider.getConnection());
			if(dao.saveuser(user)==true) {
				
				//saved data 
				out.println("done");
				
			}else {
				out.println("error");
			}
			
		}
		
		
	}

}
