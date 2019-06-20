package com.ibm.training.qpa.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.training.qpa.model.FetchQuestion;
import com.ibm.training.qpa.model.InsertAnswerInDB;

@WebServlet("/afteranswerservlet")
public class AfterAnswerServlet extends HttpServlet implements Servlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection con = (Connection) getServletContext().getAttribute("dbCon");
		HttpSession session = request.getSession();

		int questionId = Integer.parseInt(request.getParameter("questionId"));
		String answerDesc = request.getParameter("answerData");
		/*
		 * String trimmedString = answerDesc.substring(3, answerDesc.length()-4);
		 * request.setAttribute("contentData", trimmedString);
		 */
		request.setAttribute("answerData", answerDesc);

		int answeredById = (int) session.getAttribute("userId");

		int postedById = Integer.parseInt(request.getParameter("postedBy"));
		//java.util.Date date = Date.valueOf(request.getParameter("dateQuestioned"));

		InsertAnswerInDB aas = new InsertAnswerInDB();
		int insertIntoAnswerTable = aas.insertAnswerInfo(con, questionId, answeredById, postedById, answerDesc, request.getParameter("dateQuestioned"));

		FetchQuestion fetchCurrentQuestion = new FetchQuestion();
//ResultSet currQue = fetchCurrentQuestion.fetchJustAnsweredQuestion(con,questionId,answeredById,postedById,answerDesc,date);

//request.setAttribute("justAnsweredDetails", currQue);
		RequestDispatcher dispatch = request.getRequestDispatcher("AfterAnswerJsp.jsp");
		dispatch.include(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}