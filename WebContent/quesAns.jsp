<%@page import="com.ibm.training.qpa.Answers"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ibm.training.qpa.Question"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question And Answers</title>
</head>
<body>
<%
	Question question = new Question();
	Answers answers = new Answers();
	ResultSet resultSetQuestion = question.fetchQuestion(Integer.parseInt(request.getParameter("questionId")), application);
	ResultSet resultSetAnswer = answers.fetchAnswerTopicWise(Integer.parseInt(request.getParameter("questionId")), application);
%>
<%while(resultSetQuestion.next() && resultSetAnswer.next()){ %>
<h3><%=resultSetQuestion.getString("questionDesc") %></h3>
<p><%=resultSetAnswer.getString("answerDesc") %></p>
<%} %>
</body>
</html>