package com.ibm.training.qpa;

import java.sql.ResultSet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.ibm.training.qpa.model.QueryDao;

public class AllQuestions {
	QueryDao dao = new QueryDao();

	public ResultSet fetchQuestion(int userId, ServletContext context) {
		return dao.fetchAllQuestion(userId, context);
	}
}
