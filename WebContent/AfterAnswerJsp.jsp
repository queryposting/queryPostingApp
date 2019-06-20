<%@page import="com.ibm.training.qpa.Question"%>
<%@page import="com.ibm.training.qpa.UserProfile"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/afteranswerjsp.css">

<script type="text/javascript" src="js/afteranswerjsp.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<meta charset="ISO-8859-1">

<title></title>
</head>
<body>

	<div class="container-fluid">

		<div class="container">

			<div class="card lg card_for_comment_content_css"
				style="max-width: 70rem; margin-left: 10%; margin-right: 10%; border: 1 px solid black;">
				<div class="card-header border-success bg-transparent">
					<h2>
						<%
							String txt = request.getParameter("questionId");
							Question question = new Question();
							ResultSet resultSet = question.fetchQuestion(Integer.parseInt(request.getParameter("questionId")), application);
							while(resultSet.next()){
						%>
						<%=resultSet.getString("questionDesc") %>
						<%} %>
					</h2>
				</div>
				<div class="author_header_div row border-success"
					style="padding: 3%; margin-left: 1%">
					<div class="autor_profile_image  border-rounded">

						<div class="src_of_image border-success"
							style="height: 50px; width: 50px; border: 1px solid black; border-radius: 50%;">
							<img alt="" src="image/avatar.png"
								style="height: 100%; width: 100%">

						</div>
					</div>

					<div class="author_name_div  border-success"
						style="margin-left: 2%;">

						<span class="autor_name"> <%-- <%
 					     out.println(session.getAttribute("username"));
						
					 %> --%>
					 <%
					 			UserProfile profile = new UserProfile();
								ResultSet resultSetUser = profile.fetchUser(Integer.parseInt(String.valueOf(session.getAttribute("userId"))),
										application);
								while (resultSetUser.next()) {
							%>
							<%=" " + resultSetUser.getString("fName") + " " + resultSetUser.getString("lName")%>
							<%
								}
								//System.out.println("before question link...");
							%>
						</span> <span class="autor_profile_info"></span>
					</div>

				</div>
				<div class="autor_answer_div row border-success" style="">

					<div class="card_text_div"
						style="padding-bottom: 2%; padding-left: 5%; padding-right: 3%; padding-top: 1%; margin-left: 2%">

						<p class="card-text">
							<%
								out.println(request.getParameter("answerData"));
							%>
						</p>

					</div>

				</div>
				<div class="how_many_views" id="">
					<!-- <span class="count_for_views text-muted" id=""
						style="padding-left: 5%">3 Views</span>
					 -->
				</div>

				<!-- div for answer operations -->
				<div class="for_answer_operations  row border-success"
					style="padding-top: 1%; padding-right: 5%; padding-left: 5%; padding-bottom: 2%;">

					<div class="div_for_upvotes_shares col" style="float: left;">

						<div class="row">

							<div class="for_count_upvotes border-success col-md-5"
								style="float: left;">

								<!-- <span class="count_upvotes text-muted">10 Upvotes</span> -->
							</div>

							<div class="for_shares border-success col-md-4" style="">

								<!-- <span class="count_shares">10 Shares</span> -->
							</div>

						</div>

					</div>

					<div class="for_sharing_and_more col"
						style="float: right; margin-left: 40%;">

						<div class="row">


							<div class="col-md-5" style="">

								<!-- <span class="count_shares">10 Shares</span> -->
							</div>

							<div class="for_more_option border-success col-md-5" style="">

								<!-- <span class="count_shares">More</span> -->

							</div>
						</div>
					</div>
				</div>
				<div class="card-footer bg-transparent border-success"
					id="div_for_card_footer">
					<form action="" method="get">

						<div class="input-group">
							<div class="input-group-prepend" style="">
								<div>
									<a class="user_profile_link" href="#"> <span
										class="input-group-text">
											<div>
												<img alt="" src="image/avatar.png"
													style="height: 50px; width: 50px;">
											</div>
									</span>


									</a>
								</div>
							</div>
							<form method="get" action="commentservlet">
								<input type="text" id="comments" class="form-control"
									aria-label="With textarea" name="comment_value"></input>
								<button type="button" value="Submit" id="btn_for_comment"
									 class="btn btn-light"> Comment </button>
							</form>
						</div>



					</form>

					<div class="container_for_appending_comments container border"
						id="comm_cont">
						<!-- for dispaying comments -->
						<!-- 	<div class="row  border border-danger"
							style="padding: 1%; margin: 2%;">

							<div class="profile_image_div_comments_inner"
								style="height: 50px; width: 50px;">

								<a href="#"> <img alt="profile" src="image/avatar.png"
									style="height: 50px; width: 50px;">
								</a>
							</div>

							<div class="" style="margin-left: 10%;">
								<span><h5>Ganesh Singh</h5></span>
								<div class="comment_meta_data">
									<span>1 Hour ago</span>
								</div>
							</div>

							<div class="container border border" style="margin-top: 2%;">
								<p id="display_message"></p>
							</div>

							<div class="container row border border "
								style="margin-top: 2%; margin-left: 0%;">
								<div class="div_for_reply_icon col">
									<span> <a href=#> <i class="fas fa-reply"> Reply</i></a>
									</span>
								</div>

								<div class="div_for_more_operations_on_comment col">
									<div class="more_div_inner" id="" style="float: right">

										<button id="myBtn" type="button" class="btn more_btn_inner"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">
											 <span><a href="#" class="card-link"><i
													class="fas fa-ellipsis-h"> </i> </a></span>
										</button>

										<div class="dropdown-menu border ">
											<a class="dropdown-item " href="#">Answer Anonymously </a> <a
												class="dropdown-item" href="#">Merge Questions</a> <a
												class="dropdown-item" href="#">View stats & Log</a> <a
												class="dropdown-item" href="#">Report</a> <a
												class="dropdown-item" href="#">Separated link</a>
										</div>

									</div>
								</div>
							</div>
						</div> 
						-->


					</div>
				</div>



			</div>
		</div>



	</div>
	

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript" src="js/afteranswerjsp.js"></script>

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
		
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script type="text/JavaScript">
		/* int i = 1;
		 function addCommentBox() {
		
		 var message = document.getElementById("comments").value;
		
		 var attachComments =' <div class="row  border border-danger"style="padding: 1%; margin: 2%;"> '+
		

		 +'	<div class="profile_image_div_comments_inner" style="height: 50px; width: 50px;"> '+
		 '   <a href="#"> <img alt="profile" src="image/avatar.png" style="height: 50px; width: 50px;"> </a> </div> '+
		 ' 	<div class="" style="margin-left: 10%;"> <span><h5>Ganesh Singh</h5></span> ' +
		
		 ' <div class="comment_meta_data"> <span>1 Hour ago</span> </div> </div> '+
		 ' <div class="container border border" style="margin-top: 2%;"> <p id="display_message"></p> </div> '+
		 ' <div class="container row border border "  style="margin-top: 2%; margin-left: 0%;"> '+
		
		 ' <div class="div_for_reply_icon col"> <span> <a href=#> <i class="fas fa-reply"> Reply</i></a> </span> </div>'+
		 ' <div class="div_for_more_operations_on_comment col"> <div class="more_div_inner" id="" style="float: right"> '+
		 ' <button id="myBtn" type="button" class="btn more_btn_inner" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'+
		 '  <span><a href="#" class="card-link"><i class="fas fa-ellipsis-h"> </i> </a></span> </button> '+
		 ' <div class="dropdown-menu border "> <a class="dropdown-item " href="#">Answer Anonymously </a> '+
		 '  <a class="dropdown-item" href="#">Merge Questions</a> <a class="dropdown-item" href="#">View stats & Log</a> '+
		 ' <a class="dropdown-item" href="#">Report</a> <a class="dropdown-item" href="#">Separated link</a> </div> '+
		 '</div> </div> </div> </div> ';
		 var addNew = document.createElement("div");
		
		
		 var div = attachComments;
		
		
		 document.getElementById('comm_cont').appendChild(div);
		
		 */
		/*  function addCommentBox() { 

			var display_message = document.getElementById("comments").value;

			display_message.innerHTML; */

			/* $(document).on('click',function(){ */

					var i = 1;
					
			
			
			$("#btn_for_comment")
					.click(
							function() {
								
								var display_message = document.getElementById("comments").value;
								
								console.log(display_message);

								
								 $.ajax({
							            url:'commentservlet?comment_data=' + display_message,
							            
							            type:'get',
							            cache:false,
							            success:function(data){
							            
							            	//alert(data);
							            	
							            },
							            error:function(){
							              //alert('error in AfterAnswerServlet 1');
							            }
							         }
							    );
								 
								 
								<%--  $.ajax({
									 url: "fetchcommenttime?comment_data=" + display_message +'&questionId='+<%= session.getAttribute("questionId") %>,
									 type: 'POST',
									
									 success: function(data1) {
									 alert(data1);
									 
									 },
									 error:function(){
										 alert('error in AfterAnswerServlet 2');
									 }
									 
									 }); --%>
								 
								 								 
								
								var attachComments = '  <div class="row  border border-danger"style="padding: 1%; margin: 2%;"> '
										

										/* +'	<div class="profile_image_div_comments_inner" style="height: 50px; width: 50px;"> '
										+ '   <a href="#"> <img alt="profile" src="image/avatar.png" style="height: 50px; width: 50px;"> </a> </div> '
										+ ' 	<div class="" style="margin-left: 10%;"> <span><h5></h5></span> '
										+

										' <div class="comment_meta_data"> <span>1 Hour ago</span> </div> </div> '
 */										+ ' <div class="container border border" style="margin-top: 2%;"> <p id="display_message'+i+'"></p> </div> '
										+ ' <div class="container row border border " style="margin-top: 2%; margin-left: 0%;"> '
										+

										/* ' <div class="div_for_reply_icon col"> <span> <a href=#> <i class="fas fa-reply"> Reply</i></a> </span> </div>'
										+ ' <div class="div_for_more_operations_on_comment col"> <div class="more_div_inner" id="" style="float: right"> '
										+ ' <button id="myBtn" type="button" class="btn more_btn_inner" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'
										+ '  <span><a href="#" class="card-link"><i class="fas fa-ellipsis-h"> </i> </a></span> </button> '
										+ ' <div class="dropdown-menu border "> <a class="dropdown-item " name="display_message'+i+' " href="deletecommentservlet?commentId='+display_message+i+' ">Delete Comment </a></div> '
										
										+ '</div> */' </div> </div> </div> ';
										
										
								$(".container_for_appending_comments").append(attachComments);
		 						console.log($('#display_message' + i));
								document.getElementById('display_message' + i).innerHTML = display_message;
								document.getElementById('comments').value = "";
								i++;
								
								 
								 });
								   
								
							
		
			

		
	</script>

</body>
</html>
