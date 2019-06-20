package com.ibm.training.qpa.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.training.qpa.model.FetchQuestion;


@WebServlet("/answerservlet")
public class AnswerServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		Connection  con = (Connection) getServletContext().getAttribute("dbCon");
		FetchQuestion fetch = new FetchQuestion();
		ResultSet rs = fetch.fetchQuestion(con);
		if(rs == null) {
			System.out.println("really rs is null insde AnswerServlet");
			System.out.println("for testing purpose");
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("resultQ", rs);
		
		response.sendRedirect("answer1.jsp");
		
		
	
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		doGet(request, response);
	}

}
