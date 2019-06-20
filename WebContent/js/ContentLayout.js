$(document).ready(function() {
    
    $('#quesasked').click(function(e) {
    	e.preventDefault();
    	$('#changeContent').load('quesasked.jsp');
    });


    $('#quesfollId').click(function(e) {
    	e.preventDefault(); 
    	$('#changeContent').load('quefollowed.jsp');
    });

    $('#ansId').click(function(e) {
    	e.preventDefault();
    	$('#changeContent').load('answers.jsp');
    });
    
   

    $('#alltopId').click(function(e) {
    	e.preventDefault();
    	$('#changeContent').load('all.jsp');
    });
   
    $('#alltimeId').click(function(e) {
    	e.preventDefault();
    	$('#changeContent').load('alltime.jsp');
    });

    $('#2019Id').click(function(e) {
    	e.preventDefault();
    	$('#changeContent').load('2019.jsp');
    });

    $('#newId').click(function(e) {
    	e.preventDefault();
    	$('#changeContent').load('newfirst.jsp');
    });

    $('#oldId').click(function(e) {
    	e.preventDefault();
    	$('#changeContent').load('oldfirst.jsp');
    });
    
});
    