package com.ibm.training.qpa;

import java.sql.ResultSet;
import javax.servlet.ServletContext;

import com.ibm.training.qpa.model.FetchQuestion;
import com.ibm.training.qpa.model.QueryDao;
import com.mysql.jdbc.Connection;

public class Question {
	QueryDao dao = new QueryDao();
	FetchQuestion fetchQuestion = new FetchQuestion();

	public ResultSet fetchQuestion(int questionId, ServletContext context) {

		return dao.fetchQuestion(questionId, context);
	}
	
	public ResultSet fetchQuestionTopicWise(int questionId, int topic, ServletContext context) {
		return dao.fetchQuestionTopicWise(questionId, topic, context);
	}
	
	public int fetchQuestionCount(ServletContext context) {
		return dao.fetchQuestionCount(context);
	}
	
	public ResultSet fetchAllUnansweredQuestion(ServletContext context) {
		Connection dbCon = (Connection) context.getAttribute("dbCon");
		return fetchQuestion.fetchQuestion(dbCon);
	}
}
