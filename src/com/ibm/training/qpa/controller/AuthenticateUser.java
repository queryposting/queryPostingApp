package com.ibm.training.qpa.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.training.qpa.bean.User;
import com.ibm.training.qpa.model.QueryDao;
import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class AuthenticateUser
 */
@WebServlet("/user")
public class AuthenticateUser extends HttpServlet {
	QueryDao dao = new QueryDao();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("request : " + request.getParameter("email"));
		String questionId = request.getParameter("questionId");
		request.setAttribute("questionId", questionId);
		response.setContentType("text/html");
		User user = new User();
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		boolean flag = dao.validateUser(request, response, getServletContext(), user);
		if(flag == true) {
			request.getRequestDispatcher("retrieve").forward(request, response);
		} else {
			//response.getWriter().append("<h3>EmailId and Password does not exists!</h3>");
			request.setAttribute("notValid", "<h5 style='color:red;'>Email Id and Password does not exists!</h5>");
			request.getRequestDispatcher("loginAndSignUp.jsp").include(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
