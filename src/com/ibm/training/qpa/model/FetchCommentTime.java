/*
 * package com.ibm.qpa.model;
 * 
 * import java.sql.Connection; import java.sql.PreparedStatement; import
 * java.sql.SQLException;
 * 
 * public class FetchCommentTime {
 * 
 * int fetchTime; PreparedStatement ps; private static final String
 * SELECT_FETCH_TIME_OF_COMMENT =
 * "SELECT DATECOMMENTED FROM COMMENTSTABLE WHERE COMMENT=? AND  ( QUESTIONID, COMMENTEDBY,COMMENT) VALUES (?,?,?)"
 * ;
 * 
 * public int fetchCmtTime(Connection con, int questionId, int answeredById,
 * String comment_data) {
 * 
 * try { ps = con.prepareStatement(SQL_INSERT_INTO_COMMENT_TABLE); ps.setInt(1,
 * questionId); ps.setInt(2, answeredById); ps.setString(3, comment_data);
 * 
 * inserted = ps.executeUpdate(); if (inserted > 0) {
 * System.out.println("data inserted into the commentstable"); } else {
 * System.out.println("data doesn't inserted into the commentstable"); } } catch
 * (SQLException e) {
 * 
 * e.printStackTrace(); }
 * 
 * return inserted; }
 * 
 * }
 */