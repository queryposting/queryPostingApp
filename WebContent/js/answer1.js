
$(document).ready(function(){


	
	
  $("#answerBtn1").click(function(){
    $("#text_editor_window_1").toggle();
  });
  
  $("#answerBtn2").click(function(){
	    $("#text_editor_window_2").toggle();
	  });
  

  $("#cross").click(function(event) {
	  
    $("#feed1").hide();
    $("#negativeFeedbackWrapper1").show();
  });

  $("#negativeFeedbackUndo1").click(function(event) {

    $("#negativeFeedbackWrapper1").hide();
    $("#feed1").show();

  });
  

  $("#ignore1").click(function(event) {
	
    $("#feed1").hide();
    $("#ignoredQuestion1").show();

  });
  $("#undoQuestionWrapper1").click(function(event) {

    $("#ignoredQuestion1").hide();
    $("#feed1").show();

  });


  $("#downvote_que1").click(function(){
    $("#ignoredQuestion1").hide();

    $("#after_downvote1").show();
  });


  $("#undoDownvote1").click(function(){
    $("#after_downvote1").hide();

    $("#ignoredQuestion1").show();
  });


  $("#downvote_que_hide_story1").click(function(){
    $("#negativeFeedbackWrapper1").hide();
    $("#after_downvote1").show();
  });


});

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
	  	    .create( document.querySelector( '#editor' + id ) )
	  	    .catch( error => {
	  	        console.error( error );
	  	    } );
	  	  }
	    counter++;
	    document.getElementById("hiddenVal" + id).value = counter;
	  
	//counter++;
}
