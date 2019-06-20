package com.ibm.training.qpa.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertAnswerInDB {
PreparedStatement ps;
	int inserted;
	private static final String SQL_INSERT_INTO_ANSWER_TABLE = "INSERT INTO ANSWERTABLE (ANSWERDESC, QUESTIONID, ANSWEREDBY,POSTEDBY,DATEQUESTIONED) VALUES (?,?,?,?,?)";

	public int insertAnswerInfo(Connection con, int questionId, int answeredById, int postedById, String answerDesc,
			String date) {
		
		
		try {
			ps = con.prepareStatement(SQL_INSERT_INTO_ANSWER_TABLE);
			ps.setString(1, answerDesc);
			ps.setInt(2, questionId);
			ps.setInt(3, answeredById);
			ps.setInt(4, postedById);
			ps.setString(5, date);
			
			inserted = ps.executeUpdate();
			if(inserted > 0) {
				System.out.println("data inserted into the answertable");
			}else {
				System.out.println("data doesn't inserted into the answertable");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return inserted;
	}
	
	
	

}
