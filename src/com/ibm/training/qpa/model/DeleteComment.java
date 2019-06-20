package com.ibm.training.qpa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteComment {

	PreparedStatement ps;
	int deleted;
	private static final String DELETE_COMMENT = "DELETE FROM COMMENTSTABLE WHERE COMMENTID = ?";


	public int deleteComment(Connection con, int commentId) {
		
	
		try {
			ps = con.prepareStatement(DELETE_COMMENT);
			ps.setInt(1, commentId);
			
			
			deleted = ps.executeUpdate();
			if(deleted > 0) {
				System.out.println("data deleted from commenttable in dao check");
			}else {
				System.out.println("data did not from  the commenttablen in dao check");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return deleted;
	}
}
