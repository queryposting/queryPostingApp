package com.ibm.training.qpa.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.training.qpa.model.InsertCommentInfo;
@WebServlet("/commentservlet")
public class CommentServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		Connection  con = (Connection) getServletContext().getAttribute("dbCon");
		int questionId =(int) session.getAttribute("questionId");
//		int answeredById = (int)session.getAttribute("user_id");
		int answeredById = 190;
		String comment_data = request.getParameter("comment_data");
		
		
		InsertCommentInfo cmtInfo = new InsertCommentInfo();
		int commentQueryResult = cmtInfo.insertCommentInfo(con,questionId,answeredById,comment_data);
		if(commentQueryResult > 0) {
			System.out.println("data inserted in cmt table");
		}else {
			
			System.out.println("data doesn't inserted in cmt table");
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher("AfterAnswerJsp.jsp");
		
		
		
		
		dispatch.include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
