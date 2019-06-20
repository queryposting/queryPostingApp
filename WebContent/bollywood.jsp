<%@page import="com.ibm.training.qpa.AllQuestions"%>
<%@page import="com.ibm.training.qpa.Answers"%>
<%@page import="com.ibm.training.qpa.UserProfile"%>
<%@page import="com.ibm.training.qpa.Question"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Bollywood</title>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/homeStyle.css">
<script src="js/homeLayout.js"></script>
</head>
<body>
	<%
		/* if (session.getAttribute("userId") == null)
			session.setAttribute("userId", request.getAttribute("userId"));
		if (session.getAttribute("result") == null)
			session.setAttribute("result", request.getAttribute("result")); */
		ResultSet resultSet = (ResultSet) session.getAttribute("result");
		// resultSet.next();

		Question question = new Question();
		UserProfile profile = new UserProfile();
		Answers answers = new Answers();
		AllQuestions allQuestions = new AllQuestions();

		ResultSet resultSetQuestion = null;
		ResultSet resultSetUser = null;
		ResultSet resultSetAnswer = null;
		ResultSet resultSetAllQuestion = null;
	%>
	<br>
	<div class="card">
		<div class="card-header">
			<h3>
				<img src="image/bollyImg.jpeg"> Bollywood Actors and Actresses
			</h3>

			<div class="card-body">
				<nav class="navbar navbar-expand-sm bg-light navbar-light">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fas fa-user-check"></i>Follow 427.2k</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fas fa-bookmark-o"></i>Bookmark</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fas fa-ellipsis-h"></i></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<div class="card-footer">
			<nav class="navbar navbar-expand-sm bg-light navbar-light">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link" href="#">
							Read</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> Answer</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> Most
							Viewed Writers</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<br>
	<%
		//out.println("views: "+resultSet.first());
		resultSet.beforeFirst();
		int i = 1;
		if (resultSet != null) {
			while (resultSet.next()) {
				int topic = 1;
				resultSetQuestion = question.fetchQuestionTopicWise(resultSet.getInt("questionId"), topic, application);
				while (resultSetQuestion.next()) {
	%>
	<div class="card">
		<span class="pull-right clickable close-icon" id="closeIcon"
			data-effect="fadeOut"><i class="fas fa-times"></i></span>
		<div class="card-header">
			<%
				
					resultSetAnswer = answers.fetchAnswer(resultSet.getInt("answerId"), application);
					while(resultSetAnswer.next())
						resultSetUser = profile.fetchUser(resultSetAnswer.getInt("answeredBy"), application);
			%>
			<h3><%=resultSetQuestion.getString("questionDesc")%></h3>
			<%
				
			%>
		</div>
		<div class="card-body">
			<p>
				<span class="fas fa-user-circle"></span>
				<%
				if(resultSetUser != null){
					while (resultSetUser.next()) {
				%>
				<%=resultSetUser.getString("fName") + " " + resultSetUser.getString("lName") + ", "
								+ resultSetUser.getString("userDesc")%>
				<%
					}
				}
				%>
			</p>
			<p class="para" id="para1">
				<%
				if(resultSetAnswer != null){
					while (resultSetAnswer.next()) {
				%>
				<%=resultSetAnswer.getString("answerDesc")%>
				<%
					}
				
				}
				%>
			</p>
		</div>
		<div class="card-footer">
			<nav class="navbar navbar-expand-sm bg-light navbar-light">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#"><span><%=resultSet.getInt("views")%>
								views</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><span
							class="fas fa-arrow-up"> Upvote <%=resultSet.getInt("upvote")%></span></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><span
							class="fas fa-sync"> Shares <%=resultSet.getInt("share")%></span></a></li>
				</ul>
			</nav>
			<p>
				<span class="fas fa-user-circle"></span> <input type="text"
					name="comment" class="comment-class" placeholder="Add a comment...">
			</p>
		</div>
	</div>
	<%
				}
		i++;
			}
		} else {
			out.println("Not executing...");
		}
	%>


</body>
</html>