package com.ibm.training.qpa.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.training.qpa.bean.Answer;
import com.ibm.training.qpa.model.QueryDao;

/**
 * Servlet implementation class InsertAnswer
 */
@WebServlet("/insertans")
public class InsertAnswer extends HttpServlet {
	QueryDao dao = new QueryDao();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Answer answer = new Answer();
		HttpSession session = request.getSession();
		answer.setAnswerDesc(request.getParameter("content"));
		answer.setQuestionId(Integer.parseInt(request.getParameter("questionId")));
		answer.setAnsweredBy(Integer.parseInt(String.valueOf(session.getAttribute("userId"))));
		answer.setPostedBy(Integer.parseInt(request.getParameter("postedBy")));
		boolean flag = dao.insertAnswer(request, response, getServletContext(), answer);
		if(flag == true) {
			dao.showContentData(request, response, getServletContext());
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
