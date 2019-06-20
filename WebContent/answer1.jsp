<%@page import="com.ibm.training.qpa.Question"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Answer Page</title>
</head>
<link rel="stylesheet" href="css/answer1.css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="js/answer1.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<script src="js/ckeditor.js"></script>

<body>
	<br>
	<br>
	<br>
	<%
		Question question = new Question();
		int questionCount = question.fetchQuestionCount(application);
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
			</ul>
			<form class="form-inline" action="#">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
				<button class="btn btn-success" type="submit">Search</button>
			</form>
			<div class="right-side">
				<ul class="navbar-nav text-right">
					<li class="nav-item" id="profile"><a class="nav-link"
						href="quoraprofile.jsp" id="profileId" target="_blank"><i
							class="fas fa-user"></i> Profile</a></li>
					<li class="nav-item" id="cont"><a class="nav-link"
						href="QuoraContentPage.jsp" id="contentId" target="_blank"><i
							class="fas fa-file-alt"></i> Your Content</a></li>
					<li class="nav-item"><a class="nav-link" href="index.jsp"><i
							class="fas fa-sign-out-alt"></i> Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid bg-light" id="writeMain">
		<div class="row ">
			<div class="col-sm-4  border-0 rounded" id="questionsMenu">
				<div class="card-body menuCard rounded ">
					<div class="card-header border-0">Questions</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><a href="#">Questions for you
								&nbsp;&nbsp;<span class="badge badge-primary badge-pill"> 
								
								
								<%=questionCount %>
								</span>
						</a></li>
						<!-- <li class="list-group-item"><a href="#">Answer
								Requests&nbsp;&nbsp;<span class="badge badge-primary badge-pill">&nbsp;10</span>
						</a></li>
						<li class="list-group-item"><a href="#">Answer
								later&nbsp;&nbsp;<span class="badge badge-primary badge-pill">&nbsp;9</span>
						</a></li>
						<li class="list-group-item"><a href="#">Drafts&nbsp;&nbsp;</a><span
							class="badge badge-primary badge-pill">&nbsp;3</span></li> -->
					</ul>
				</div>
			</div>
			<div class="col-sm-6 question_wrapper_div rounded">

				<div class="container">
					<div class="card-header rounded" id="queHeaderHelp">
						<i class="fas fa-question-circle"> Requested from Quora</i>
					</div>
				</div>

				<div class="container  questionWrapper">
					<%
						ResultSet rs = question.fetchAllUnansweredQuestion(application);
						//ResultSet rs2 = (ResultSet) session.getAttribute("result");

						int i = 1;

						if (rs == null) {
							System.out.println("rs is null in jsp");
						}
						//System.out.println("rs : " + rs.first());

						while (rs.next()) {
					%>
					<div class="container" style="padding-top: 2%;'">

						<div id="feed<%=i%>" class="feed1">
							<div id="cardDiv<%=i%>" class="" style="border-radius: 50%;">
								<div class="card" style="width: auto;">
									<div class="card-body" style="">
										<div id="feed_start_names">
											<div class="ui_story_card_header">
												<div class="reason_main">
													<div class="reason_text_and_icon row ">
														<div class="question_added_div" id="">
															<span class="question_added_text " style="">Question
																Added</span>
														</div>
														<%-- <div class="bullet_div">
															<span class="bullets_text">.</span>
														</div>
														<div class="topic_list_item">
															<a href="#" class="topic_name_text_inside_span"> <%=rs.getString("topic")%>
															</a>
														</div>
														<div class="bullet_div ">
															<span class="bullets_text">.</span>
														</div> --%>
														<div class="interested_topic_text" id="">
															<span class="question_added_text ">Topic that
																might you like</span>
														</div>
														<div class="hide_story_div" id="">
															<button id="cross" type="button" class="btn">
																<i class="fas fa-times"></i>
															</button>
														</div>
													</div>
													<!--  div for first card heading -->
													<div class="question_wrapper_div"
														id="questionWrapper_id<%=i%>">
														<a href="#"><span class="ui_content_question">
																<span class="question text-dark font-weight-bold"
																id="ui_question_text"> <%
 	String questionPassToAfter = rs.getString("questionDesc");
 		out.print(questionPassToAfter);
 		System.out.println(questionPassToAfter);
 		request.setAttribute("questionPassToAfter", questionPassToAfter);
 %> <%
 	int questionId = rs.getInt("questionId");
 		int postedById = rs.getInt("postedBy");

 		/* int answeredBy =(int) session.getAttribute("user_id"); */
 		/* int answeredBy = 130; */

 		java.sql.Date date = rs.getDate("dateQuestioned");

 		/* session.setAttribute("questionId", questionId);
 		session.setAttribute("postedById", postedById);
 		session.setAttribute("dateQuestioned", date);
 		session.setAttribute("username", "Ganesh Singh"); */
 %>


															</span>
														</span> </a>
													</div>
													<!-- question wrapper -->
													<div class="question_footer_content_wrapper"
														id="question_footer_content_wrapper_id<%=i%>">
														<!-- <div class="quetion_footer_text_answer_and_time">
														<a href="#" class="link_for_answer_count"
															id="link_for_que_footer_answer1"></a> <span
															class="question_when_asked text-muted">Last
															followed 87m ago</span>
													</div> -->
													</div>
													<!-- question footer -->
													<div class="action_bar_for_questions row" id=""
														style="margin-top: 3%;">
														<div class="answer_div col-2">
															<div class=" answer_button_inner " id="">
																<div class="answer_button_icon_wrapper">
																	<div class="answer_btn_div_inner" id="answerBtn<%=i%>">
																		<a href="#" class="link_for_answer_button"
																			onclick="openEditor(<%=i%>)"> <span
																			class="answer_button_icon"> <i
																				class="fas fa-pen">Answer</i></span></a>
																	</div>
																</div>
															</div>
														</div>
														<!-- answer div -->
														<%-- <div class="ignore_div col-3">
															<div class=" ignore_button_inner " id="">
																<div class="ignore_button_icon_wrapper">
																	<div class="ignore_btn_div_inner" id="ignore<%=i%>">
																		<a href="#" class="link_for_ignore_button"> <span
																			class="ignore_button_icon"> <i
																				class="fas fa-quidditch"> Ignore </i></span>
																		</a>
																	</div>
																</div>
															</div>
														</div> --%>
														<!--  ignore div -->
														 <%-- <div class="follow_div col-2" style="margin-left: -5%;">
															<div class=" follow_button_inner " id="">
																<div class="follow_button_icon_wrapper">
																	<div class="follow_btn_div_inner" id="followBtn<%=i%>">
																		<a href="#" class="link_for_follow_button"> <span
																			class="follow_button_icon"> <i
																				class="fas fa-thumbs-up">Follow</i></span></a>
																	</div>
																</div>
															</div>
														</div>  --%>
														<!-- follow div -->
														<!--  <div class="more_div col" style="margin-left: 28%;">
                                             <div class=" more_button_inner " id="">
                                             	<div class="more_button_icon_wrapper">
                                             		<div class="more_btn_div_inner" id="answerBtn1">
                                             			<a href="#" class="link_for_more_button"> <span
                                             				class="more_button_icon"> <i
                                             					class="fas fa-ellipsis-h"> </i></span></a>
                                             
                                             		</div>
                                             	</div>
                                             </div>
                                             
                                             </div> -->
													</div>
													<!-- action bar end -->
												</div>
											</div>
										</div>
									</div>
									<div id="text_editor_window_<%=i%>" class="xyz" style="">
										<div class="answer_editor_wrapper container">
											<form method="get" action="afteranswerservlet">

												<div class="div form-group">
													<div class="editor form-group">
														<%-- <div id="editor<%=i%>" class="editor_div_inner" style=""></div> --%>
														<div style="" class="answer_submit_btn"
															id="submitBtn<%=i%>">
															<input type="hidden" name="questionId" value="<%=rs.getInt("questionId")%>">
															<input type="hidden" name="postedBy" value="<%=rs.getInt("postedBy")%>">
															<input type="hidden" name="date" value="<%=rs.getString("dateQuestioned")%>">
															<textarea class="form-control" rows="5" cols="90"
																name="answerData"></textarea>
															<br>
															<button id="saveData<%=i%>" class="btn btn-primary"
																style="">Submit</button>
														</div>
													</div>
												</div>

											</form>




											<%-- <form method="get"  action="afteranswerservlet">
										
										
											<div class="div form-group">
												<div class="editor form-group">
													<div id="editor<%=i%>" class="editor_div_inner" style=""></div>
													<div style="" class="answer_submit_btn"
														id="submitBtn<%=i%>">
														<button id="saveData1"  class="btn btn-primary" 
															style="">Submit</button>
													</div>
												</div>
											</div> 
											
											
											<input type="hidden" value=" " name=" " />
											<input type="hidden" id="hiddenVal<%=i%>" value="1" name="ansdata"/>
												<div id="togDiv<%=i%>" style="display: none;">
													<textarea name="content" id="editor<%=i%>"></textarea>
													<br>
													<button type="submit" class="btn btn-primary">Submit
														Answer</button>
												</div>
											</form> --%>

											<%-- <div class="card-footer">
												<nav class="navbar navbar-expand-sm bg-light navbar-light">
													<ul class="navbar-nav">
														<li class="nav-item "><a class="ans nav-link"
															href="#" onclick="openEditor(<%=i%>)" id="ans<%=i%>"><span
																class="fas fa-edit"></span> Answer</a></li>
													</ul>
												</nav>
												<input type="hidden" id="hiddenVal<%=i%>" value="1" />

												<form action="afteranswerservlet" id="ansForm<%=i%>" method="post">
													<input type="hidden" name="questionId" id="questionId"
														value="<%=rs2.getInt("questionId")%>">
													<input type="hidden" name="postedBy" id="postedBy"
														value="<%=rs2.getInt("postedBy")%>">
													<div id="togDiv<%=i%>" style="display: none;">
														<textarea name="content" id="editor<%=i%>"></textarea>
														<br>
														
													</div>
													<button type="submit" class="btn btn-primary">Submit
															Answer</button>
												</form>

											</div> --%>

										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- feed 1 -->
					 <div class=" negative_feedback_wrapper container"
							id="negativeFeedbackWrapper<%=i%>" style="">
							<div class="card" style="width: 100%;">
								<div class="card-body">
									<div class="msg" style="">
										<h5 class="card-title ">You have hidden this story</h5>
									</div>
									<div class="link_for_undo" id="linkForUndo<%=i%>"
										style="margin-left: 90%;">
										<a href="#" id="negativeFeedbackUndo1"> Undo </a>
									</div>
								</div>
								<div id="reasons_Options container<%=i%>" class="border">
									<a href="#" class="list-group-item  downvote_link_hide_story"
										id="downvote_que_hide_story"> Downvote Question</a> <a
										href="#" class="list-group-item"> UnFollow International
										Cricket</a> <a href="#" class="list-group-item">Report</a>
								</div>
							</div>
						</div>
						<!-- negative_feedback_wrapper container -->
						<div class="ignore_que_div " id="ignoredQuestion<%=i%>" style="">
							<div class="card card_for_ignore" style="">
								<div class="card-text">You don't like this question</div>
								<div class="card-text">Ignoring questions helps to
									determine which question are relevant to you</div>
								<div class="undoAndDownvoteLink">
									<div>
										<a href="#" id="undoQuestionWrapper<%=i%>">Undo</a>
									</div>
									<div>
										<a href="#" id="downvote_que<%=i%>">Downvote</a>
									</div>
								</div>
							</div>
						</div>
						<!--  ignore_que_div -->
						<div class=" div_for_after_downvote " id="after_downvote<%=i%>"
							style="">
							<div class="card  card_after_downvote" style="">
								<div class="card-text">You downvoted this question</div>
								<div class="card-text">Downvoting low-quality content
									improves Quora for everyone.</div>
								<div class="undoDownvoteLink">
									<div>
										<a href="#" id="undoDownvote<%=i%>">Undo Downvote</a>
									</div>
									<div>
										<a href="#" type="" class=" " data-toggle="modal"
											data-target="#myModal">Report</a>
									</div>
								</div>
							</div>
						</div> 
						<!--  div_for_after_downvote -->
					</div>

					<%
						i++;
						}
					%>
				</div>

			</div>
		</div>

		<!-- </div> questionWrappeR
            <div class="container  questionWrapper">
            
            
            <div id="feed1"  class="feed1">
            <div id="cardDiv1" class="">
            <div class="card" style="width: auto;">
            <div class="card-body" style="">
            	<div id="feed_start_names">
            		<div class="ui_story_card_header">
            			<div class="reason_main">
            				<div class="reason_text_and_icon row ">
            					<div class="question_added_div" id="">
            						<span class="question_added_text " style="">Question
            							Added</span>
            					</div>
            					<div class="bullet_div">
            						<span class="bullets_text">.</span>
            					</div>
            					<div class="topic_list_item">
            						<a href="#" class="topic_name_text_inside_span">
            							Streaming Video Content </a>
            					</div>
            					<div class="bullet_div ">
            						<span class="bullets_text">.</span>
            					</div>
            					<div class="interested_topic_text" id="">
            						<span class="question_added_text ">Topic that might
            							you like</span>
            					</div>
            					<div class="hide_story_div" id="">
            						<span class="hide_story_div_text "><i class="fas fa-times" ></i></span>
            						<button id="cross" type="button" class="btn">
            							<i class="fas fa-times"></i>
            						</button>
            					</div>
            				</div>
            				 div for first card heading
            				<div class="question_wrapper_div" id="questionWrapper_id">
            					<a href="#"> <span class="ui_content_question">
            							<span class="question text-dark font-weight-bold"
            							id="ui_question_text"> Why is the ICC Cricket
            								World Cup not organized during the cooler months of the
            								year (like the 1987 edition) when the weather
            
            						</span>
            					</span>
            					</a>
            				</div>
            				question wrapper
            				<div class="question_footer_content_wrapper"
            					id="question_footer_content_wrapper_id">
            					<div class="quetion_footer_text_answer_and_time">
            						<a href="#" class="link_for_answer_count"
            							id="link_for_que_footer_answer">1 Answer</a> <span
            							class="question_when_asked text-muted">Last
            							followed 87m ago</span>
            					</div>
            				</div>
            				question footer
            
            				<div class="action_bar_for_questions row" id=""
            					style="margin-top: 3%;">
            
            					<div class="answer_div col-2">
            
            
            						<div class=" answer_button_inner " id="">
            							<div class="answer_button_icon_wrapper">
            								<div class="answer_btn_div_inner" id="answerBtn1">
            									<a href="#" class="link_for_answer_button"> <span
            										class="answer_button_icon"> <i
            											class="fas fa-pen">Answer</i></span></a>
            
            								</div>
            							</div>
            						</div>
            
            					</div>
            					answer div
            
            					<div class="ignore_div col-3">
            
            
            						<div class=" ignore_button_inner " id="">
            							<div class="ignore_button_icon_wrapper">
            								<div class="ignore_btn_div_inner" id="ignore1">
            									<a href="#" class="link_for_ignore_button" >
            										<span class="ignore_button_icon"> <i
            											class="fas fa-quidditch"> Ignore </i></span>
            									</a>
            
            								</div>
            							</div>
            						</div>
            
            					</div>  ignore div 
            					
            					<div class="follow_div col-2" style="margin-left: -5%;">
            
            
            						<div class=" follow_button_inner " id="">
            							<div class="follow_button_icon_wrapper">
            								<div class="follow_btn_div_inner" id="answerBtn1">
            									<a href="#" class="link_for_follow_button"> <span
            										class="follow_button_icon"> <i
            											class="fas fa-thumbs-up">Follow</i></span></a>
            
            								</div>
            							</div>
            						</div>
            
            					</div>   follow div
            					
            					
            					<div class="more_div col" style="margin-left: 28%;">
            
            
            						<div class=" more_button_inner " id="">
            							<div class="more_button_icon_wrapper">
            								<div class="more_btn_div_inner" id="answerBtn1">
            									<a href="#" class="link_for_more_button"> <span
            										class="more_button_icon"> <i
            											class="fas fa-ellipsis-h"> </i></span></a>
            
            								</div>
            							</div>
            						</div>
            
            					</div>
            
            
            				</div>
            				action bar end
            
            
            			</div>
            		</div>
            	</div>
            </div>
            
            
            <div id="text_editor_window" class="abc1" style="">
            	<div class="answer_editor_wrapper container">
            		<form method="get" action="AfterAnswerJsp.jsp">
            			<div class="div form-group">
            				<div class="editor form-group">
            					<div id="editor" class="editor_div_inner" style=""></div>
            					<div style="" class="answer_submit_btn" id="submitBtn">
            						<button id="saveData" class="btn btn-primary" style="">Submit</button>
            					</div>
            				</div>
            			</div>
            		</form>
            	</div>
            </div>
            
            
            
            
            
            </div>
            </div>
            </div>  feed 1
            
            
            <div class=" negative_feedback_wrapper "
            id="negativeFeedbackWrapper" style="">
            <div class="card" style="width: 100%;">
            <div class="card-body">
            <div class="msg" style="">
            	<h5 class="card-title ">You have hidden this story</h5>
            </div>
            <div class="link_for_undo" id="linkForUndo"
            	style="margin-left: 90%;">
            	<a href="#" id="negativeFeedbackUndo"> Undo 
            </div>
            </div>
            <div id="reasons_Options " class="border">
            <a href="#" class="list-group-item  downvote_link_hide_story"
            	id="downvote_que_hide_story">Downvote Question</a> <a href="#"
            	class="list-group-item"> UnFollow International Cricket</a> <a
            	href="#" class="list-group-item">Report</a>
            </div>
            </div>
            </div>
            negative_feedback_wrapper container
            
            
            <div class="ignore_que_div " id="ignoredQuestion" style="">
            <div class="card card_for_ignore" style="">
            <div class="card-text">You don't like this question</div>
            <div class="card-text">Ignoring questions helps to
            determine which question are relevant to you</div>
            <div class="undoAndDownvoteLink">
            <div>
            	<a href="#" id="undoQuestionWrapper">Undo</a>
            </div>
            <div>
            	<a href="#" id="downvote_que">Downvote</a>
            </div>
            </div>
            </div>
            </div>
            ignore_que_div
            
            
            <div class=" div_for_after_downvote " id="after_downvote"
            style="">
            <div class="card  card_after_downvote" style="">
            <div class="card-text">You downvoted this question</div>
            <div class="card-text">Downvoting low-quality content
            improves Quora for everyone.</div>
            <div class="undoDownvoteLink">
            <div>
            	<a href="#" id="undoDownvote">Undo Downvote</a>
            </div>
            <div>
            	<a href="#" type="" class=" " data-toggle="modal"
            		data-target="#myModal">Report</a>
            </div>
            </div>
            </div>
            
            
            </div>  div_for_after_downvote
            
            
            
            
            </div> questionWrappe RRRR
            -->
	</div>
	<!-- question_wrapper_div  1-->
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">Report</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<h3>Report Question</h3>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio1" name="customRadio"
							class="custom-control-input"> <label
							class="custom-control-label" for="customRadio1">Harassment</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio2" name="customRadio"
							class="custom-control-input"> <label
							class="custom-control-label" for="customRadio2">Spam</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio3" name="customRadio"
							class="custom-control-input"> <label
							class="custom-control-label" for="customRadio3">Insincere</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio4" name="customRadio"
							class="custom-control-input"> <label
							class="custom-control-label" for="customRadio4">Poorly
							Written </label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio5" name="customRadio"
							class="custom-control-input"> <label
							class="custom-control-label" for="customRadio5">Incorrect
							Topics </label>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-primary" data-dismiss="modal">Submit</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>