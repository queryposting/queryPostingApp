<%@page import="com.ibm.training.qpa.Comments"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ibm.training.qpa.AllQuestions"%>
<%@page import="com.ibm.training.qpa.Answers"%>
<%@page import="com.ibm.training.qpa.UserProfile"%>
<%@page import="com.ibm.training.qpa.Question"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>

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
		Comments comments = new Comments();

		ResultSet resultSetQuestion = null;
		ResultSet resultSetUser = null;
		ResultSet resultSetAnswer = null;
		ResultSet resultSetAllQuestion = null;
		ResultSet resultComment = null;
	%>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#myNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="home.jsp"><span class="fab fa-quora"></span></a>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="navbar-nav">
				<li class="nav-item active" id="home"><a class="nav-link"
					href="home.jsp"><i class="fas fa-home"></i> Home</a></li>
				<li class="nav-item" id="ans"><a class="nav-link"
					href="answer1.jsp" id="answerId" target="_blank"><i
						class="fas fa-edit"></i> Answer</a></li>
				<li class="nav-item" id="space"><a class="nav-link"
					href="space.jsp" id="spaceId"><i class="fas fa-users"></i>
						Spaces</a></li>
				<li class="nav-item" id="notify"><a class="nav-link" href="#"><i
						class="fas fa-bell"></i> Notifications</a></li>
				</li>
			</ul>
			<form class="form-inline" action="search" oninput="fetchData();">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					id="search" data-toggle="dropdown" data-target="#showData">

				<!-- <button class="btn btn-success" type="submit">Search</button> -->
			</form>
			<div class="right-side">
				<ul class="navbar-nav text-right">
					<li class="nav-item" id="profile"><a class="nav-link"
						href="quoraprofile.jsp" id="profileId" target="_blank"><i
							class="fas fa-user"></i> Profile</a></li>
					<li class="nav-item" id="cont"><a class="nav-link"
						href="QuoraContentPage.jsp" id="contentId" target="_blank"><i
							class="fas fa-file-alt"></i> Your Content</a></li>
					<li class="nav-item"><a class="nav-link" href="loginAndSignUp.jsp"><i
							class="fas fa-sign-out-alt"></i> Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<!-- <div id="showData"></div> -->
	<br>
	<br>
	<div class="dropdown">
		<div class="dropdown-menu" aria-labelledby="search" id="showData">
			<!-- <a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a> -->
		</div>
	</div>
	<br>
	<div class="container-fluid text-center" id="externalContent">
		<div class="row content">
			<!-- <div class="col-sm-2 sidenav">
				<p>
					<a href="home.jsp"><span class="fas fa-sticky-note"></span>
						Feed</a>
				</p>
				<p>
					<a href="bollywood.jsp" id="bollywoodId" target="section"><span
						class="fas fa-film"></span> Bollywood Actors and Actresses</a>
				</p>
				<p>
					<a href="science.jsp" id="scienceId" target="section"><span
						class="fas fa-flask"></span> Science and Engineering</a>
				</p>
				<p>
					<a href="politics.jsp" id="politicsId" target="section"><span
						class="fa fa-handshake"></span> Politics</a>
				</p>
				<p>
					<a href="sports.jsp" id="sportsId" target="section"><span
						class="fas fa-volleyball-ball"></span> Sports</a>
				</p>
			</div> -->

			<div class="col-sm-7 text-left" id="includedContent" style="margin-left:20%;">
				<br>

				<%-- <div class="card">
					<div class="card-header">
						<p>
							<span class="fas fa-user-circle"></span>
							<%
								resultSetUser = profile.fetchUser(Integer.parseInt(String.valueOf(session.getAttribute("userId"))),
										application);
								while (resultSetUser.next()) {
							%>
							<%=" " + resultSetUser.getString("fName") + " " + resultSetUser.getString("lName")%>
							<%
								}
							%>
						</p>
						<a href="" data-toggle="modal" id="question"
							data-target="#myModal">What is your question or link?</a> <br>
					</div>
				</div> --%>
				<form action="insert" method="post">
					<!-- The Modal -->
					<div class="modal fade" id="myModal">
						<div class="modal-dialog modal-dialog-centered modal-lg">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<!-- <nav class="navbar navbar-expand-sm bg-light navbar-light"> -->
									<ul class="nav nav-pills" role="tablist">
										<li class="nav-item active"><a class="nav-link"
											data-toggle="pill" href="#addQuestion"> Add Question</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="pill" href="#shareLink"> Share Link</a></li>
									</ul>
									<!-- </nav> -->
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<!-- Tab panes -->
									<div class="tab-content">
										<div id="addQuestion" class="container tab-pane active">

											<div class="row">
												<%-- <div class="col-sm-2">

												<span class="fas fa-user-circle"></span><%=" " + session.getAttribute("userName") + " "%>

											</div> --%>
												<!-- <div class="col-sm-2">
												<h6>Post as : </h6>
											</div> -->
												<div class="col-sm-4">
													<div class="form-group">
														<label for="type">Post as : </label> <select name="type"
															class="form-control" id="type">
															<option value="1">Public</option>
															<option value="2">Anonymous</option>
															<option value="3">Limited</option>
														</select>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label for="topic">Topic : </label> <select name="topic"
															class="form-control" id="topic">
															<option value="1">Bollywood</option>
															<option value="2">Science</option>
															<option value="3">Politics</option>
															<option value="3">Sports</option>
														</select>
													</div>
												</div>
											</div>
											<div class="form-group">
												<textarea class="form-control" rows="3" id="question"
													placeholder="Start your question with 'What','How','Why',etc."
													name="question"></textarea>
											</div>
										</div>
										<div id="shareLink" class="container tab-pane fade">
											<br>

										</div>
									</div>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">Add
										Question</button>
								</div>

							</div>
						</div>
					</div>
				</form>
				<br>
				<%
					resultSetAllQuestion = allQuestions.fetchQuestion(Integer.parseInt(String.valueOf(session.getAttribute("userId"))), application);

					/* while (resultSetAllQuestion.next()) { */ 
					int c = 1;
					while (resultSetAllQuestion.next()) {
						Calendar calendar = new GregorianCalendar();
						Date utilDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.0")
								.parse(String.valueOf(resultSetAllQuestion.getString("dateQuestioned")));
						Date currentDate = new Date();
						calendar.setTime(utilDate);
						Date quesDate = calendar.getTime();
						calendar.setTime(currentDate);
						Date currDate = calendar.getTime();
						if (quesDate.getYear() == currDate.getYear()) {
							if (quesDate.getMonth() == currDate.getMonth()) {
								if (quesDate.getDate() == currDate.getDate()) {
				%>
				<div class="card" id="card">
					<div class="card-header">
					<p>
							<span class="fas fa-user-circle"></span>
							<%
								resultSetUser = profile.fetchUser(Integer.parseInt(String.valueOf(session.getAttribute("userId"))),
										application);
								while (resultSetUser.next()) {
							%>
							<%=" " + resultSetUser.getString("fName") + " " + resultSetUser.getString("lName")%>
							<%
								}
							%>
						</p>
						<h3><%=resultSetAllQuestion.getString("questionDesc")%></h3>
					</div>
					<div class="card-body">
					
						<h6>
							Posted
							<%
								if (quesDate.getHours() == currDate.getHours()) {
									if (quesDate.getMinutes() == currDate.getMinutes()) {
										if (quesDate.getSeconds() == currDate.getSeconds()) {
							%>
							just now
							<%
								} else {
							%>
							<%=currDate.getSeconds() - quesDate.getSeconds()%>
							seconds ago
							<%
								}
								} else {
							%>
							<%=currDate.getMinutes() - quesDate.getMinutes()%>
							minutes ago
							<%
								}
								} else {
							%>
							<%=currDate.getHours() - quesDate.getHours()%>
							hours ago
							<%
								}
							%>
							&nbsp;&nbsp;&nbsp;No answer yet
						</h6>
						
					</div>
					<div class="card-footer">
						<nav class="navbar navbar-expand-sm bg-light navbar-light">
							<ul class="navbar-nav">
								<li class="nav-item "><a class="ans nav-link" href="#" onclick="openEditor(<%=c %>)" id="ans<%=c%>"><span class="fas fa-edit"></span>
										Answer</a></li>
							</ul>
						</nav>
						<input type="hidden" id="hiddenVal<%=c%>" value="1"/>
						
						<form action="insertans" id="ansForm<%=c%>" method="post">
						<input type="hidden" name="questionId" id="questionId" value="<%=resultSetAllQuestion.getInt("questionId")%>">
						<input type="hidden" name="postedBy" id="postedBy" value="<%=resultSetAllQuestion.getInt("postedBy")%>">
						<div id="togDiv<%=c%>" style="display: none;">
							<textarea name="content" id="editor<%=c%>"></textarea><br>
							<button type="submit" class="btn btn-primary">Submit
								Answer</button>
						</div>
						</form>
						
					</div>
				</div>
				<%
					}
							}
						}
					c++;
					}
					/* } */
				%>
				<br>
				<%
					//out.println("views: "+resultSet.first());
					resultSet.beforeFirst();
					int i = 1;
					
					if (resultSet != null) {
						while (resultSet.next()) {

							resultSetQuestion = question.fetchQuestion(resultSet.getInt("questionId"), application);
							resultSetUser = profile.fetchUser(resultSet.getInt("answeredBy"), application);
							resultSetAnswer = answers.fetchAnswer(resultSet.getInt("answerId"), application);
				%>
				<div id="unHide<%=i %>" style="display: none;">
					<p>You've hidden this story<a href="#" onclick="unHide(<%=i%>,<%=resultSet.getInt("contentId")%>)"> Undo</a></p>
				</div>
				<div class="card" id="card<%=i%>">
					<span class="pull-right clickable close-icon" id="closeIcon<%=i %>" onclick="toggleContent(<%=i%>,<%=resultSet.getInt("contentId")%>)"
						data-effect="fadeOut"><i class="fas fa-times"></i></span>
					<div class="card-header">
						<%
							while (resultSetQuestion.next()) {
						%>
						<h3><%=resultSetQuestion.getString("questionDesc")%></h3>
						<%
							}
						%>
					</div>
					<div class="card-body">
						<p>
							<span class="fas fa-user-circle"></span>
							<%
								while (resultSetUser.next()) {
							%>
							<%=resultSetUser.getString("fName") + " " + resultSetUser.getString("lName") + ", "
								+ resultSetUser.getString("userDesc")%>
							<%
								}
							%>
						</p>
						<%
							while (resultSetAnswer.next()) {
										SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MMM dd, yyyy");
										//SimpleDateFormat timeFormat = new SimpleDateFormat("HH : mm").parse(resultSetAnswer.getString("answerDesc"));
										Date utilDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.0")
												.parse(String.valueOf(resultSetAnswer.getString("dateAnswered")));
										//String ansDate = simpleDateFormat.format(resultSetAnswer.getDate("dateAnswered"));
										//String ansTime = timeFormat.format(utilDate);
										//System.out.println("date and time : " + sqlDate.getTime());
						%>
						<p class="para" id="para1">
							Answered on
							<%=utilDate%>
						</p>
						<p class="para" id="para1">

							<%=resultSetAnswer.getString("answerDesc")%>
							<%
								}
							%>
						</p>
					</div>
					<div class="card-footer">
						<form action="#" method="post" onload="postComment(<%=i%>)">
							<p>
								<span class="fas fa-user-circle"></span>
								<input type="hidden" name="questionId" id="questionId<%=i %>" value="<%=resultSet.getInt("questionId")%>"> 
								<input type="text"
									name="comment" class="comment-class" id="comment<%=i%>"
									placeholder="Add a comment..." oninput="generateButton(<%=i%>)">
								<button type="button" id="btnComment<%=i%>"
									class="btn btn-primary" style="display: none;" onclick="postComment(<%=i%>)">Answer
									</button>

							</p>
						</form>
						<%-- <%
							resultComment = comments.fetchComment(resultSet.getInt("questionId"), application);
									if (resultComment != null) {
										while (resultComment.next()) {
											resultSetUser = profile.fetchUser(resultComment.getInt("commentedBy"), application);
						%> --%>
						<div id="commDiv<%=i%>">
							<%-- <p>
							<span class="fas fa-user-circle"></span>
							<%
								while (resultSetUser.next()) {
							%>
							<%=resultSetUser.getString("fName") + " " + resultSetUser.getString("lName") + ", "
								+ resultSetUser.getString("userDesc")%>
							<%
								}
							%>
						</p> --%>
						<%-- <p>
							Posted <%=resultComment.getString("dateCommented") %>
						</p> --%>
						<%-- <p id="comm<%=i%>">
							<%=resultComment.getString("comment") %>
						</p> --%>
						</div>
						<%-- <%
							}
									}
						%> --%>

					</div>
				</div>
				<br>
				<%
					i++;
						}
					} else {
						out.println("Not executing...");
					}
				%>
			</div>

			<!-- <div class="col-sm-2 sidenav">
				<div class="well">
					<img src="image/car.gif">
				</div>
				<div class="well">
					<img src="image/lemonWater.gif">
				</div>
			</div> -->
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-bottom">
		<p id="footerId">
			<marquee direction="left" width="100%">Copyright@Query?
				Created by Ganesh, Manikanta, Apurva, Venketesh & Hussham</marquee>
		</p>
	</nav>
</body>
</html>

