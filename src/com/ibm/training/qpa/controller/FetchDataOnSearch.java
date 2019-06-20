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

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class FetchDataOnSearch
 */
@WebServlet("/search")
public class FetchDataOnSearch extends HttpServlet {
	PreparedStatement theStatement;
	Connection dbCon;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Get db connection object from servlet context
		dbCon = (Connection) getServletContext().getAttribute("dbCon");
		String question = request.getParameter("question");
		//System.out.println("question in servlet : " + question);
		response.setContentType("text/html");
		String fetchQry = "select * from questionTable where lower(questionDesc) like ?";
		
		try {
			this.theStatement = this.dbCon.prepareStatement(fetchQry);
			
			this.theStatement.setString(1, "%" +  question + "%");
			
			ResultSet resultSet = this.theStatement.executeQuery();
			//System.out.println(resultSet.first());
			while(resultSet.next()) {
				//System.out.println(resultSet.getString("questionDesc"));
				response.getWriter().append("<a href='loginAndSignUp.jsp?questionId="+resultSet.getInt("questionId")+"'>" + resultSet.getString("questionDesc") +"</a>" + "<br>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
