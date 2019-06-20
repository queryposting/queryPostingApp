package com.ibm.training.qpa;

import java.sql.ResultSet;
import javax.servlet.ServletContext;

import com.ibm.training.qpa.model.QueryDao;

public class UserProfile {
	QueryDao dao = new QueryDao();
	public ResultSet fetchUser(int userId, ServletContext context) {
		return dao.fetchUser(userId, context);
	}
}
