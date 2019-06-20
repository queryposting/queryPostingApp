package com.ibm.training.qpa;

import java.sql.ResultSet;
import javax.servlet.ServletContext;

import com.ibm.training.qpa.model.QueryDao;

public class Answers {
	QueryDao dao = new QueryDao();
	
	public ResultSet fetchAnswer(int answerId, ServletContext context) {
		return dao.fetchAnswer(answerId, context);
		
	}
	
	public ResultSet fetchAnswerTopicWise(int questionId, ServletContext context) {
		return dao.fetchAnswerTopicWise(questionId, context);
	}

}
