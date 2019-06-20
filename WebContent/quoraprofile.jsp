<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Quora Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/quoracss.css">
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
  <style>
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
      <li class="nav-item">
        <a class="nav-link" href="#">Answer</a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="#">Spaces</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Notification</a>
      </li>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search here" aria-label="search">
        <button class="btn btn-outline-success my-0 my-sm-2" type="submit">Search</button>
      </form>
      <li class=" nav nav-item nav navbar-left">
        <a class="nav-link" href="#">Log out</a>
      </li>
      <ul class="nav navbar-nav nav navbar-left">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login Out</a></li>


      </ul>
  </div>
</nav>
 -->
 <br>
  <div class="container-fluid text=center">
 <div class="row content">
  
      <div class="col-md-1">
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#">Profile</a></li>
        
        <li><a href="#">Answers</a></li>
        <li><a href="#"> Shares</a></li>
        <li><a href="#"> Posts</a></li>
        <li><a href="#"> Blogs</a></li>
        <li><a href="#"> Followers</a></li>
        <li><a href="#"> Following</a></li>
      </ul>

     </div>
    <div class="col-sm-9 text-left"> 
      <div id="profile-container">
   <image id="profileImage" src="avatar.png" />
</div>
<input id="imageUpload" type="file" name="profile_photo" placeholder="Photo" required="" capture>
      <h2><small>Hello Quora user </small></h2>
      <hr>
<div class="container">
<div class="jumbotron">
  <h2>Complete your profile</h2>
  <hr>
  <p>Share where you live,work,study to find great questions and answers</p>  
</div>

</div>
</div>
      <div class="col-md-1 ">
      <ul class="nav nav-pills nav-stacked">
        <h3><small>Credentials & Highlights <span class="glyphicon glyphicon-pencil"></small></h3>
        <hr>
        <li><a href="#"> Employee Credential</a></li>
        <li><a href="#"> Education Credentials</a></li>
        <li><a href="#"> Add location Credentials</a></li>
        <hr>

        <h3><small>Know About</small></h3>
      </ul>

     </div>
</div>
</div>
<br>
<!-- <div class="page-footer font-small bg-dark" style="height:8%;">
  <p>Copy rights by quora.inc</p>
</div> -->
</body>
<script src="profileScript.js"></script>
</html>
    
