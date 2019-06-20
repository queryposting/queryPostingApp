package com.ibm.training.qpa.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.training.qpa.DateDifference;
import com.ibm.training.qpa.model.QueryDao;

/**
 * Servlet implementation class DeleteComment
 */
@WebServlet("/deletecomment")
public class DeleteComment extends HttpServlet {
	QueryDao dao = new QueryDao();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("commentId in servlet : " + request.getParameter("commentId"));
		String rowId = request.getParameter("rowId");
		int questionId = Integer.parseInt(request.getParameter("questionId"));
		boolean flag = dao.deleteComment(Integer.parseInt(request.getParameter("commentId")), getServletContext());
		if(flag == true) {
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
