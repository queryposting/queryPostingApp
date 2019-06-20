package com.ibm.training.qpa.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.training.qpa.DateDifference;
import com.ibm.training.qpa.bean.Comment;
import com.ibm.training.qpa.model.QueryDao;

/**
 * Servlet implementation class AddComment
 */
@WebServlet("/addcomment")
public class AddComment extends HttpServlet {
	QueryDao dao = new QueryDao();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("questionId in servlet : " + request.getParameter("questionId"));
		//System.out.println("comment in servlet : " + request.getParameter("comment"));
		String rowId = request.getParameter("rowId");
		HttpSession session = request.getSession();
		Comment comment = new Comment();
		comment.setComment(request.getParameter("comment"));
		comment.setQuestionId(Integer.parseInt(request.getParameter("questionId")));
		comment.setCommentedBy(Integer.parseInt(String.valueOf(session.getAttribute("userId"))));
		int questionId = dao.addComment(request, response, getServletContext(), comment);
		if(questionId != 0) {
			ResultSet resultSet = dao.fetchComment(questionId, getServletContext());
			if(resultSet != null) {
				try {
					while(resultSet.next()) {
						ResultSet resultSetUser = dao.fetchUser(resultSet.getInt("commentedBy"), getServletContext());
						DateDifference dateDifference = new DateDifference();
						String dateDiff = dateDifference.dateDiff(resultSet.getString("dateCommented"));
						String[] dateArr = dateDiff.split(",");
						String time = "";
						//System.out.println("hours : " + dateArr[0] + ", minutes : " + dateArr[1] + ", seconds : " + dateArr[2]);
						if(dateArr[0].equals("0")) {
							if(dateArr[1].equals("0")) {
								if(dateArr[2].equals("0")) {
									time = "just now";
								} else {
									time = dateArr[2] + " seconds ago";
								}
							} else {
								time = dateArr[1] + " minutes ago";
							}
						} else {
							time = dateArr[0] + " hours ago";
						}
						while(resultSetUser.next()) {
							response.getWriter()
									.append("<div> <p><span class='fas fa-user-circle'></span>" + resultSetUser.getString("fName") + " "
											+ resultSetUser.getString("lName") + "</p><p>Posted "+time+"</p><p>" + resultSet.getString("comment")
											+ "</p><button onclick=\"deleteComment('"+resultSet.getInt("commentId")+","+rowId+","+resultSet.getInt("questionId")+"')\">Delete</button></div>");
						}
						}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
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
