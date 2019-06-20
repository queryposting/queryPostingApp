package com.ibm.training.qpa.model;

import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.training.qpa.bean.Answer;
import com.ibm.training.qpa.bean.Comment;
import com.ibm.training.qpa.bean.Content;
import com.ibm.training.qpa.bean.Question;
import com.ibm.training.qpa.bean.User;

public interface QueryDaoInteface {
	public boolean validateUser(HttpServletRequest request, HttpServletResponse response, ServletContext context, User user);
	public ResultSet showContentData(HttpServletRequest request, HttpServletResponse response, ServletContext context);
	public boolean insertQuestion(HttpServletRequest request, HttpServletResponse response, ServletContext context, Question question);
	public ResultSet fetchUser(int userId, ServletContext context);
	public ResultSet fetchQuestion(int questionId, ServletContext context);
	public ResultSet fetchAnswer(int answerId, ServletContext context);
	public ResultSet fetchAllQuestion(int userId, ServletContext context);
	public ResultSet fetchQuestionTopicWise(int questionId, int topic, ServletContext context);
	public ResultSet fetchAnswerTopicWise(int questionId, ServletContext context);
	public boolean insertAnswer(HttpServletRequest request, HttpServletResponse response, ServletContext context, Answer answer);
	public boolean insertContent(HttpServletRequest request, HttpServletResponse response, ServletContext context, Content content);
	public int addComment(HttpServletRequest request, HttpServletResponse response, ServletContext context, Comment comment);
	public ResultSet fetchComment(int questionId, ServletContext context);
	public boolean deleteComment(int commentId, ServletContext context);
	public boolean checkEmail(String email, ServletContext context);
}
