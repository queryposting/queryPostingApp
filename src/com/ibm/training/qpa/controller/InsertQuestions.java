package com.ibm.training.qpa.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.training.qpa.bean.Question;
import com.ibm.training.qpa.model.QueryDao;
import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class InsertQuestions
 */
@WebServlet("/insert")
public class InsertQuestions extends HttpServlet {
	QueryDao dao = new QueryDao();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Question question = new Question();
		question.setPostedBy(Integer.parseInt(String.valueOf(session.getAttribute("userId"))));
		question.setQuestionDesc(request.getParameter("question"));
		question.setTopic(Integer.parseInt(request.getParameter("topic")));
		question.setType(Integer.parseInt(request.getParameter("type")));
		
		boolean flag = dao.insertQuestion(request, response, getServletContext(), question);
		if(flag == true) {
			response.sendRedirect("home.jsp");
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
