
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ibm.training.qpa.Answers"%>
<%@page import="com.ibm.training.qpa.Question"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<link href="new.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">


</head>
<body>
	<%
	session.invalidate();
%>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#myNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="home.html"><span
			class="fab fa-quora"></span></a>
		<div class="collapse navbar-collapse" id="myNavbar">
			<form class="form-inline" action="#">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
				<button class="btn btn-success" type="submit">Search</button>
			</form>
			<div class="right-side">
				<ul class="navbar-nav text-right">

					<li class="nav-item"><a class="nav-link loginBtn"
						id="loginBtn" href="" data-toggle="modal" data-target="#myModal"><i
							class="fas fa-sign-in-alt"></i></i> Log In</a></li>

					<li class="nav-item"><a class="nav-link signupBtn"
						id="signupBtn" href="" data-toggle="modal"
						data-target="#sign_up_Modal"><i class="fas fa-sign-up-alt"></i></i>
							Sign Up</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<br>
	<%
	Question question = new Question();
	Answers answers = new Answers();
	ResultSet resultSetQuestion = null;
	ResultSet resultSetAnswer = null;
	
	int questionId = 0;
	if(request.getParameter("questionId") == null){
		if(request.getAttribute("questionId") != null)
			questionId = Integer.parseInt(String.valueOf(request.getAttribute("questionId")));
	} else {
		questionId = Integer.parseInt(request.getParameter("questionId"));
	}
	if(questionId != 0){
		resultSetQuestion = question.fetchQuestion(questionId, application);
		resultSetAnswer = answers.fetchAnswerTopicWise(questionId, application);
	}
	%>
	<%if(questionId != 0){ %>
	<div class="card bg-light text-dark">
		<div class="card-body">
			<%
				if (resultSetQuestion != null) {
						while (resultSetQuestion.next()) {
			%>

			<h1>
				<%=resultSetQuestion.getString("questionDesc")%>
			</h1>
			<%
				}
					}
			%>
			<%
				if (resultSetAnswer != null) {
						while (resultSetAnswer.next()) {
			%>

			<p><%=resultSetAnswer.getString("answerDesc")%></p>
			<%
				}
					}
			%>
		</div>
	</div>
	<%} %>
	</div>
	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<%if(request.getAttribute("notValid") != null) {%>
					<%=request.getAttribute("notValid") %>
					<%} %>
					<p id="blank"></p>
					<form class="form-container" action="user"
						onsubmit="return validateForm();" method="post">
						<h1>Log In</h1>
						<input type="hidden" name="questionId"
							value="<%=request.getParameter("questionId")%>">
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" name="email" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Enter email">

						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" name="password" class="form-control"
								id="exampleInputPassword1" placeholder="Password">
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input"
								id="exampleCheck1"> <label class="form-check-label"
								for="exampleCheck1">Remember me</label>
						</div>
						<br>
						<center>
							<button type="submit" class="btn btn-success btn-block">Submit</button>
						</center>
						<br>
						<center>
							<span id="signup"><a href="#" id="sign_up"
								data-toggle="modal" data-target="#sign_up_Modal"> Not a
									member yet? signup</a></span>
						</center>

					</form>





					<!-- form end -->
				</div>
			</div>
		</div>
	</div>
	<div id="sign_up_Modal" class="modal fade" style="">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<form class="form-container" action="register" method="post">
					<div class="modal-body">

						<h1>Sign Up</h1>

						<div class="form-group">
							<label for="first_name">First Name</label> <input type="text"
								class="form-control" name="fname" id="fname"
								aria-describedby="f_name" placeholder="First Name" required>

						</div>
						<div class="form-group">
							<label for="last_name">Last Name</label> <input type="text"
								class="form-control" name="lname" id="lname"
								placeholder="last name" required>
						</div>
						<label for="Email_add">Email address</label> <input type="email"
							class="form-control" name="email" id="email"
							aria-describedby="emailHelp" placeholder="Enter email" required>
						<p id="emailCheck" style="display: none;"></p>
						<div class="form-group">
							<label for="password_s">Password</label> <input type="password"
								class="form-control" name="password" id="password"
								aria-describedby="password" placeholder="Password" required>
						</div>
						<div class="form-group">
							<label for="password_c">Confirm Password</label> <input
								type="password" class="form-control" name="conpass" id="conpass"
								aria-describedby="password_c" placeholder="Password" required>
								<span id="message"></span>
						</div>

						<button type="submit" class="btn btn-success btn-block">Submit</button>
					</div>



				</form>

				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
				<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
				<script
					src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
				<script src="js/login_effect.js"></script>
</body>
</html>
