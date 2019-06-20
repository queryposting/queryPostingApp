
$(document).ready(function() {
    $('#btn').click(function(event) {
      var textId = document.getElementById('textId').value;
      if(textId != null && textId != ""){
      	$('#answer').html('<span>'+textId+'</span>');
      	document.getElementById('textId').value = "";
      }

    });

    $('#bollywoodId').click(function(e) {
    	e.preventDefault();
    	$('#includedContent').load('bollywood.jsp');
    });

    $('#scienceId').click(function(e) {
    	e.preventDefault();
    	$('#includedContent').load('science.jsp');
    });

    $('#politicsId').click(function(e) {
    	e.preventDefault();
    	$('#includedContent').load('politics.jsp');
    });

    $('#sportsId').click(function(e) {
    	e.preventDefault();
    	$('#includedContent').load('sports.jsp');
    });

    $('#spaceId').click(function(e) {
    	e.preventDefault();
    	document.getElementById("space").className = "nav-item active";
    	document.getElementById("home").className = "nav-item";
    	document.getElementById("cont").className = "nav-item";
    	document.getElementById("profile").className = "nav-item";
    	$('#externalContent').load('space.jsp');
    });

    $('#profileId').click(function(e) {
    	e.preventDefault();
    	document.getElementById("profile").className = "nav-item active";
    	document.getElementById("home").className = "nav-item";
    	document.getElementById("space").className = "nav-item";
    	document.getElementById("cont").className = "nav-item";
    	$('#externalContent').load('quoraprofile.jsp');
    });

    $('#contentId').click(function(e) {
    	e.preventDefault();
    	document.getElementById("cont").className = "nav-item active";
    	document.getElementById("home").className = "nav-item";
    	document.getElementById("space").className = "nav-item";
    	document.getElementById("profile").className = "nav-item";
    	$('#externalContent').load('QuoraContentPage.jsp');
    });

    $('#answerId').click(function(e) {
    	e.preventDefault();
    	document.getElementById("ans").className = "nav-item active";
    	document.getElementById("home").className = "nav-item";
    	document.getElementById("cont").className = "nav-item";
    	document.getElementById("space").className = "nav-item";
    	$('#externalContent').load('answer1.jsp');
    });

    /*$('#submitBtn').click(function(event) {
    	var loginId = document.getElementById('exampleInputEmail1').value;
		var password = document.getElementById('exampleInputPassword1').value;

		if (loginId != "" && password != "") {
			//$('#loginUser').html('<h6>' + loginId + '</h6>');
			document.getElementById("loginFrm").submit();
		} else {
			alert("User Id and password cannot be blank");
		}
    });*/
    
    $('[data-toggle="popover"]').popover();
    
    /*$('.close-icon').on('click',function() {
	  $(this).closest('.card').fadeOut();
	  $('#unHide').toggle();
	});*/
    
   /* $('.ans').click(function(){
        $(this).toggle();
    	//console.log("called : ");
      });*/
//    var id = document.getElementById('hiddenVal').value;
//    console.log("id : " + id);
//    if(id != null && id != ""){
//    	ClassicEditor
//	    .create( document.querySelector( '#editor' ) )
//	    .catch( error => {
//	        console.error( error );
//	    } );
//    }

  });

function fetchData(){
	console.log("called.....");
	var searchData = document.getElementById('search').value;
	console.log("data....." + searchData);
	$.ajax({url: "search?question="+searchData, success: function(response){
	    $("#showData").html(response);
	  }});
}
var counter = 1;
function openEditor(id) {
	//var x = document.getElementById("myDiv" + id);
//	x.toggle();
	//alert
	$('#togDiv' + id).toggle();
	//console.log(id);
//	$('#myDiv' + id).show('slow',function(){
//		ClassicEditor
//	    .create( document.querySelector( '#editor' ) )
//	    .catch( error => {
//	        console.error( error );
//	    } );
//	});
	
	console.log("hiddenVal" + id +" : " + document.getElementById("hiddenVal" + id).value);
	    if(document.getElementById("hiddenVal" + id).value == 1) {
	  	  ClassicEditor
	  	    .create( document.querySelector( '#editor' + id ))
	  	    .catch( error => {
	  	        console.error( error );
	  	    } );
	  	  }
	    counter++;
	    document.getElementById("hiddenVal" + id).value = counter;
	  
	//counter++;
}

function toggleContent(id, contentId){
	$('#card' + id).fadeOut();
	$('#unHide' + id).toggle();
	/*$.ajax({url: "hide?contentId="+contentId, success: function(response){
	    //$("#showData").html(response);
	  }});*/
}

function unHide(id, contentId){
	$('#card' + id).fadeIn();
	$('#unHide' + id).toggle();
	/*$.ajax({url: "unHide?contentId="+contentId, success: function(response){
	    //$("#showData").html(response);
	  }});*/
}

function generateButton(id){
	var comment = document.getElementById('comment' + id).value;
	if(comment != null && comment != ""){
		$('#btnComment' + id).fadeIn();
	} else {
		$('#btnComment' + id).fadeOut();
	}
}

function postComment(id){
	var questionId = document.getElementById('questionId' + id).value;
	var comment = document.getElementById('comment' + id).value;
	console.log("questionId : " + questionId);
	console.log("comment : " + comment);
	$.ajax({url: "addcomment?questionId="+questionId+"&comment="+comment+"&rowId="+id, success: function(response){
		$("#commDiv" + id).html(response);
	  }});
	document.getElementById('comment' + id).value = "";
}

function deleteComment(commId, id, questionId){
	//console.log("commentId : " + commId);
	var commentId = commId.split(",")[0];
	var rowId = commId.split(",")[1];
	var quesId = commId.split(",")[2];
	console.log("commentId : " + commentId);
	$.ajax({url: "deletecomment?commentId="+commentId+"&questionId="+quesId+"&rowId="+rowId, success: function(response){
		$("#commDiv" + rowId).html(response);
	  }});
}