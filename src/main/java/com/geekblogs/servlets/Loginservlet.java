package com.geekblogs.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.geekblogs.dao.Userdao;
import com.geekblogs.entities.Message;
import com.geekblogs.entities.*;
import com.geekblogs.helper.ConnectionProvider;

/**
 * Servlet implementation class Loginservlet
 */
@WebServlet("/Loginservlet")
public class Loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loginservlet() {
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
		/*
		 * res.setContentType("text/html"); PrintWriter out = res.getWriter();
		 */
		
		//fetch user name from request
		 String userName=req.getParameter("email");
		 String password=req.getParameter("password");
		
		Userdao dao=new Userdao(ConnectionProvider.getConnection());		 
		
		User u = dao.getUserByEmailAndPassword(userName, password);
		
		
		if(u==null) {
			//login error...
			/* out.println("Invalid details, try again!"); */
			
			Message msg= new Message("Invalid detail", "Error", "alert-danger");
			
			HttpSession s= req.getSession();
			s.setAttribute("msg", msg);
			
			res.sendRedirect("loginpage.jsp");
			
			
		}else {
		
			//creating session object
			HttpSession s=req.getSession();
			s.setAttribute("currentuser", u);
			res.sendRedirect("profile.jsp");
			
			
			
			
			/*
			 * out.println(u.getName()); out.println(u.getProfile());
			 * out.println(u.getEmail()); out.println(u.getGender());
			 * out.println(u.getDateTime());
			 */
		
		}
	}

}
