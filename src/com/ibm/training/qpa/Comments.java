package com.ibm.training.qpa;

import java.sql.ResultSet;

import javax.servlet.ServletContext;

import com.ibm.training.qpa.model.QueryDao;

public class Comments {
	QueryDao dao = new QueryDao();
	public ResultSet fetchComment(int questionId, ServletContext context) {
		return dao.fetchComment(questionId, context);
	}

}
