<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src ="js/contentLayout.js"></script>
<style>

	/*a:hover {
  background-color: #808080;
}*/

/*a{
	background-color: #cccccc;
	
}*/
* {
  box-sizing:border-box;
}

	.box{	
	
		/*padding-bottom: 100px;*/
	}
.left {

  
  text-align: center; 
  
  margin-bottom: 20px;
  margin-left: 300px;
 
  padding: 20px;
  float:left;
  width:20%;   
}
.center{
	text-align: center;	
	padding-bottom: 50px;

}

 
</style>
</head>
<body>

	<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Quora</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">Answers<span class="sr-only">(current)</span></a>
      </li>

      <li class="nav-item active">
        <a class="nav-link" href="#">Notifications<span class="sr-only">(current)</span></a>
      </li>

   

      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Your Content Page</a>
      </li>

      

    </ul>
      	
   

    <form class="form-inline my-2 my-lg-0">

    

      <input class="form-control mr-sm-2" type="search" placeholder="Search Quora" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<hr> -->





	

<div class="left">

	<div class="box">
 <hr> <p><h3>By Content Type </h3></p> 
  <hr>

<!--   <a href="#">All Types</a><br><br> -->
  <a href="#" id="quesasked">Questions Asked</a><br><br>
  <a href="#" id ="quesfollId">Questions Followed</a><br><br> 
  <a href="#" id ="ansId">Answers</a><br><br>
  <!-- <a href="">Posts</a> -->
 
  <hr><p><h3>By Topic</h3></p>
  <hr>
  <a href="#" id="alltopId">All Topics</a><br><br>

   <input class="form-control mr-sm-2" type="search" placeholder="Search Quora" aria-label="Search"><br>
  
 <hr> <p><h3>By Year</h3></p><hr>
  <a href="#" id="alltimeId">All Time</a><br><br>
  <a href="#" id="2019Id">2019</a>
  
  <hr> <p><h3>Sort Order</h3></p><hr>
  <a href="#" id="newId">Newest First</a><br><br>
  <a href="#" id="oldId">Oldest First</a>





</div>
<br><br>

</div>

		 <div class="card-body" style="padding-left: 650px" id="changeContent">
    <h4 class="card-title" style = "text-align :center;" >Your Content</h4><hr>
    <!-- 
    <p class="card-text"> We have to write the Content here itself....</p></div> -->
</div>
</body>
</html>