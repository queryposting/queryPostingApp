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

import com.ibm.training.qpa.model.DeleteComment;

@WebServlet("/deletecommentservlet")
public class DeleteCommentServlet extends HttpServlet {

	int delete;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Connection con = (Connection) getServletContext().getAttribute("dbCon");
		String comment_data = request.getParameter("comment_data");
		int questionId = Integer.parseInt(request.getParameter("questionId"));
		 
		
		DeleteComment delCmt = new DeleteComment();
		
		System.out.println("heloooooooooo"+comment_data);
		System.out.println(questionId);

		

		if (delete > 0) {
			System.out.println("data deleted from cmt table");
			RequestDispatcher dispatch = request.getRequestDispatcher("AfterAnswerJsp.jsp");

			dispatch.include(request, response);
		} else {

			System.out.println("data doesn't deleted in cmt table");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
