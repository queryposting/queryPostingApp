package com.ibm.training.qpa.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.training.qpa.bean.RegisterUser;
import com.ibm.training.qpa.model.QueryDao;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/register")
public class Registration extends HttpServlet {
	QueryDao dao = new QueryDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegisterUser ru = new RegisterUser();
		
		ru.setfName(request.getParameter("fname")); 
		ru.setlName(request.getParameter("lname")); 
		ru.setEmail(request.getParameter("email"));
		ru.setPassword(request.getParameter("password")); 
		ru.setConfirmPassword(request.getParameter("conpass"));
	
		boolean flag = dao.registerUser(request, response, getServletContext(),ru);
		if(flag == true) {
			request.getRequestDispatcher("retrieve").forward(request, response);
		}else {
			request.getRequestDispatcher("loginAndSignUp.jsp").include(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
