package com.ibm.training.qpa.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.training.qpa.model.QueryDao;

/**
 * Servlet implementation class CheckDuplicateEmail
 */
@WebServlet("/emailcheck")
public class CheckDuplicateEmail extends HttpServlet {
	QueryDao dao = new QueryDao();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean flag = dao.checkEmail(request.getParameter("email"), getServletContext());
		if(flag == true) {
			response.getWriter().append("<h6 style='color:red;'>Email Id already exists!</h6>");
		} else {
			response.getWriter().append("");
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
