
<!DOCTYPE html>
<html>
 <head>
  <title>Search Me</title>
  <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet"> 
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
<!-- <script src="js/login_effect.js"></script> -->
  <style>
   body{
    background: #EAE5E5;
   }
   .container{
    margin-top: 200px;
   }
   .glyphicon-search{
    font-size: 20px;
   }
   .btn-default{
    background: #A60000;
    width: 100px;
    padding: 12.5px;
   }
   .form-control{
    padding: 12px;
    font-size: 20px;
   }
   .ml2 {
  font-weight: 900;
  font-size: 3.5em;
}

.ml2 .letter {
  display: inline-block;
  line-height: 1em;
}
  </style>
  

  </head>
  <body>
   <div class="container">
    <h1 class="ml2" style="font-size: 125px; color: #A60000; font-family: 'Dancing Script', cursive;">QUORAAAA.....
    </h1>

    <form action="search" oninput="fetchData();">
     <div class="input-group">
     <input type="text" class="form-control" id="search" placeholder="Search" name="search" data-target="#searchRes">
     <div class="input-group-btn">
     <button class="btn btn-default" type="submit">
     <i class="glyphicon glyphicon-search">Search</i></button>
    </div>
   </div>
	
    </form>
	
   </div>

<!-- <div class="dropdown">
		<div class="dropdown-menu" aria-labelledby="search" id="searchRes">
			
		</div>
	</div> -->

<div id="searchRes"></div>
</body>

</html>


<script type="text/javascript">
  // Wrap every letter in a span
$('.ml2').each(function(){
  $(this).html($(this).text().replace(/([^\x00-\x80]|\w)/g, "<span class='letter'>$&</span>"));
});

anime.timeline({loop: true})
  .add({
    targets: '.ml2 .letter',
    scale: [4,1],
    opacity: [0,1],
    translateZ: 0,
    easing: "easeOutExpo",
    duration: 950,
    delay: function(el, i) {
      return 70*i;
    }
  }).add({
    targets: '.ml2',
    opacity: 0,
    duration: 1000,
    easing: "easeOutExpo",
    delay: 1000
  });
  
  
function fetchData(){
	console.log("called.....");
	var searchData = document.getElementById('search').value;
	console.log("data....." + searchData);
	$.ajax({url: "search?question="+searchData, success: function(response){
		//console.log("response : "+ response)
	    $("#searchRes").html(response);
	  }});
}
</script> 